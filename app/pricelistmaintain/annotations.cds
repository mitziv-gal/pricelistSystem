using PriceListService as service from '../../srv/service';

annotate service.PricelistData with @(

    // --- LIST PAGE ANNOTATIONS ---
    UI.SelectionFields : [ CustPriceList, Status, PublishedDate ],

    UI.LineItem : [
        { $Type: 'UI.DataField', Value: CustPriceList },
        { $Type: 'UI.DataField', Value: Status },
        { Value: MarketDisplay, Label: 'Market Region' },
        { $Type: 'UI.DataField', Value: PublishedDate },
        { $Type: 'UI.DataField', Value: Version }
    ],

    // --- OBJECT PAGE ANNOTATIONS ---
    UI.HeaderInfo : {
        TypeName      : 'Pricelist',
        TypeNamePlural: 'Pricelists',
        Title         : { Value: CustPriceList },
        Description   : { Value: Version },
        ImageUrl      : 'sap-icon://sales-order-item'
    },

    UI.HeaderFacets : [
        { $Type: 'UI.ReferenceFacet', ID: 'DatesFacet', Target: '@UI.FieldGroup#DatesGroup' },
        { $Type: 'UI.ReferenceFacet', ID: 'UsersFacet', Target: '@UI.FieldGroup#UsersGroup' },
        { $Type: 'UI.ReferenceFacet', ID: 'AdminFacet', Target: '@UI.FieldGroup#AdminGroup' },
        { $Type: 'UI.ReferenceFacet', ID: 'CurrencyFacet', Target: '@UI.FieldGroup#CurrencyGroup' }
    ],

    // Tabs
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Pricelist Information',
            ID    : 'PricelistInfoFacet',
            Facets: [
                { 
                    $Type : 'UI.ReferenceFacet', 
                    Label : '', 
                    Target: '@UI.FieldGroup#GeneralInfo' 
                },

                { 
                    $Type : 'UI.CollectionFacet', 
                    ID : 'ScopeContainer', 
                    Label : '', 
                    Facets: [
                        { $Type : 'UI.ReferenceFacet', Label : 'Market Scope', Target: '@UI.FieldGroup#MarketScope' },
                        { $Type : 'UI.ReferenceFacet', Label : 'Commercial Scope', Target: '@UI.FieldGroup#CommercialScope' }
                ]},

                { $Type : 'UI.ReferenceFacet', Label : 'Products', Target: 'items/@UI.LineItem' }
            ]
        },
        { $Type : 'UI.ReferenceFacet', Label : 'Terms, Definitions and Conditions', Target: 'items/@UI.FieldGroup#TermsConditions' }
    ],

    UI.FieldGroup #DatesGroup : { Data: [
        { Value: createdAt, Label: 'Created on' },
        { Value: modifiedAt, Label: 'Last Revised On' },
        { Value: PublishedDate, Label: 'Published On' }
    ]},

    UI.FieldGroup #UsersGroup : { Data: [
        { Value: createdBy, Label: 'Created By' },
        { Value: modifiedBy, Label: 'Revised By' },
        { Value: PublishedBy, Label: 'Published By' }
    ]},

    UI.FieldGroup #AdminGroup : { Data: [
        { Value: Version, Label: 'Version' },
        { Value: Status, Label: 'Status' }
    ]},

    UI.FieldGroup #CurrencyGroup : { Data: [
        { Value: Currency_code, Label: 'Currency' }
    ]},

    UI.FieldGroup #GeneralInfo : {
        Data: [
            { Value: CustPriceList },
            { Value: EffectiveDate },
            { Value: ExpiryDate }
        ]
    },

    UI.FieldGroup #MarketScope : {
        Data: [
            { Value: TradeScenario, Label: 'Trade Scenario' },
            { Value: MarketScopeRegion, Label: 'Region' },
            { Value: MarketScopeCountry, Label: 'Country' }
        ]
    },

    UI.FieldGroup #CommercialScope : {
        Data: [
            { Value: SalesOrg, Label: 'Sales Org' },
            { Value: DistChannel, Label: 'Dist. Channel' },
            { Value: CustPriceList, Label: 'Cust. Price List' },
            { Value: CustGroup1, Label: 'Cust. Group 1' },
            { Value: ErpCustomer, Label: 'Customer Code' },
            { Value: DeliveringPlant, Label: 'Delivering Plant' }
        ]
    },

    //Creation Dialog
    UI.FieldGroup #CreatePricelist: {
        Data : [
            { Value: CustPriceList },
            { Value: MarketScopeRegion },
            { Value: MarketScopeCountry }
        ]
    }

    /* //Actions
    UI.Identification : [
        {
        $Type : 'UI.DataFieldForAction',
        Action : 'price-list.PublishPricelist',
        Label  : 'Publish',
        Determining : true
        }
    ] */
);

// Annotation for item data
annotate service.PricelistItemData with @(
    UI.LineItem : [
        { Value : PricelistPartNumber },
        { Value : MainCategory },
        { Value : Subcategory1 },
        { Value : Subcategory2 },
        { Value : Subcategory3 },
        { Value : Subcategory4 },
        { Value : Subcategory5 },
        { Value : ProductHierarchy1 },
        { Value : ProductHierarchy2 },
        { Value : ProductHierarchy3 }
    ],
    UI.PresentationVariant : {
        Visualizations : ['@UI.LineItem'],
        GroupBy : [ // This creates the "Tree" effect
            MainCategory,
            Subcategory1,
            Subcategory2,
            Subcategory3,
            Subcategory4,
            Subcategory5
        ]
    },

    UI.FieldGroup #TermsConditions : {
        Data: [
            { Value : TermsAndConditionCategory },
            { Value : PricelistFieldName },
            { Value : PricelistDataLevel }
        ]
    }
);