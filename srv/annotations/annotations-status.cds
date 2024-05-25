using {ServiceCatalog as call} from '../service';

annotate call.VH_Status with {
    code @title:'Statu' @Common: {
        Text : name,
        TextArrangement: #TextOnly,
    }
};
