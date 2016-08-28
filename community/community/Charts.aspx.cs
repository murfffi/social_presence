using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace community
{
    public partial class Charts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Chart1_Load(object sender, EventArgs e)
        {

        }
        protected void Chart1_Load1(object sender, EventArgs e)
        {

        }

        protected void ChartShortName_DataBound(object sender, EventArgs e)
        {
            foreach (System.Web.UI.DataVisualization.Charting.DataPoint point in ChartShortName.Series[0].Points)
            {
                string hasShortName = point.LegendText;
                point.Url = String.Format("javascript:showFacebookPagesIFrame('{0}')", hasShortName);
            }

        }

    //     Protected Sub chtCategoriesProductCount_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles chtCategoriesProductCount.DataBound
    //    For Each point As DataPoint In chtCategoriesProductCount.Series("Categories").Points
    //        Dim categoryId As Integer = point.YValues(1)
    //        point.Url = String.Format("~/Demos/DrillDown/ProductsInCategory.aspx?CategoryID={0}", categoryId.ToString())
    //        point.MapAreaAttributes = String.Format("onmouseover=""showProductsInCategoryIFrame({0});"" onmouseout=""showProductsInCategoryIFrame(-1);""", categoryId.ToString())
    //    Next
    //End Sub
    }
}