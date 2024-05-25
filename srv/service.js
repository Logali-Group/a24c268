const cds = require('@sap/cds');
const moment = require('moment');

module.exports = class Service extends cds.ApplicationService {

    async init () {

        const {ProductsSet, ReviewsSet, StockSet, BusinessPartner} = this.entities;
        const external = await cds.connect.to("API_BUSINESS_PARTNER");

        //before
        //on
        //after
        this.on('READ', BusinessPartner, async req =>{
            return await external.transaction(req).send({
                query: req.query,
                headers: {
                    apiKey: process.env.API_KEY
                }
            });
        });


        this.before('NEW', ReviewsSet.drafts, req=>{
            console.log("Estoy dentro de Reviews");
            req.data.Date = moment().format("YYYY-MM-DD");
            console.log(req.data);
        });

        this.before('NEW', StockSet.drafts, async req=>{
            console.log("Estoy creando un nuevo inventario");
            console.log(req.data);
            //Product_ID
            //StockNumber
            let oSearch = await SELECT.one.from(StockSet.drafts).columns(`max(StockNumber) as Max`).where({Product_ID: req.data.Product_ID});
            const iNextNumber = Number(oSearch.Max) + 1;
            req.data.StockNumber = iNextNumber;
        });


        this.before('NEW', ProductsSet.drafts, async req => {
            req.data.Details??= {
                Height: 0.00,
                Width: 0.00,
                Depth: 0.00,
                Weight: 0.00
            }
        });

        this.after('UPDATE',ProductsSet.drafts, async req =>{

            if (req.Availibality_code) {
                switch (req.Availibality_code) {
                    case 'In stock':
                        console.log("Se debe actualizar el campo Criticality a: 1");
                        await update(req.ID, 1);
                    break;
                    case 'Not in stock':
                        console.log("Se debe actualizar el campo Criticality a: 3");
                        await update(req.ID, 3);
                    break;
                    case 'Low availability':
                        console.log("Se debe actualizar el campo Criticality a: 2");
                        await update(req.ID, 2);
                    break;
                } 
            }
        });



        return super.init();
    }

};

async function update (iID, iCode) {
    return await cds.run(UPDATE.entity`ServiceCatalog.ProductsSet.drafts`.set({Criticality: iCode}).where({ID: iID}));
};