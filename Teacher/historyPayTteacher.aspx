﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="historyPayTteacher.aspx.cs" Inherits="LamedNetLite.historyPayTteacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    טבלת תשלומי מורה לבית הספר (טסטים)
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h2>טבלת תשלומים </h2>
                <table class="table table-bordered" style="background-color: white;  border: ridge;">
                    <thead>
                        <tr>
                            <th>מועד תשלום</th>
                            <th>סכום</th>
                            <th>חוב/זכות</th>
                        </tr>
                    </thead>
                    <tbody id="tabel">
                    </tbody>
                </table>
            </div>
            <div class="col-md-6">
                <h2>טבלת טסטים </h2>
                <table class="table table-bordered" style="background-color: white; border: ridge;">
                    <thead>
                        <tr>
                            <th>מועד טסט</th>
                            <th>סטאטוס</th>
                            <th>מחיר</th>
                            <th>תאריך הזמנה</th>
                        </tr>
                    </thead>
                    <tbody id="tabel2">
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="js" runat="server">
    <script>
        var username = '<%= Session["TeacherId"] %>';//שליפה מסשן
        var a = [];
        var b = [];
        
        var html1 = "";
        var html2 = "";
        function ta2(x,cuont) {
            $.ajax({
                url: "/api/v1/GetallPayTeacertByIdTeacher/" + x,
                type: "GET",
                dataType: "JSON",
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        a = JSON.parse(data);
                        addColun(cuont,a);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function craList(x) {
            var i = 1;
            var count = 0;
            for (var itam of x) {
                var arrdate = (itam.PaymentDate).split("T");
                var alldate = (arrdate[0]).split("-");
                var datetohtml = alldate[2] + '/' + alldate[1] + '/' + alldate[0];
                count += itam.Sum;
                html1 += '<tr>' +
                    '<td>' + datetohtml + '&nbsp'+ '</td>' +
                    '<td>' + itam.Sum + '</td>';
                html1 += (itam.pay > 0 ? '<td>' + itam.pay + '</td>' : '<td style="color: #fb0505;">'  +itam.pay*-1 + '-</td>' )
                    //'<td>' + itam.pay + '</td>' +
                html1 += '</tr>';
                i++;
            }
            document.getElementById('tabel').innerHTML = html1;

        }
        function craList1(x) {
            var i = 1;
            var count = 0;
            for (var itam of x) {
                var arrdate = (itam.TestRequestDate).split("T");
                var alldate = (arrdate[0]).split("-");
                var datetohtml = alldate[2] + '/' + alldate[1] + '/' + alldate[0];
                var arrdate2 = (itam.TestOrderDate).split("T");
                var alldate2 = (arrdate2[0]).split("-");
                var datetohtml2 = alldate2[2] + '/' + alldate2[1] + '/' + alldate2[0];
                count += itam.priceTast;
                html2 += '<tr>' +
                    '<td>' + datetohtml+ '</td>' +
                    '<td>' + itam.nameStatus + '</td>' +
                    '<td>' + itam.priceTast + '</td>' +
                    '<td>' + datetohtml2 + '</td>' +
                    '</tr>'
                i++;
            }
            document.getElementById('tabel2').innerHTML = html2;
            ta2(username, count);
        }
        
        function ta1(x) {
            $.ajax({
                url: "/api/v1/GetallTastByIdTeacher/" + x,
                type: "GET",
                dataType: "JSON",
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        b = JSON.parse(data);
                        craList1(b);                        
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function addColun(cuont, x) {
            cuont *= -1;
            for (var i = x.length-1; i >= 0; i--) {
                cuont += x[i]['Sum'];
                a[i].pay = cuont;
            }
            craList(a);
        }
        ta1(username);
    </script>
</asp:Content>