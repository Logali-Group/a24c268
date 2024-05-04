using {ServiceCatalog as call} from '../service';

annotate call.VH_CategoriesSet with {
    ID @Common: {
        Text : name,
        TextArrangement : #TextOnly,
    }
};
