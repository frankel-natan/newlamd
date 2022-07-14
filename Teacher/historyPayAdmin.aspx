<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="historyPayAdmin.aspx.cs" Inherits="LamedNetLite.historyPayAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    סיכום תשלומים למנהל המערכת
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6" >
                <%--   <h2>טבלת תשלומים</h2>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>תאריך</th>
                            <th>סכום</th>
                            <th>יתרה</th>
                        </tr>
                    </thead>
                    <tbody id="tabeld">
                    </tbody>
                </table>
            </div>--%>
                <div class="panel panel-primary">
                    <div class="panel-heading"><h4>טבלת תשלומים</h4></div>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>תאריך</th>
                                <th>סכום</th>
                                <th>יתרה</th>
                            </tr>
                        </thead>
                        <tbody id="tabeld">
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-2"></div>
            <div class="col-md-2">
                <div class="panel panel-info">
                    <div class="panel-heading">סה"כ תשלום עבור מנוי</div>
                    <div class="panel-body" id="cuont"></div>
                </div>
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
        var htmlt;
        var count = 1500;
        function tpage(x) {
            $.ajax({
                url: "/api/v1/patAllPayTeacherToAdminBtIdteacher/" + x,
                type: "GET",
                dataType: "JSON",
                beforeSend: function () {
                    htmlt = '';
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        a = JSON.parse(data);
                        var arrdate = (a[0]['DateAdded']).replaceAll('T', ' ');
                        var dt1 = new Date();
                        var dt2 = new Date(arrdate);
                        count = diff_months(dt1, dt2) * 100;
                        criate(a, count);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function criate(x, y) {
            var z = y;
            y *= -1;
            for (var i = x.length - 1; i >= 0; i--) {
                y += x[i]['Sum'];
                var tmp = (y > 0 ? '<td>' + y + '</td>' : '<td style="color: #fb0505;">' + y * -1 + '-</td>');
                var arrdate = (x[i]['PaymentDate']).split("T");
                var alldate = (arrdate[0]).split("-");
                var datetohtml = alldate[2] + '/' + alldate[1] + '/' + alldate[0];
                htmlt = '<tr> ' +
                    '<td>' + datetohtml + '</td>' +
                    '<td>' + x[i]['Sum'] + '</td>' +
                    tmp + //'<td>' + y + '</td>' +
                    '</tr>' + htmlt;
            }
            document.getElementById('tabeld').innerHTML = htmlt;
            document.getElementById('cuont').innerHTML = z;
        }
        tpage(username);
        function diff_months(dt2, dt1) {//הפרש בין חודשים
            var diff = (dt2.getTime() - dt1.getTime()) / 1000;
            diff /= (60 * 60 * 24 * 7 * 4);
            return Math.abs(Math.round(diff));

        }
    </script>
</asp:Content>
