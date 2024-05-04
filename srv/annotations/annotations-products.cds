using {ServiceCatalog as call} from '../service';

using from './annotations-suppliers';
using from './annotations-details';

annotate call.ProductsSet with {
    Category @Common: {
        Text : Category.name,
        TextArrangement : #TextOnly,
    };
    SubCategory @Common: {
        Text :SubCategory.name,
        TextArrangement : #TextOnly,
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
};

annotate call.ProductsSet with @(
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
                Value : Supplier.SupplierName,
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
        // {
        //     $Type : 'UI.ReferenceFacet',
        //     Target : 'Detail/@UI.Fieldgroup#Details',
        // },
    ]
);
