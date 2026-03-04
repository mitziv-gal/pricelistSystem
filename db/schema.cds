namespace com.sap.pricelistsystem;

using {
    managed,
    cuid,
    Currency
} from '@sap/cds/common';

/** Directory for the List of tables for Data Maintenance Application */
entity MaintenanceTableDirectory : managed, cuid {
    tableName   : String(100) @title: 'Table Name';
    description : String(255) @title: 'Description';
}

/** Trade and Market Scenario Determination **/
entity TradeAndMarketScenarioDetermination : managed, cuid {
    TradeScenario      : String(255) @title: 'Trade Scenario';
    MarketScopeRegion  : String(255) @title: 'Market Scope Region';
    MarketScopeCountry : String(3)   @title: 'Market Scope Country';
}

/** Pricelist Item Structure Components **/
entity PricelistItemStructureComponents : managed, cuid {
    TradeScenario      : String(255) @title: 'Trade Scenario';
    MarketScopeRegion  : String(255) @title: 'Region';
    MarketScopeCountry : String(3)   @title: 'Country';
    SalesOrg           : String(4)   @title: 'Sales Organization';
    DistChannel        : String(2)   @title: 'Distribution Channel';
    CustPriceList      : String(20)  @title: 'Customer Pricelist';
    CustGroup1         : String(255) @title: 'Customer Group 1';
    ErpCustomer        : String(255) @title: 'ERP Customer';
    DeliveringPlant    : String(255) @title: 'Plant';
    MainCategory       : String(255) @title: 'Main Category';
    Subcategory1       : String(255) @title: 'Subcategory 1';
    Subcategory2       : String(255) @title: 'Subcategory 2';
    Subcategory3       : String(255) @title: 'Subcategory 3';
    Subcategory4       : String(255) @title: 'Subcategory 4';
    Subcategory5       : String(255) @title: 'Subcategory 5';
}

/** Pricelist Part Number Determination **/
entity PricelistPartNumberDetermination : managed, cuid {
    MainCategory        : String(255) @title: 'Main Category';
    Subcategory1        : String(255) @title: 'Subcategory 1';
    Subcategory2        : String(255) @title: 'Subcategory 2';
    Subcategory3        : String(255) @title: 'Subcategory 3';
    Subcategory4        : String(255) @title: 'Subcategory 4';
    Subcategory5        : String(255) @title: 'Subcategory 5';
    PricelistPartNumber : String(30)  @title: 'Pricelist Part Number';
    ProductHierarchy3   : String(255) @title: 'Product Hierarchy 3';
    ProductHierarchy2   : String(255) @title: 'Product Hierarchy 2';
    ProductHierarchy1   : String(255) @title: 'Product Hierarchy 1';
}

/** Terms and Condition Determination **/
entity TermsAndConditionDetermination : managed, cuid {
    TradeScenario             : String(255) @title: 'Trade Scenario';
    MarketScopeRegion         : String(255) @title: 'Region';
    MarketScopeCountry        : String(3)   @title: 'Country';
    SalesOrg                  : String(4)   @title: 'Sales Organization';
    DistChannel               : String(2)   @title: 'Distribution Channel';
    CustPriceList             : String(20)  @title: 'Customer Pricelist';
    CustGroup1                : String(255) @title: 'Customer Group 1';
    ErpCustomer               : String(255) @title: 'ERP Customer';
    DeliveringPlant           : String(255) @title: 'Plant';
    TermsAndConditionCategory : String(255) @title: 'Terms and Conditions Category';
    PricelistFieldName        : String(255) @title: 'Pricelist Fieldname';
    PricelistDataLevel        : String(255) @title: 'Pricelist Data Level';
}

/** Pricing Parameter Determination **/
entity PricingParameterDetermination : managed, cuid {
    TradeScenario            : String(255) @title: 'Trade Scenario';
    MarketScopeRegion        : String(255) @title: 'Region';
    MarketScopeCountry       : String(3)   @title: 'Country';
    SalesOrg                 : String(4)   @title: 'Sales Organization';
    DistChannel              : String(2)   @title: 'Distribution Channel';
    CustPriceList            : String(20)  @title: 'Customer Pricelist';
    CustGroup1               : String(255) @title: 'Customer Group 1';
    ErpCustomer              : String(255) @title: 'ERP Customer Code';
    DeliveringPlant          : String(255) @title: 'Plant';
    ErpPriceCondition        : String(20)  @title: 'ERP Price Condition';
    ErpPricingAccessSequence : String(255) @title: 'ERP Pricing Access Sequence';
}

/** Information Tile Content **/
entity InformationTileContent : managed, cuid {
    TradeScenario      : String(255) @title: 'Trade Scenario';
    MarketScopeRegion  : String(255) @title: 'Region';
    MarketScopeCountry : String(3)   @title: 'Country';
    InformationHeading : String(30)  @title: 'Information Heading';
    InformationDetails : String(100) @title: 'Information Details';
    ImageLink          : String(255) @title: 'Image Link';
}

/** Contact Information **/
entity ContactInformation : managed, cuid {
    TradeScenario      : String(255) @title: 'Trade Scenario';
    MarketScopeRegion  : String(255) @title: 'Region';
    MarketScopeCountry : String(3)   @title: 'Country';
    ContactEmail       : String(255) @title: 'Contact E-Mail';
    ContactNumber      : String(30)  @title: 'Contact Number';
}

/** Pricelist Table */
entity PricelistData : managed, cuid {
    CustPriceList      : String(20)  @title: 'Customer Pricelist';
    TradeScenario      : String(255) @title: 'Trade Scenario';
    MarketScopeRegion  : String(255) @title: 'Region';
    MarketScopeCountry : String(3)   @title: 'Country';
    SalesOrg           : String(4)   @title: 'Sales Organization';
    DistChannel        : String(2)   @title: 'Distribution Channel';
    CustGroup1         : String(255) @title: 'Customer Group 1';
    ErpCustomer        : String(255) @title: 'ERP Customer Code';
    DeliveringPlant    : String(255) @title: 'Plant';
    Status             : String(20)  @title: 'Status';
    PublishedBy        : String(255) @title: 'Published By';
    PublishedDate      : Date        @title: 'Published Date';
    EffectiveDate      : Date        @title: 'Effectivity Date';
    ExpiryDate         : Date        @title: 'Expiry Date';
    Currency           : Currency    @title: 'Currency';
    Version            : String(20)  @title: 'Version';

    MarketDisplay      : String      @title: 'Market Region'  @cds.persistence.skip; //Virtual Field

    // Composition: Pricelist owns its items
    items : Composition of many PricelistItemData on items.parent = $self;
}

entity PricelistItemData : managed, cuid {
    parent : Association to PricelistData;

    PricelistPartNumber : String(30)  @title: 'Pricelist Part Number';
    MainCategory        : String(255) @title: 'Main Category';
    Subcategory1        : String(255) @title: 'Subcategory 1';
    Subcategory2        : String(255) @title: 'Subcategory 2';
    Subcategory3        : String(255) @title: 'Subcategory 3';
    Subcategory4        : String(255) @title: 'Subcategory 4';
    Subcategory5        : String(255) @title: 'Subcategory 5';
    ProductHierarchy1   : String(255) @title: 'Product Hierarchy 1';
    ProductHierarchy2   : String(255) @title: 'Product Hierarchy 2';
    ProductHierarchy3   : String(255) @title: 'Product Hierarchy 3';

    TermsAndConditionCategory : String(255) @title: 'Terms and Conditions Category';
    PricelistFieldName        : String(255) @title: 'Pricelist Fieldname';
    PricelistDataLevel        : String(255) @title: 'Pricelist Data Level';
}
