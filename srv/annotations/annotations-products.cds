using {ServiceCatalog as call} from '../service';

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
        Category
    ],
    UI.HeaderInfo:{
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Product',
        TypeNamePlural : 'Products',
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
            Value : Product
        },
        {
            $Type : 'UI.DataField',
            Value : Category
        },
        {
            $Type : 'UI.DataField',
            Value : SubCategory
        },
        {
            $Type : 'UI.DataField',
            Value : Availibality,
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
    }
);
