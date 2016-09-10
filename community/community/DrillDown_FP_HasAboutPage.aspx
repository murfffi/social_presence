﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DrillDown_FP_HasAboutPage.aspx.cs" Inherits="community.DrillDown_FP_HasAboutPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="http://www.eyewalker.com/_en/restyle.css" rel="stylesheet" type="text/css" />
</head>
   <!-- Removed class="SPDrillDown" from body because the class is broken-->
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsDrillDown" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="facebook_page_name" HeaderText="Facebook page name" SortExpression="facebook_page_name" />
                <asp:BoundField DataField="municipality_name" HeaderText="Municipality name" SortExpression="municipality_name" />
                <%--<asp:BoundField DataField="url" HeaderText="Website" SortExpression="url" />--%>
                <asp:HyperLinkField DataNavigateUrlFields="url" HeaderText="Website" SortExpression="url" NavigateUrl="url" Target="_blank" Text="link"/>
                <asp:CheckBoxField DataField="has_about_page" HeaderText="Has about page" SortExpression="has_about_page" />
                <asp:CheckBoxField DataField="approved" HeaderText="Approved" SortExpression="approved" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="dsDrillDown" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" 
            SelectCommand="SELECT [has_about_page], facebook_page.[name] as facebook_page_name, municipality.[name] as municipality_name, facebook_page.[url], facebook_page.[approved] FROM [facebook_page] inner join [Municipality] on municipality_id = Municipality.id  where iif([has_about_page] = 1, 'yes', 'no') = @HasAboutPage">
            <SelectParameters>
                <asp:QueryStringParameter Name="HasAboutPage" QueryStringField="HasAboutPage" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>