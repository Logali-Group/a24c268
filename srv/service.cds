using {com.logaligroup as call} from '../db/schema';
using {API_BUSINESS_PARTNER as external} from './external/API_BUSINESS_PARTNER';

service ServiceCatalog {
    entity SuppliersSet     as projection on call.Suppliers;
    entity ContactsSet      as projection on call.Contacts;
    entity ProductsSet      as projection on call.Products;
    entity ReviewsSet       as projection on call.Reviews;
    entity StockSet         as projection on call.Stock order by StockNumber;
    entity DetailsSet       as projection on call.Details;
    entity VH_CategoriesSet as projection on call.VH_Categories;
    entity VH_Departments as projection on call.VH_Departments;
    entity BusinessPartner as projection on external.A_BusinessPartner {
        key BusinessPartner,
            LastName,
            FirstName
    }
};
