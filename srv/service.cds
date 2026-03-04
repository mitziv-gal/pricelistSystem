using { com.sap.pricelistsystem as my } from '../db/schema';

service PriceListService {
    entity User {
        key email                  : String;
            AppURL_DMTradeScenario : String;
            AppURL_DMItemStructure : String;
            AppURL_DMPartNumbers   : String;
            AppURL_DMTermsandCond  : String;
            AppURL_DMPricingParam  : String;
            AppURL_DMTileContent   : String;
            AppURL_DMContactInfo   : String;
            AppURL_PriceMaintain   : String;
            AppURL_DataMaintain    : String;
    };
    
    //Data Maintenance Application
    entity TableDirectory as projection on my.MaintenanceTableDirectory;
    annotate TableDirectory with @odata.draft.enabled;
    
    entity TradeScenarios as projection on my.TradeAndMarketScenarioDetermination;
    annotate TradeScenarios with @odata.draft.enabled;

    entity ItemStructure  as projection on my.PricelistItemStructureComponents;
    annotate ItemStructure with @odata.draft.enabled;
    
    entity PartNumbers as projection on my.PricelistPartNumberDetermination;
    annotate PartNumbers with @odata.draft.enabled;

    entity TermsAndConditions as projection on my.TermsAndConditionDetermination;
    annotate TermsAndConditions with @odata.draft.enabled;

    entity PricingParameters as projection on my.PricingParameterDetermination;
    annotate PricingParameters with @odata.draft.enabled;

    entity TileContent as projection on my.InformationTileContent;
    annotate TileContent with @odata.draft.enabled;

    entity ContactInfo as projection on my.ContactInformation;
    annotate ContactInfo with @odata.draft.enabled;

    action MassUploadTradeScenarios(file: String) returns String;
    action MassUploadItemStructure(file: String) returns String;
    action MassUploadPartNumbers(file: String) returns String;
    action MassUploadTermsandCond(file: String) returns String;
    action MassUploadPricingParam(file: String) returns String;
    action MassUploadTileContent(file: String) returns String;
    action MassUploadContactInfo(file: String) returns String;

    //Pricelist Maintenance Application
    @odata.draft.enabled
    entity PricelistData as projection on my.PricelistData {
        *,
        MarketScopeRegion || ' (' || MarketScopeCountry || ')' as MarketDisplay : String,
        Status @(Common.FieldControl : #ReadOnly),

        items : Composition of many PricelistItemData on items.parent = $self
    };

    entity PricelistItemData as projection on my.PricelistItemData {
        *,
        parent : Association to PricelistData on parent.ID = ID
    };

    // action PublishPricelist (ID : UUID) returns Boolean;
}