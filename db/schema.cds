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
};

entity Contacts : cuid {
    FullName    : String(80);
    Email       : String(80);
    PhoneNumber : String(12);
    Supplier    : Association to Suppliers;
};

entity Products : cuid, managed {
    ImageUrl     : String(600);
    Product      : String(80);
    Description  : String(1255);
    Category     : String;
    SubCategory  : String;
    Availibality : String;
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

entity VH_Categories : cuid, CodeList {};
