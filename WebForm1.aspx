<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="LamedNetLite.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="app">
            {{name}}
        </div>
    </form>
</body>
<%--<script src="Teacher/eventsHandler.ashx"></script>--%>
<script>
    new Vue({
          
            el: '#app',
        data() {
        return {
            name: 'shlomo',
            arr: [{ a: 1 }, {a:2}]
        }
    }
        })
</script>
</html>
