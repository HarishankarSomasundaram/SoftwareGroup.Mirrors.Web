using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SoftwareGroup.Mirrors.WebUI.Areas.Dashlets.Controllers
{
    public class TableViewController : Controller
    {
        //
        // GET: /Dashlets/TableView/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Editor()
        {
            return View();
        }
    }
}
