﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SNDEML.aspx.cs" Inherits="community.SNDEML" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="btnSend" runat="server" Text="Send Email" OnClick="btnSend_Click" />
        <asp:Literal ID="Literal1" runat="server" Visible ="false"></asp:Literal>
    </div>
    </form>
</body>
</html>
