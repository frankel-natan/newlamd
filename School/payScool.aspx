<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payScool.aspx.cs" Inherits="LamedNetLite.payScool" %>
<%-- קישור ליוזר קונטרול המכיל תבנית של דף תשלום  --%>
<%@ Register Src="~/pay/PayTemplate.ascx" TagPrefix="PayTemplate" TagName="pt" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%--<form id="form1" runat="server">--%>
        <div>
            <PayTemplate:pt runat="server" />
        </div>
    <%--</form>--%>
</body>
</html>
