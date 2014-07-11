using JDash;
using JDash.Mvc;
using SoftwareGroup.Mirrors.WebUI.Areas.Dashlets.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SoftwareGroup.Mirrors.WebUI.Areas.Dashlets.Controllers
{
    public class AreaChartController : Controller
    {
        //
        // GET: /Dashlets/AreaChart/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Editor(string id)
        {
            var dashlet = JDashManager.Provider.GetDashlet(id);            
            var model = dashlet.config.JsonParsed<AreaChartModel>("model", new AreaChartModel() { });
            return View(model);
        }

        public ActionResult Save(string id, AreaChartModel model)
        {
            var dashlet = JDashManager.Provider.GetDashlet(id);
            dashlet.LoadProperties(model.DashletProperties);
            dashlet.config["model"] = model;
            JDashManager.Provider.SaveDashlet(dashlet);
            return new ConfigResult(dashlet.config);
        }
    }
}
