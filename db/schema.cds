namespace com.logaligroup;

using {
    cuid,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';

entity Suppliers : cuid, managed {
    Supplier     : String(200);
    SupplierName : String(80);
    WebAddress   : String(255);
    Contact      : Association to Contacts;
};

entity Contacts : cuid {
    FullName    : String(80);
    Email       : String(80);
    PhoneNumber : String(12);
};

entity Products : cuid, managed {
        ImageUrl     : LargeBinary @UI.IsImage @Core.MediaType: 'image/jpg';
    key Code         : String(7);
        Product      : String(80);
        Accessory    : String(80);
        Description  : String(1255);
        Category     : Association to VH_Categories;
        SubCategory  : Association to VH_SubCategories;
        Stock        : Int16;
        Criticality  : Int16;
        Availibality : Association to VH_Status;
        Rating       : Double;

        @Measures.Unit: Unit
        Price        : Decimal(10, 2);

        @Common.IsCurrency
        Unit         : String(3) default 'USD';
        Supplier     : Association to Suppliers; //Supplier_ID
        Details      : Composition of Details;
        ToReviews    : Composition of many Reviews
                           on ToReviews.Product = $self;
        ToStock      : Composition of many Stock
                           on ToStock.Product = $self;
};

entity Reviews : cuid, managed {
    Rating     : Decimal(4, 2);
    Date       : Date;
    User       : String;
    ReviewText : String;
    Helpful    : String;
    Product    : Association to Products; // Almacena el ID del producto
};

entity Stock : cuid, managed {
    StockNumber : String;
    Department  : Association to VH_Departments;
    Min         : Decimal(10, 2);
    Max         : Decimal(10, 2);
    Value       : Decimal(10, 2);
    LotSize     : Decimal(10, 2) @Measures.Unit: UnitMeasure;
    Quantity    : Decimal(10, 2) @Measures.Unit: UnitMeasure;
    UnitMeasure : String(20)     @Common.IsUnit default 'EA';
    Product     : Association to Products; // Almacena el ID del producto Product_ID Product_Code
                  //Composition of Products; // Almacena el ID del producto
};


entity Details : cuid {
    BaseUnit   : String(20) default 'EA';
    Height     : Decimal(10, 2)         @Measures.Unit: VolumeUnit;
    Width      : Decimal(10, 2)         @Measures.Unit: VolumeUnit;
    Depth      : Decimal(10, 2)         @Measures.Unit: VolumeUnit;
    VolumeUnit : String(2) default 'CM' @Common.IsUnit;
    Weight     : Decimal(10, 2)         @Measures.Unit: WeightUnit;
    WeightUnit : String default 'KG'    @Common.IsUnit;
};


entity VH_Categories : cuid, CodeList {
    ToSubcategories : Composition of many VH_SubCategories
                          on ToSubcategories.Category = $self;
};

entity VH_SubCategories : cuid, CodeList {
    Category : Association to VH_Categories; //Almacena el ID de la categoria
};

entity VH_Status : CodeList {
    key code : String enum {
            InStock         = 'In stock';
            NotInStock      = 'Not in stock';
            LowAvailability = 'Low availability';
        };
};

entity VH_Departments: cuid {
    Department: String;
};
