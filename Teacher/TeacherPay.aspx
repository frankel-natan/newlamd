<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="TeacherPay.aspx.cs" Inherits="LamedNetLite.TeacherPay" %>

<%-- קישור ליוזר קונטרול המכיל תבנית של דף תשלום  --%>
<%@ Register Src="~/pay/PayTemplate.ascx" TagPrefix="PayTemplate" TagName="pt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
    <script src="../JQ/jquery.min.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <PayTemplate:pt runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="js" runat="server">
</asp:Content>
