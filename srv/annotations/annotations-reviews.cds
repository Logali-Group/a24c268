using {ServiceCatalog as call} from '../service';

annotate call.ReviewsSet with {
    Rating     @title: 'Rating';
    Date       @title: 'Date';
    User       @title: 'User' @Common.Text: Date;
    ReviewText @title: 'Review Text';
    Helpful    @title: 'Helpful';
};

annotate  call.ReviewsSet with @(
    Common.SemanticKey:[
        User
    ],
    UI.HeaderInfo:{
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Review',
        TypeNamePlural : 'Reviews',
    },
    UI.LineItem: [
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint',
            ![@HTML5.CssDefaults] : {
                $Type : 'HTML5.CssDefaultsType',
                width : '8rem',
            },
        },
        {
            $Type : 'UI.DataField',
            Value : User,
        },
        {
            $Type : 'UI.DataField',
            Value : ReviewText,
        },
        {
            $Type : 'UI.DataField',
            Value : Helpful,
        },
    ],
    UI.DataPoint:{
        $Type : 'UI.DataPointType',
        Value: Rating,
        Visualization: #Rating
    },
    UI.FieldGroup: {
        $Type : 'UI.FieldGroupType',
            Data : [
            {
                $Type : 'UI.DataField',
                Value : Rating,
            },
            {
                $Type : 'UI.DataField',
                Value : Date,
            },
            {
                $Type : 'UI.DataField',
                Value : ReviewText,
            },
            {
                $Type : 'UI.DataField',
                Value : Helpful,
            },
        ],
    },
    UI.Facets: [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup',
            Label : 'Reviews',
        },
    ]
);

