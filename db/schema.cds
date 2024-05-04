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
        ImageUrl     : String(600) @UI.IsImageURL;
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
        Supplier     : Association to Suppliers;
};

entity Details : cuid {
    Unit    : String(20);
    Height  : Decimal(10, 2);
    Width   : Decimal(10, 2);
    Depth   : Decimal(10, 2);
    Weight  : Decimal(10, 2);
    Product : Association to Products;
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
