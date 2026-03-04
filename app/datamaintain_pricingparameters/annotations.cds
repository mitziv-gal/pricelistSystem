using PriceListService as service from '../../srv/service';
annotate service.PricingParameters with @(
    UI.HeaderInfo: {
        TypeName      : 'Pricing Parameter',
        TypeNamePlural: 'Pricing Parameters'
    },
    UI.LineItem  : [
        { Value: TradeScenario },
        { Value: MarketScopeRegion },
        { Value: MarketScopeCountry },
        { Value: SalesOrg },
        { Value: DistChannel },
        { Value: CustPriceList },
        { Value: CustGroup1 },
        { Value: ErpCustomer },
        { Value: DeliveringPlant },
        { Value: ErpPriceCondition },
        { Value: ErpPricingAccessSequence }
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
                Value : ErpPriceCondition,
            },
            {
                $Type : 'UI.DataField',
                Value : ErpPricingAccessSequence,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.FieldGroup #CreationParameters: {
        Data : [
            { Value: TradeScenario },
            { Value: MarketScopeRegion },
            { Value: MarketScopeCountry },
            { Value: SalesOrg },
            { Value: DistChannel },
            { Value: CustPriceList },
            { Value: CustGroup1 },
            { Value: ErpCustomer },
            { Value: DeliveringPlant },
            { Value: ErpPriceCondition },
            { Value: ErpPricingAccessSequence }
        ]
    }
);

