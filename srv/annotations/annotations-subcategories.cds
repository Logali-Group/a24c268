using {ServiceCatalog as call} from '../service';

annotate call.VH_SubCategories with {
    ID @title : 'Sub-Category' @Common: {
        Text : name,
        TextArrangement : #TextOnly,
    }
};
