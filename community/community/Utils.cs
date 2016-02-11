using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;

namespace community
{
    public class Utils
    {
        public static Control FindDataControlRecursive(Control rootControl, string columnName, TraceContext traceContext)
        {
            if (rootControl is FieldTemplateUserControl)
            {
                FieldTemplateUserControl ctrl = (FieldTemplateUserControl)rootControl;
                traceContext.Write("Column: " + ctrl.Column.Name);
                if (ctrl.Column.Name == columnName) return ctrl;
            }

            traceContext.Write(rootControl.GetType().Name);
            foreach (Control controlToSearch in rootControl.Controls)
            {
                Control controlToReturn =
                    FindDataControlRecursive(controlToSearch, columnName, traceContext);
                if (controlToReturn != null) return controlToReturn;
            }
            return null;
        }
    }
}