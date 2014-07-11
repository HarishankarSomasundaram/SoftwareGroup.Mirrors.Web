using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace SoftwareGroup.Mirrors.WebUI.Models
{
    public class DSWizardViewModel
    {
        [Required]
        public string DataSourceType { get; set; }
        public int StepNumber { get; set; }
        [Required]


        public string ServerName { get; set; }
        public string AuthenticationType { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public List<SelectListItem> Databases { get; set; }
        public List<SelectListItem> Views { get; set; }

        public List<String> Columns { get; set; }

        public List<String> selectedColumns { get; set; }
        public string selectedDatabase { get; set; }
        public string selectedView { get; set; }

    }
}