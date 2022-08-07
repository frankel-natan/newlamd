<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="OrderTest.aspx.cs" Inherits="LamedNetLite.OrderTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    רשימת והזמנת טסט  
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-warning" style="box-shadow: 10px 10px rgb(140 140 140);">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-9">
                                <h4>טבלת טסטים</h4>
                            </div>
                            <div class="col-md-3">
                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">להזמנת טסט </button>
                            </div>
                        </div>
                    </div>
                    <table class="table table-hover">
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
            <div class="col-md-6">
                <div class="panel panel-yellow" style="box-shadow: 10px 10px rgb(140 140 140);">
                    <div class="panel-heading">
                        <h4>טבלת תשלומים</h4>
                    </div>
                    <table class="table table-hover">
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
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">הזמנת טסט</h4>
                </div>
                <div class="modal-body">
                    סמן את יום הטסט המבוקש
          <p>
              <input type="date" name="selecda" id="selecda"/></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="funcs()">שלח</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">סגור</button>
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
        var b = [];

        var html1 = "";
        var html2 = "";
        function ta2(x, cuont) {
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
                        addColun(cuont, a);
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
            html1 = '';
            for (var itam of x) {
                var arrdate = (itam.PaymentDate).split("T");
                var alldate = (arrdate[0]).split("-");
                var datetohtml = alldate[2] + '/' + alldate[1] + '/' + alldate[0];
                count += itam.Sum;
                html1 += '<tr>' +
                    '<td>' + datetohtml + '&nbsp' + '</td>' +
                    '<td>' + itam.Sum + '</td>';
                html1 += (itam.pay > 0 ? '<td>' + itam.pay + '</td>' : '<td style="color: #fb0505;">' + itam.pay * -1 + '-</td>')
                //'<td>' + itam.pay + '</td>' +
                html1 += '</tr>';
                i++;
            }
            document.getElementById('tabel').innerHTML = '';
            document.getElementById('tabel').innerHTML = html1;

        }
        function craList1(x) {
            var i = 1;
            html2 = '';
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
                    '<td>' + datetohtml + '</td>' +
                    '<td>' + itam.nameStatus + '</td>' +
                    '<td>' + itam.priceTast + '</td>' +
                    '<td>' + datetohtml2 + '</td>' +
                    '</tr>'
                i++;
            }
            document.getElementById('tabel2').innerHTML = '';
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
            for (var i = x.length - 1; i >= 0; i--) {
                cuont += x[i]['Sum'];
                a[i].pay = cuont;
            }
            craList(a);
        }
        ta1(username);
        function send(idt, date) {
            $.ajax({
                url: "/api/v1/GetallTastByIdTeacher",
                type: "POST",
                data: { 'TeacherId': idt, 'TestRequestDate': date },
                dataType: "JSON",
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        ta1(username);
                        yesmess();
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
            

        }
        var today = new Date().toISOString().split('T')[0];
        document.getElementsByName("selecda")[0].setAttribute('min', today);
        function funcs() {
            var da = new Date($('#selecda').val()).toISOString().split('T')[0]
            alert(da);
            send(username, da);
        }
    </script>


</asp:Content>
