<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DrillDown.aspx.cs" Inherits="community.DrillDown" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsDrillDown" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="facebook_page_name" HeaderText="Facebook page name" SortExpression="facebook_page_name" />
                <asp:BoundField DataField="municipality_name" HeaderText="Municipality name" SortExpression="municipality_name" />
                <asp:BoundField DataField="website" HeaderText="Website" SortExpression="website" />
                <asp:BoundField DataField="short_name" HeaderText="Short name" SortExpression="short_name" />
                <asp:CheckBoxField DataField="approved" HeaderText="Approved" SortExpression="approved" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="dsDrillDown" runat="server" ConnectionString="<%$ ConnectionStrings:Social_PresenceConnectionString %>" 
            SelectCommand="SELECT [short_name], facebook_page.[name] as facebook_page_name, municipality.[name] as municipality_name, facebook_page.[website], facebook_page.[approved] FROM [facebook_page] inner join [Municipality] on municipality_id = Municipality.id  where iif([short_name] is not null, 'yes', 'no') = @HasShortName">
            <SelectParameters>
                <asp:QueryStringParameter Name="HasShortName" QueryStringField="HasShortName" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
