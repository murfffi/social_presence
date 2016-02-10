<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Charts.aspx.cs" Inherits="community.Charts"  MasterPageFile="~/Site.master"%>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:Chart ID="ChartHasPhone" runat="server" DataSourceID="SqlDataSourceCommunity" OnLoad="Chart1_Load">
            <series>
                <asp:Series ChartType="Pie" Name="Series1" XValueMember="has_phone" YValueMembers="cnt" Legend="LegendHasPhones">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
            <Legends>
                <asp:Legend DockedToChartArea="ChartArea1" IsDockedInsideChartArea="False" Name="LegendHasPhones" Title="Legend">
                </asp:Legend>
            </Legends>
            <Titles>
                <asp:Title Name="Title1" Text="Propotion of municipalities which have phone numbers">
                </asp:Title>
            </Titles>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSourceCommunity" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" SelectCommand="SELECT count(id) as cnt, [has_phone] FROM [facebook_page] group by [has_phone]"></asp:SqlDataSource>
   </asp:Content> 