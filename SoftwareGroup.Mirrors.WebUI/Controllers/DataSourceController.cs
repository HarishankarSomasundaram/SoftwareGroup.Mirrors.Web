using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SoftwareGroup.Mirrors.WebUI.Models;
using System.Data.SqlClient;
using System.Data;

namespace SoftwareGroup.Mirrors.WebUI.Controllers
{
    public class DataSourceController : Controller
    {
        //
        // GET: /DataSource/

        public ActionResult Index()
        {
            ViewBag.Title = "Administration";
            ViewBag.SubTitle = "Datasource Manager";
            return View();
        }

        public ActionResult DSWizard1()
        {
            DSWizardViewModel DSPopUpModel = new DSWizardViewModel();
            return PartialView("DSWizard1", DSPopUpModel);
        }

        [HttpPost]
        public ActionResult DSWizard2(DSWizardViewModel dsWizard)
        {
            return PartialView("DSWizard2", dsWizard);
        }

        public JsonResult GetViewsSp(DSWizardViewModel dsWizard)
        {
            SqlConnectionStringBuilder connString = new System.Data.SqlClient.SqlConnectionStringBuilder();
            connString.DataSource = dsWizard.ServerName;
            connString.IntegratedSecurity = true;
            connString.InitialCatalog = dsWizard.selectedDatabase;
            List<SelectListItem> views = new List<SelectListItem>();
            using (SqlConnection sqlConx = new SqlConnection(connString.ConnectionString))
            {
                sqlConx.Open();
                DataTable tblViews = sqlConx.GetSchema("Views");
                sqlConx.Close();

                foreach (DataRow row in tblViews.Rows)
                {
                    string r = (string)row["table_name"];
                    SelectListItem item = new SelectListItem() { Text = r, Value = r };
                    views.Add(item);

                }
            }


            JsonResult result = Json(views);

            return result;
        }

        public JsonResult GetColumns(DSWizardViewModel dsWizard)
        {
            SqlConnectionStringBuilder connString = new System.Data.SqlClient.SqlConnectionStringBuilder();
            connString.DataSource = dsWizard.ServerName;
            connString.IntegratedSecurity = true;
            connString.InitialCatalog = dsWizard.selectedDatabase;
            string[] restrictions = new string[4] { null, null, dsWizard.selectedView, null };
            List<string> columnList;
            using (SqlConnection sqlConx = new SqlConnection(connString.ConnectionString))
            {
                sqlConx.Open();
                columnList = sqlConx.GetSchema("ViewColumns", restrictions).AsEnumerable().Select(s => s.Field<String>("Column_Name")).ToList();
                sqlConx.Close();
            }


            JsonResult result = Json(columnList);

            return result;
        }

        [HttpPost]
        public ActionResult DSWizard3(DSWizardViewModel dsWizard)
        {
            SqlConnectionStringBuilder connString = new System.Data.SqlClient.SqlConnectionStringBuilder();
            connString.DataSource = dsWizard.ServerName;
            connString.IntegratedSecurity = true;
            dsWizard.Databases = new List<SelectListItem>();
            dsWizard.Views = new List<SelectListItem>();

            using (SqlConnection sqlConx = new SqlConnection(connString.ConnectionString))
            {
                sqlConx.Open();
                DataTable tblDatabases = sqlConx.GetSchema("Databases");
                sqlConx.Close();

                foreach (DataRow row in tblDatabases.Rows)
                {
                    string r = (string)row["database_name"];
                    SelectListItem item = new SelectListItem() { Text = r, Value = r };
                    dsWizard.Databases.Add(item);

                }
            }


            return PartialView("DSWizard3", dsWizard);
        }

    }
}
