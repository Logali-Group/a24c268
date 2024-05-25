using {ServiceCatalog as call} from '../service';

annotate call.VH_CategoriesSet with {
    ID  @title:'Category' @Common: {
        Text : name,
        TextArrangement : #TextOnly,
    }
};
