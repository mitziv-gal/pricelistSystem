using PriceListService as service from '../../srv/service';
annotate service.TermsAndConditions with @(
    UI.HeaderInfo: {
        TypeName      : 'Term & Condition',
        TypeNamePlural: 'Terms & Conditions'
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
        { Value: TermsAndConditionCategory },
        { Value: PricelistFieldName },
        { Value: PricelistDataLevel },

        /* {
            $Type  : 'UI.DataFieldForAction',
            Action : 'PriceListService.MassUploadTermsandConditions',
            Label  : 'Upload'
        } */
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
                Value : TermsAndConditionCategory,
            },
            {
                $Type : 'UI.DataField',
                Value : PricelistFieldName,
            },
            {
                $Type : 'UI.DataField',
                Value : PricelistDataLevel,
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
            { Value: TermsAndConditionCategory },
            { Value: PricelistFieldName },
            { Value: PricelistDataLevel }
        ]
    }
);

