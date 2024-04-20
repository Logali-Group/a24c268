using {com.logaligroup as call} from '../db/schema';

service ServiceCatalog {
    entity ProductsSet as projection on call.Products;
};