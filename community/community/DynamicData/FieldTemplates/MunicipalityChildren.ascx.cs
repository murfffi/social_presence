using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace community.DynamicData.FieldTemplates
{
    public partial class MunicipalityChildren : System.Web.DynamicData.FieldTemplateUserControl
    {
        private bool _allowNavigation = true;
        private string _navigateUrl;

        public string NavigateUrl
        {
            get
            {
                return _navigateUrl;
            }
            set
            {
                _navigateUrl = value;
            }
        }

        public bool AllowNavigation
        {
            get
            {
                return _allowNavigation;
            }
            set
            {
                _allowNavigation = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink1.Text = "View data form";
        }

        protected string GetChildrenPath()
        {
            if (!AllowNavigation)
            {
                return null;
            }

            if (String.IsNullOrEmpty(NavigateUrl))
            {
                return ChildrenPath;
            }
            else
            {
                return BuildChildrenPath(NavigateUrl);
            }
        }

        public override Control DataControl
        {
            get
            {
                return HyperLink1;
            }
        }
    }
}