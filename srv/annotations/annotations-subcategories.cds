using {ServiceCatalog as call} from '../service';

annotate call.VH_SubCategories with {
    ID @Common: {
        Text : name,
        TextArrangement : #TextOnly,
    }
};
