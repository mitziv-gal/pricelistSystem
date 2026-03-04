const XLSX = require("xlsx");

/**
 * Generic Mass Upload Handler
 * @param {Object} req - CAP request object
 * @param {String} entity - Projection entity name
 * @param {Array} requiredHeaders - List of required headers
 * @param {Function} mapRow - Function to map Excel row → entity fields
 **/
async function handleMassUpload(req, entity, requiredHeaders, mapRow) {
    try {
        const { file } = req.data;
        if (!file) return req.error(400, "No file provided");

        // Decode Base64 → Buffer → Workbook
        const buffer = Buffer.from(file, "base64");
        const workbook = XLSX.read(buffer, { type: "buffer" });
        const sheetName = workbook.SheetNames[0];
        const sheet = workbook.Sheets[sheetName];

        // Convert sheet to JSON
        const rows = XLSX.utils.sheet_to_json(sheet, { defval: "" });

        // Validate headers
        const firstRowKeys = Object.keys(rows[0] || {}).map(k => k.replace(/\s+/g, "").trim());
        for (const header of requiredHeaders) {
            if (!firstRowKeys.includes(header)) {
                return req.error(400, `Missing required column: ${header}. Expected: ${requiredHeaders.join(", ")}`);
            }
        }

        // Enrich rows
        const enrichedRows = rows.map(r => ({
            ID: cds.utils.uuid(),
            ...mapRow(r),
            createdAt: new Date(),
            createdBy: req.user.id || "system"
        }));

        // Insert into DB
        const tx = cds.transaction(req);
        await tx.run(INSERT.into(entity).entries(enrichedRows));

        return { message: "Upload successful", count: rows.length };
    } catch (err) {
        console.error("Upload failed:", err);
        return req.error(500, "Upload failed: " + err.message);
    }
}

module.exports = cds.service.impl(async function () {
    // Match the names exactly as they appear in your CSN definitions
    const { User, TradeScenarios, ItemStructure, PartNumbers, TermsAndConditions, PricingParameters, TileContent, ContactInfo, PricelistData } = this.entities;

    // Handler for User Entity
    this.on('READ', User, async (req) => {
        try {
            return [{
                email: req.user?.id || req.user?.email || 'user@example.com',
                AppURL_DMTradeScenario: process.env.AppURL_DMTradeScenario || "",
                AppURL_DMItemStructure: process.env.AppURL_DMItemStructure || "",
                AppURL_DMPartNumbers: process.env.AppURL_DMPartNumbers || "",
                AppURL_DMTermsandCond: process.env.AppURL_DMTermsandCond || "",
                AppURL_DMPricingParam: process.env.AppURL_DMPricingParam || "",
                AppURL_DMTileContent: process.env.AppURL_DMTileContent || "",
                AppURL_DMContactInfo: process.env.AppURL_DMContactInfo || "",
                AppURL_PriceMaintain: process.env.AppURL_PriceMaintain || "",
                AppURL_DataMaintain: process.env.AppURL_DataMaintain || ""
            }];
        } catch (err) {
            console.error("User READ error:", err);
            req.error(500, "Failed to load user profile");
        }
    });

    // Handler for Mass Upload - Data Maintenance App
    // 1. Trade Scenarios
    this.on('MassUploadTradeScenarios', req =>
        handleMassUpload(req, cds.entities.TradeAndMarketScenarioDetermination,
            ["TradeScenario", "MarketScopeRegion", "MarketScopeCountry"],
            r => ({
                TradeScenario: r["Trade Scenario"] || r["TradeScenario"],
                MarketScopeRegion: r["Market Scope Region"] || r["MarketScopeRegion"],
                MarketScopeCountry: r["Market Scope Country"] || r["MarketScopeCountry"]
            })
        )
    );

    // 2. Item Structure
    this.on('MassUploadItemStructure', req =>
        handleMassUpload(req, cds.entities.PricelistItemStructureComponents,
            ["TradeScenario", "MarketScopeRegion", "MarketScopeCountry", "SalesOrg", "DistChannel", "CustPriceList", "CustGroup1", "ErpCustomer", "DeliveringPlant", "MainCategory", "Subcategory1", "Subcategory2", "Subcategory3", "Subcategory4", "Subcategory5"],
            r => ({
                TradeScenario: r["Trade Scenario"] || r["TradeScenario"],
                MarketScopeRegion: r["Market Scope Region"] || r["MarketScopeRegion"],
                MarketScopeCountry: r["Market Scope Country"] || r["MarketScopeCountry"],
                SalesOrg: r["Sales Org"] || r["SalesOrg"],
                DistChannel: r["Distribution Channel"] || r["DistChannel"],
                CustPriceList: r["Customer Pricelist"] || r["CustPriceList"],
                CustGroup1: r["Customer Group 1"] || r["CustGroup1"],
                ErpCustomer: r["ERP Customer"] || r["ErpCustomer"],
                DeliveringPlant: r["Plant"] || r["DeliveringPlant"],
                MainCategory: r["Main Category"] || r["MainCategory"],
                Subcategory1: r["Subcategory 1"] || r["Subcategory1"],
                Subcategory2: r["Subcategory 2"] || r["Subcategory2"],
                Subcategory3: r["Subcategory 3"] || r["Subcategory3"],
                Subcategory4: r["Subcategory 4"] || r["Subcategory4"],
                Subcategory5: r["Subcategory 5"] || r["Subcategory5"]
            })
        )
    );

    // 3. Part Numbers
    this.on('MassUploadPartNumbers', req =>
        handleMassUpload(req, cds.entities.PricelistPartNumberDetermination,
            ["MainCategory", "Subcategory1", "Subcategory2", "Subcategory3", "Subcategory4", "Subcategory5", "PricelistPartNumber", "ProductHierarchy3", "ProductHierarchy2", "ProductHierarchy1"],
            r => ({
                MainCategory: r["Main Category"] || r["MainCategory"],
                Subcategory1: r["Subcategory 1"] || r["Subcategory1"],
                Subcategory2: r["Subcategory 2"] || r["Subcategory2"],
                Subcategory3: r["Subcategory 3"] || r["Subcategory3"],
                Subcategory4: r["Subcategory 4"] || r["Subcategory4"],
                Subcategory5: r["Subcategory 5"] || r["Subcategory5"],
                PricelistPartNumber: r["Pricelist Part Number"] || r["PricelistPartNumber"],
                ProductHierarchy3: r["Product Hierarchy 3"] || r["ProductHierarchy3"],
                ProductHierarchy2: r["Product Hierarchy 2"] || r["ProductHierarchy2"],
                ProductHierarchy1: r["Product Hierarchy 1"] || r["ProductHierarchy1"]
            })
        )
    );

    // 4. Terms and Conditions
    this.on('MassUploadTermsandCond', req =>
        handleMassUpload(req, cds.entities.TermsAndConditionDetermination,
            ["TradeScenario", "MarketScopeRegion", "MarketScopeCountry", "SalesOrg", "DistChannel", "CustPriceList", "CustGroup1", "ErpCustomer", "DeliveringPlant", "TermsAndConditionCategory", "PricelistFieldName", "PricelistDataLevel"],
            r => ({
                TradeScenario: r["Trade Scenario"] || r["TradeScenario"],
                MarketScopeRegion: r["Market Scope Region"] || r["MarketScopeRegion"],
                MarketScopeCountry: r["Market Scope Country"] || r["MarketScopeCountry"],
                SalesOrg: r["Sales Org"] || r["SalesOrg"],
                DistChannel: r["Distribution Channel"] || r["DistChannel"],
                CustPriceList: r["Customer Pricelist"] || r["CustPriceList"],
                CustGroup1: r["Customer Group 1"] || r["CustGroup1"],
                ErpCustomer: r["ERP Customer"] || r["ErpCustomer"],
                DeliveringPlant: r["Plant"] || r["DeliveringPlant"],
                TermsAndConditionCategory: r["Terms and Conditions Category"] || r["TermsAndConditionCategory"],
                PricelistFieldName: r["Pricelist Fieldname"] || r["PricelistFieldName"],
                PricelistDataLevel: r["Pricelist Data Level"] || r["PricelistDataLevel"]
            })
        )
    );

    // 5. Pricing Parameters
    this.on('MassUploadPricingParam', req =>
        handleMassUpload(req, cds.entities.PricingParameterDetermination,
            ["TradeScenario", "MarketScopeRegion", "MarketScopeCountry", "SalesOrg", "DistChannel", "CustPriceList", "CustGroup1", "ErpCustomer", "DeliveringPlant", "ErpPriceCondition", "ErpPricingAccessSequence"],
            r => ({
                TradeScenario: r["Trade Scenario"] || r["TradeScenario"],
                MarketScopeRegion: r["Market Scope Region"] || r["MarketScopeRegion"],
                MarketScopeCountry: r["Market Scope Country"] || r["MarketScopeCountry"],
                SalesOrg: r["Sales Org"] || r["SalesOrg"],
                DistChannel: r["Distribution Channel"] || r["DistChannel"],
                CustPriceList: r["Customer Pricelist"] || r["CustPriceList"],
                CustGroup1: r["Customer Group 1"] || r["CustGroup1"],
                ErpCustomer: r["ERP Customer"] || r["ErpCustomer"],
                DeliveringPlant: r["Plant"] || r["DeliveringPlant"],
                ErpPriceCondition: r["ERP Price Condition"] || r["ErpPriceCondition"],
                ErpPricingAccessSequence: r["ERP Pricing Access Sequence"] || r["ErpPricingAccessSequence"]
            })
        )
    );

    // 6. Tile Content (use underlying entity)
    this.on('MassUploadTileContent', req =>
        handleMassUpload(req, cds.entities.InformationTileContent,
            ["TradeScenario", "MarketScopeRegion", "MarketScopeCountry", "InformationHeading", "InformationDetails", "ImageLink"],
            r => ({
                TradeScenario: r["Trade Scenario"] || r["TradeScenario"],
                MarketScopeRegion: r["Market Scope Region"] || r["MarketScopeRegion"],
                MarketScopeCountry: r["Market Scope Country"] || r["MarketScopeCountry"],
                InformationHeading: r["Information Heading"] || r["InformationHeading"],
                InformationDetails: r["Information Details"] || r["InformationDetails"],
                ImageLink: r["Image Link"] || r["ImageLink"]
            })
        )
    );

    // 7. Contact Info (use underlying entity)
    this.on('MassUploadContactInfo', req =>
        handleMassUpload(req, cds.entities.ContactInformation,
            ["TradeScenario", "MarketScopeRegion", "MarketScopeCountry", "ContactEmail", "ContactNumber"],
            r => ({
                TradeScenario: r["Trade Scenario"] || r["TradeScenario"],
                MarketScopeRegion: r["Market Scope Region"] || r["MarketScopeRegion"],
                MarketScopeCountry: r["Market Scope Country"] || r["MarketScopeCountry"],
                ContactEmail: r["Contact E-Mail"] || r["ContactEmail"],
                ContactNumber: r["Contact Number"] || r["ContactNumber"]
            })
        )
    );

    // Handler for PricelistData Status Assignment
    this.before('CREATE', PricelistData, async (req) => {
        req.data.Status = 'Initial';
    });

    /* this.on('PublishPricelist', async (req) => {
        const { ID } = req.data;
        
        await UPDATE('PricelistData')
            .set({ 
                    Status: 'Published',
                    PublishedDate: new Date(),
                    PublishedBy: req.user?.id || 'Anonymous'
                })
            .where({ ID });
        return true;
    }); */

});