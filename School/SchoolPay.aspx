<%@ Page Title="" Language="C#" MasterPageFile="~/School/SchoolMaster.Master" AutoEventWireup="true" CodeBehind="SchoolPay.aspx.cs" Inherits="LamedNetLite.SchoolPay" %>
<%-- קישור ליוזר קונטרול המכיל תבנית של דף תשלום  --%>
<%@ Register Src="~/pay/PayTemplate.ascx" TagPrefix="PayTemplate" TagName="pt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server"> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <PayTemplate:pt runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
