using {ServiceCatalog as call} from '../service';

using from './annotations-suppliers';
using from './annotations-details';
using from './annotations-reviews';
using from './annotations-stock';

annotate call.ProductsSet with @odata.draft.enabled;

annotate call.ProductsSet with {
    Category @Common: {
        Text : Category.name,
        TextArrangement : #TextOnly,
        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'VH_CategoriesSet',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Category_ID,
                    ValueListProperty : 'ID',
                },
            ],
        },
    };
    SubCategory @Common: {
        Text :SubCategory.name,
        TextArrangement : #TextOnly,
        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'VH_SubCategories',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterIn',
                    LocalDataProperty : Category_ID,
                    ValueListProperty : 'Category_ID',
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    LocalDataProperty : SubCategory_ID,
                    ValueListProperty : 'ID',
                },
            ],
        },
    };
    Supplier @Common:{
        Text : Supplier.SupplierName,
        TextArrangement : #TextOnly,
        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'SuppliersSet',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Supplier_ID,
                    ValueListProperty : 'ID',
                },
            ],
        },
    }
};

annotate call.ProductsSet with {
    ImageUrl     @title: 'Image';
    Product      @title: 'Product';
    Description  @title: 'Descripcion'  @UI.MultiLineText;
    Category     @title: 'Category';
    SubCategory  @title: 'Sub-Category';
    Availibality @title: 'Availibality';
    Rating       @title: 'Average Rating';
    Price        @title: 'Price per Unit';
    Supplier     @title: 'Supplier';
    Unit @Common.FieldControl: #ReadOnly;
};

annotate call.ProductsSet with @(
    Common.SideEffects  : {
        $Type : 'Common.SideEffectsType',
        SourceProperties : [
            Supplier_ID
        ],
        TargetEntities : [
            Supplier
        ],
    },
    UI.SelectionFields: [
        Supplier_ID,
        Category_ID
    ],
    UI.HeaderInfo:{
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Product',
        TypeNamePlural : 'Products',
        Title : {
            $Type : 'UI.DataField',
            Value : Product,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : Code,
        }
    },
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : ImageUrl,
            ![@HTML5.CssDefaults] : {
                $Type : 'HTML5.CssDefaultsType',
                width : '6rem',
            }
        },
        {
            $Type : 'UI.DataField',
            Value : Accessory
        },
        {
            $Type : 'UI.DataField',
            Value : Category_ID
        },
        {
            $Type : 'UI.DataField',
            Value : SubCategory_ID
        },
        {
            $Type : 'UI.DataField',
            Value : Availibality_code,
            Criticality : Criticality,
            ![@HTML5.CssDefaults] : {
                $Type : 'HTML5.CssDefaultsType',
                width : '8rem',
            }
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint',
            ![@HTML5.CssDefaults] : {
                $Type : 'HTML5.CssDefaultsType',
                width : '8rem',
            }
        },
        {
            $Type : 'UI.DataField',
            Value : Price
        }
    ],
    UI.DataPoint:{
        $Type : 'UI.DataPointType',
        Value : Rating,
        Visualization: #Rating
    },
    UI.FieldGroup #Image: {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ImageUrl,
                Label : '',
            },
        ],
    },
    UI.FieldGroup #Category:{
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Category_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : SubCategory_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : Supplier_ID,
            },
        ],
    },
    UI.FieldGroup #Description: {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Description
            },
        ],
    },
    UI.FieldGroup #Stock: {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Availibality_code,
                Criticality : Criticality,
                Label : '',
            },
        ],
    },
    UI.FieldGroup #Price:{
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Price,
                Label : '',
            },
        ],
    },
    UI.HeaderFacets: [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Image',
            Label : '',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Category',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Description',
            Label : 'Product Description',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Stock',
            Label: 'Availability'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Price',
            Label: 'Price'
        },
    ],
    UI.Facets:[
        {
            $Type : 'UI.CollectionFacet',
            Facets : [
                    {
                        $Type : 'UI.CollectionFacet',
                        Facets : [
                            {
                                $Type : 'UI.ReferenceFacet',
                                Target : 'Supplier/@UI.FieldGroup#Supplier',
                                Label : 'Information',
                            },
                            {
                                $Type : 'UI.ReferenceFacet',
                                Target : 'Supplier/Contact/@UI.FieldGroup#Contacts',
                                Label : 'Contact Person'
                            },
                        ],
                        Label : 'Supplier Information',
                    },
            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'Details/@UI.FieldGroup#Details',
            Label : 'Product Information',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'ToReviews/@UI.LineItem',
            Label : 'Reviews',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'ToStock/@UI.LineItem',
            Label : 'Inventory Information',
        },
    ]
);
