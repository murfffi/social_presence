<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FBPageLink.ascx.cs" Inherits="community.DynamicData.FieldTemplates.FBPageLink" %>
<asp:HyperLink ID="HyperLinkUrl" runat="server" Text="Link" Target="_blank" NavigateUrl ="<%# FieldValueString %>" />
