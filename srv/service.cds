using {com.logaligroup as call} from '../db/schema';

service ServiceCatalog {
    entity ProductsSet as projection on call.Products;
    entity VH_CategoriesSet as projection on call.VH_Categories;
};