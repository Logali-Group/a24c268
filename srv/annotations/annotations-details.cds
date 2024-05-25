using {ServiceCatalog as call} from '../service';

annotate call.DetailsSet with {
    Height @title: 'Height';
    Width  @title: 'Width';
    Depth  @title: 'Depth';
    Weight @title: 'Weight';
    BaseUnit   @title: 'Base Unit' @Common.FieldControl: #ReadOnly;
    VolumeUnit @Common.FieldControl: #ReadOnly;
    WeightUnit @Common.FieldControl: #ReadOnly;
};

annotate call.DetailsSet with @(
    UI.FieldGroup #Details:{
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : BaseUnit,
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