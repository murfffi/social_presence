﻿using System;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;

namespace community
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Collections.IList visibleTables = Global.DefaultModel.VisibleTables;
            if (visibleTables.Count == 0)
            {
                throw new InvalidOperationException("There are no accessible tables. Make sure that at least one data model is registered in Global.asax and scaffolding is enabled or implement custom pages.");
            }

            MetaTable firstTable = Global.DefaultModel.GetTable("Municipalities");
            visibleTables.Remove(firstTable);
            visibleTables.Insert(0, firstTable);
            Menu1.DataSource = visibleTables;
            Menu1.DataBind();
        }

    }


}
