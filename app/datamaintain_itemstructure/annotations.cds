using PriceListService as service from '../../srv/service';
annotate service.ItemStructure with @(
    UI.SelectionFields: [
        TradeScenario,
        MarketScopeRegion,
        MarketScopeCountry,
        SalesOrg,
        DistChannel
    ],
    UI.HeaderInfo: {
        TypeName      : 'Item Structure',
        TypeNamePlural: 'Item Structure'
    },
    UI.LineItem: [
        { Value: TradeScenario },
        { Value: MarketScopeRegion },
        { Value: MarketScopeCountry },
        { Value: SalesOrg },
        { Value: DistChannel },
        { Value: CustPriceList },
        { Value: CustGroup1 },
        { Value: ErpCustomer },
        { Value: DeliveringPlant },
        { Value: MainCategory },
        { Value: Subcategory1 },
        { Value: Subcategory2 },
        { Value: Subcategory3 },
        { Value: Subcategory4 },
        { Value: Subcategory5 }
    ],
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : TradeScenario,
            },
            {
                $Type : 'UI.DataField',
                Value : MarketScopeRegion,
            },
            {
                $Type : 'UI.DataField',
                Value : MarketScopeCountry,
            },
            {
                $Type : 'UI.DataField',
                Value : SalesOrg,
            },
            {
                $Type : 'UI.DataField',
                Value : DistChannel,
            },
            {
                $Type : 'UI.DataField',
                Value : CustPriceList,
            },
            {
                $Type : 'UI.DataField',
                Value : CustGroup1,
            },
            {
                $Type : 'UI.DataField',
                Value : ErpCustomer,
            },
            {
                $Type : 'UI.DataField',
                Value : DeliveringPlant,
            },
            {
                $Type : 'UI.DataField',
                Value : MainCategory,
            },
            {
                $Type : 'UI.DataField',
                Value : Subcategory1,
            },
            {
                $Type : 'UI.DataField',
                Value : Subcategory2,
            },
            {
                $Type : 'UI.DataField',
                Value : Subcategory3,
            },
            {
                $Type : 'UI.DataField',
                Value : Subcategory4,
            },
            {
                $Type : 'UI.DataField',
                Value : Subcategory5,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Pricelist Item',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.FieldGroup #CreationParameters: {
        Data : [
            { 
                Value: TradeScenario,
                @UI: {
                    LineItem: [ { position: 10 }],
                    Importance: @High
                }
            },
            {
                Value: MarketScopeRegion,
                @UI: {
                    LineItem: [ { position: 20 }],
                    Importance: @High
                }
            },
            { 
                Value: MarketScopeCountry,
                @UI: {
                    LineItem: [ { position: 30 }],
                    Importance: @High
                }
            },
            { Value: SalesOrg },
            { Value: DistChannel },
            { Value: CustPriceList },
            { Value: CustGroup1 },
            { Value: ErpCustomer },
            { Value: DeliveringPlant },
            { Value: MainCategory },
            { Value: Subcategory1 },
            { Value: Subcategory2 },
            { Value: Subcategory3 },
            { Value: Subcategory4 },
            { Value: Subcategory5 }
        ]
    }
);

