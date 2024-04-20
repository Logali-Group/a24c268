
namespace com.logaligroup;

using {
    cuid,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';

entity Products : cuid, managed {
        Product      : String(80);
        Description  : String(1255);
        Category     : String;
        SubCategory  : String;
        Availibality : String;
        Rating       : Double;
        Price        : Decimal(2, 2);
};

entity VH_Categories : cuid, CodeList {
};
