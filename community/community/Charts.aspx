<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Charts.aspx.cs" Inherits="community.Charts"  MasterPageFile="~/Site.master"%>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:Chart ID="ChartHasPhone" runat="server" DataSourceID="SqlDataSourceHasPhone" OnLoad="Chart1_Load">
            <series>
                <asp:Series ChartType="Pie" Name="Series1" XValueMember="has_phone" YValueMembers="cnt" Legend="Legend1" IsValueShownAsLabel="True" Label="#PERCENT " LegendText="#VALX">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
            <Legends>
                <asp:Legend Name="Legend1" Title="Legend">
                </asp:Legend>
            </Legends>
            <Titles>
                <asp:Title Name="Title1" Text="Propotion of municipalities which have phone numbers">
                </asp:Title>
            </Titles>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSourceHasDefinedLocation" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="select count(1) AS cnt, has_location  from (
SELECT iif([defined_location] is null, 'yes', 'no') AS has_location FROM [facebook_page]
) as tbl
group by has_location "></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceHasPhone" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="SELECT count(id) as cnt, iif([has_phone] = 1, 'yes', 'no') as has_phone FROM [facebook_page] group by [facebook_page].[has_phone]"></asp:SqlDataSource>
        <asp:Chart ID="ChartHasLocation" runat="server" DataSourceID="SqlDataSourceHasDefinedLocation" OnLoad="Chart1_Load1">
            <Series>
                <asp:Series Name="Series1" ChartType="Pie" Legend="Legend1" XValueMember="has_location" YValueMembers="cnt" IsValueShownAsLabel="True" Label=" #PERCENT" LegendText="#VALX">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
            <Legends>
                <asp:Legend Name="Legend1" Title="Legend">
                </asp:Legend>
            </Legends>
            <Titles>
                <asp:Title Name="defined_location" Text="Propotion of municipalities which have defined locations">
                </asp:Title>
            </Titles>
        </asp:Chart>
        <asp:Chart ID="ChartHasAboutPage" runat="server" DataSourceID="SqlDataSourceHasAboutPage">
            <Series>
                <asp:Series ChartType="Pie" IsValueShownAsLabel="True" Label=" #PERCENT" Legend="Legend1" LegendText="#VALX" Name="Series1" XValueMember="has_about_page" YValueMembers="cnt">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
            <Legends>
                <asp:Legend Name="Legend1" Title="Legend">
                </asp:Legend>
            </Legends>
            <Titles>
                <asp:Title Name="Title1" Text="Propotion of municipalities which have about page">
                </asp:Title>
            </Titles>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSourceHasAboutPage" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="SELECT count(id) as cnt, iif([has_about_page] = 1, 'yes', 'no') as has_about_page FROM [facebook_page] group by [facebook_page].[has_about_page]"></asp:SqlDataSource>
        <div><asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourcePagesByCategory">
            <Series>
                <asp:Series Name="Series1" XValueMember="category" YValueMembers="cnt" IsXValueIndexed="True">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
            <Titles>
                <asp:Title Name="Title1" Text="Number of Facebook pages grouped by category">
                </asp:Title>
            </Titles>
        </asp:Chart>
            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSourceShortName">
                <Series>
                    <asp:Series ChartType="Pie" IsValueShownAsLabel="True" Label="#PERCENT" Legend="Legend1" LegendText="#VALX" Name="Series1" XValueMember="has_short_name" YValueMembers="cnt">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend1" Title="Legend">
                    </asp:Legend>
                </Legends>
                <Titles>
                    <asp:Title Name="Title1" Text="Proportion of municipalities which use short names in their Facebook pages URLs">
                    </asp:Title>
                </Titles>
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSourceShortName" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="select count(1) AS cnt, has_short_name  from (
SELECT iif([defined_location] is not null, 'yes', 'no') AS has_short_name FROM [facebook_page]
) as tbl
group by has_short_name"></asp:SqlDataSource>
            <div>
            <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSourceCreationDate" Width="800px">
                <Series>
                    <asp:Series ChartType="Point" Name="Series1" XValueMember="creation_date" YValueMembers="number_pages">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX IntervalAutoMode="VariableCount" IntervalType="Weeks">
                            <MajorGrid IntervalType="Weeks" />
                        </AxisX>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSourceCreationDate" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="select creation_date, 
ROW_NUMBER() over (order by creation_date asc) as number_pages
from facebook_page
where creation_date is not null
order by creation_date"></asp:SqlDataSource></div>
        </div>
        <asp:SqlDataSource ID="SqlDataSourcePagesByCategory" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="SELECT count(id) AS cnt, category FROM [facebook_page] GROUP BY [facebook_page].[category]"></asp:SqlDataSource>
   </asp:Content> 