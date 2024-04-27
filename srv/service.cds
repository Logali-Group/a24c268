using {com.logaligroup as call} from '../db/schema';

service ServiceCatalog {
    entity SuppliersSet     as projection on call.Suppliers;
    entity ContactsSet      as projection on call.Contacts;
    entity ProductsSet      as projection on call.Products;
    entity DetailsSet       as projection on call.Details;
    entity VH_CategoriesSet as projection on call.VH_Categories;
};
