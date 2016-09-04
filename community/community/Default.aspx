<%@ Page Language="C#" MasterPageFile="~/Site.master" CodeBehind="Default.aspx.cs" Inherits="community._Default" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server" />

    <%--<div style="float: right"><a href="AdminLogin.aspx">Admin</a></div>--%>
    <%--<div class="SPChartsLink"><a href="Charts.aspx">Charts</a></div>--%>
    <h2 class="DDSubHeader">Add social presence:</h2>
    <div class="SPHomeTable">
        <asp:GridView ID="Menu1" runat="server" AutoGenerateColumns="false"
            CssClass="DDGridView" RowStyle-CssClass="td" HeaderStyle-CssClass="th" CellPadding="6">
            <Columns>
                <asp:TemplateField HeaderText="Social presence types" SortExpression="TableName">
                    <ItemTemplate>
                        <asp:DynamicHyperLink ID="HyperLink1" runat="server"><%# Eval("DisplayName") %></asp:DynamicHyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>


