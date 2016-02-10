using System;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace community
{
    public partial class Boolean_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);

            object val = FieldValue;
            if (val != null)
                CheckBox1.Checked = (bool)val;

            if (Column.Name == "approved")
            {
                CheckBox1.Enabled = Session["Admin"] != null;
            }
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = CheckBox1.Checked;
        }

        public override Control DataControl
        {
            get
            {
                return CheckBox1;
            }
        }

    }
}
