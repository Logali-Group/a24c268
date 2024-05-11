using {ServiceCatalog as call} from '../service';

annotate call.StockSet with {
    StockNumber @title: 'Stock Bin Number';
    Department  @title: 'Department';
    Value       @title: 'Value';
    LotSize     @title: 'Lot Size';
    Quantity    @tile : 'Ordered Quantity' @UI.Hidde @Common.FieldControl;
};

annotate call.StockSet with @(
    Common.SemanticKey:[
        StockNumber
    ],
    UI.HeaderInfo:{
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Stock Data',
        TypeNamePlural: 'Stock Data'
    },
    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Value : StockNumber,
        },
        {
            $Type : 'UI.DataField',
            Value : Department,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.Chart#Bullet',
            Label : 'Stock',
        },
        {
            $Type : 'UI.DataField',
            Value : LotSize,
        },
        {
            $Type : 'UI.DataField',
            Value : Quantity,
        },
    ],
    UI.DataPoint #DataPointBullet:{
        $Type : 'UI.DataPointType',
        Value: Value,
        MaximumValue: Max,
        MinimumValue: Min,
        CriticalityCalculation : {
            $Type : 'UI.CriticalityCalculationType',
            ImprovementDirection : #Maximize,
            ToleranceRangeLowValue : Max,
            DeviationRangeLowValue : 20,
        },
    },
    UI.Chart #Bullet:{
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bullet,
        Measures:[
            Value
        ],
        MeasureAttributes:[
            {
                $Type : 'UI.ChartMeasureAttributeType',
                DataPoint : '@UI.DataPoint#DataPointBullet',
                Measure : Value,
            },
        ]
    },
    UI.FieldGroup:{
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : StockNumber,
            },
            {
                $Type : 'UI.DataField',
                Value : Department,
            },
            {
                $Type : 'UI.DataField',
                Value : Min,
            },
            {
                $Type : 'UI.DataField',
                Value : Max,
            },
            {
                $Type : 'UI.DataField',
                Value : Value,
            },
            {
                $Type : 'UI.DataField',
                Value : LotSize,
            },
            {
                $Type : 'UI.DataField',
                Value : Quantity,
            },
        ],
    },
    UI.Facets:[
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup',
            Label : 'Inventory Information',
        },
    ]
);

