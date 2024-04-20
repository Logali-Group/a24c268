
namespace com.logaligroup;

entity Products {
    key ID           : Int16;
        Product      : String(80);
        Description  : String(1255);
        Category     : String;
        SubCategory  : String;
        Availibality : String;
        Rating       : Double;
        Price        : Decimal(2, 2);
};