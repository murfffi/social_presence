<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Charts.aspx.cs" Inherits="community.Charts" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourceCommunity" OnLoad="Chart1_Load" ToolTip="Has phones">
            <series>
                <asp:Series ChartType="Pie" Name="Series1" XValueMember="has_phone" YValueMembers="cnt">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSourceCommunity" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="SELECT count(id) as cnt, [has_phone] FROM [facebook_page] group by [has_phone]"></asp:SqlDataSource>
    </form>
</body>
</html>
