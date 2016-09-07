using System;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace community
{
    public partial class DateTime_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        private static DataTypeAttribute DefaultDateAttribute = new DataTypeAttribute(DataType.DateTime);
        protected void Page_Load(object sender, EventArgs e)
        {
            Calendar1.ToolTip = Column.Description;

        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = Calendar1.SelectedDate;
        }

        public override Control DataControl
        {
            get
            {
                return Calendar1;
            }
        }

        protected override void OnDataBinding(EventArgs e)
        {
            if (String.IsNullOrEmpty(FieldValueEditString))
            {
                Calendar1.SelectedDate = DateTime.Now;
            }
            else
            {
                Calendar1.SelectedDate = (DateTime) FieldValue;
                // Using FieldValue directly should work, but if not it can be worked around with something like this,
                // but with multiple format support:
                //DateTime.ParseExact(FieldValueEditString, "dd-MMM-yy hh:mm:ss tt", System.Globalization.CultureInfo.InvariantCulture);
            }
            Calendar1.VisibleDate = Calendar1.SelectedDate;
        }

    }
}
