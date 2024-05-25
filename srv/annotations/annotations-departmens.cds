using {ServiceCatalog as call} from '../service';

annotate call.VH_Departments with {
    ID  @title:'Department' @Common: {
        Text : Department,
        TextArrangement : #TextOnly,
    }
};
