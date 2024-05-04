using {ServiceCatalog as call} from '../service';

annotate call.DetailsSet with {
    Height @title: 'Height';
    Width  @title: 'Width';
    Depth  @title: 'Depth';
    Weight @title: 'Weight';
    Unit   @title: 'Base Unit';
};

annotate call.DetailsSet with @(
    UI.FieldGroup #Details:{
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Unit,
            },
            {
                $Type : 'UI.DataField',
                Value : Height
            },
            {
                $Type : 'UI.DataField',
                Value : Width,
            },
            {
                $Type : 'UI.DataField',
                Value : Depth,
            },
            {
                $Type : 'UI.DataField',
                Value : Weight,
            },
        ],
    }
);