using DevExpress.Web.Mvc;
using DevExpress.XtraPivotGrid;
using DevExpress.XtraPivotGrid.Customization;
using SoftwareGroup.Mirrors.WebUI.Models.Northwind;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace SoftwareGroup.Mirrors.WebUI.Areas.Dashlets.Controllers
{
    public class PivotViewController : Controller
    {
        //
        // GET: /Dashlets/PivotView/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Editor()
        {
            return View();
        }

        public ActionResult PivotPartial()
        {
            return PartialView(NorthwindDataProvider.GetSalesPerson());
        }
    }

    public class DataHelper
    {
        static PivotGridSettings pgSettings;
        public static PivotGridSettings ChartDashletPivotGridSettings
        {
            get
            {
                if (pgSettings == null)
                    pgSettings = CreateChartDashletPivotGridSettings();
                return pgSettings;
            }
        }
        static PivotGridSettings CreateChartDashletPivotGridSettings()
        {
            PivotGridSettings settings = new PivotGridSettings();
            settings.Name = "pivotGrid";
            settings.CallbackRouteValues = new { Controller = "PivotView", Action = "Editor" };
            settings.OptionsPager.NumericButtonCount = 7;
            settings.OptionsPager.RowsPerPage = 15;
            settings.OptionsView.ShowHorizontalScrollBar = false;
            settings.OptionsView.RowTotalsLocation = PivotRowTotalsLocation.Tree;
            settings.OptionsView.ShowTotalsForSingleValues = true;
            settings.OptionsView.ShowColumnHeaders = false;
            settings.OptionsView.ShowDataHeaders = false;
            settings.OptionsView.ShowFilterHeaders = false;
            settings.OptionsView.ShowRowHeaders = false;
            settings.Width = Unit.Pixel(400);
            //settings.Height = Unit.Pixel(1);
            settings.PivotCustomizationExtensionSettings.Name = "pivotCustomization";
            settings.PivotCustomizationExtensionSettings.AllowedLayouts = CustomizationFormAllowedLayouts.BottomPanelOnly1by4 | CustomizationFormAllowedLayouts.BottomPanelOnly2by2 |
                CustomizationFormAllowedLayouts.StackedDefault | CustomizationFormAllowedLayouts.StackedSideBySide;
            settings.PivotCustomizationExtensionSettings.Layout = CustomizationFormLayout.BottomPanelOnly2by2;
            settings.PivotCustomizationExtensionSettings.AllowSort = true;
            settings.PivotCustomizationExtensionSettings.AllowFilter = true;
            settings.PivotCustomizationExtensionSettings.Height = Unit.Pixel(480);
            settings.PivotCustomizationExtensionSettings.Width = Unit.Pixel(400);


            settings.Fields.Add(field =>
            {
                field.FieldName = "Country";
                field.Area = PivotArea.RowArea;
                field.AreaIndex = 0;
            });

            settings.Fields.Add("Quantity", PivotArea.DataArea);
            settings.Fields.Add("CategoryName", PivotArea.ColumnArea);
            settings.Fields.Add("ProductName", PivotArea.FilterArea);
            settings.Fields.Add("Sales_Person", PivotArea.FilterArea);
            settings.Fields.Add("OrderDate", PivotArea.FilterArea);
            settings.Fields.Add("UnitPrice", PivotArea.FilterArea);


            return settings;
        }
    }
}
