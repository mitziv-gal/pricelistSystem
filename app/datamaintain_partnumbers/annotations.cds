using PriceListService as service from '../../srv/service';
annotate service.PartNumbers with @(
    UI.HeaderInfo: {
        TypeName      : 'Part Number',
        TypeNamePlural: 'Part Numbers'
    },
    UI.LineItem  : [
        { Value: MainCategory },
        { Value: Subcategory1 },
        { Value: Subcategory2 },
        { Value: Subcategory3 },
        { Value: Subcategory4 },
        { Value: Subcategory5 },
        { Value: PricelistPartNumber },
        { Value: ProductHierarchy1 },
        { Value: ProductHierarchy2 },
        { Value: ProductHierarchy3 }
    ],
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
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
            {
                $Type : 'UI.DataField',
                Value : PricelistPartNumber,
            },
            {
                $Type : 'UI.DataField',
                Value : ProductHierarchy3,
            },
            {
                $Type : 'UI.DataField',
                Value : ProductHierarchy2,
            },
            {
                $Type : 'UI.DataField',
                Value : ProductHierarchy1,
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
            { Value: MainCategory },
            { Value: Subcategory1 },
            { Value: Subcategory2 },
            { Value: Subcategory3 },
            { Value: Subcategory4 },
            { Value: Subcategory5 },
            { Value: PricelistPartNumber },
            { Value: ProductHierarchy1 },
            { Value: ProductHierarchy2 },
            { Value: ProductHierarchy3 }
        ]
    }
);