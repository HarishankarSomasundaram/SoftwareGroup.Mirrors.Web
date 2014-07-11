using System.Web.Mvc;

namespace SoftwareGroup.Mirrors.WebUI.Areas.Dashlets
{
    public class DashletsAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Dashlets";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Dashlets_default",
                "Dashlets/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
