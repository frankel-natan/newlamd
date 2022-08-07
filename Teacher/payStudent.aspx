<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="payStudent.aspx.cs" Inherits="LamedNetLite.payStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    טופס עבור תשלום תלמיד
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="col-md-8">
            <div class="modal-dialog modal-md">
                <div class="modal-content" style="padding: 50px; text-align: center;">
                    <div style="padding: 2%,20%; padding-right: 30%;">
                        <div class="form-group" style="width: 50%">
                            <label for="sel1">בחר תלמיד מתוך הרשימה:</label>
                            <select class="form-control" id="sel1">
                            </select>
                        </div>
                        <div class="">
                            <div class="" style="width: 50%">
                                <input type="text" class="form-control" id="usr" name="number" placeholder="הקלד סכום">
                            </div>
                        </div>
                    </div>
                    <div>
                        <button class="btn btn-success" style="margin: 30px;" onclick="payclik()">אישור</button>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-2" id="forstudent" style="">
            <div class="panel panel-danger">
                <div class="panel-heading">שיעורים ממתינים</div>
                <div class="panel-body" id="tow"></div>
            </div>
            <div class="panel panel-warning">
                <div class="panel-heading">שיעורים שבוצעו</div>
                <div class="panel-body" id="three"></div>
            </div>
            <div class="panel panel-success">
                <div class="panel-heading">שיעורים ממתינים לאישור</div>
                <div class="panel-body" id="fore"></div>
            </div>
        </div>
        <div class="col-md-2" id="forstudent2" style="">
            <div class="panel panel-danger">
                <div class="panel-heading">סה"כ חיוב</div>
                <div class="panel-body" id="sump"></div>
            </div>
            <div class="panel panel-success">
                <div class="panel-heading">סה"כ התקבל</div>
                <div class="panel-body" id="sumst"></div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">יתרה</div>
                <div class="panel-body" id="balance"></div>

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
        var html;
        function lists(x) {
            $.ajax({
                url: "/api/v1/lassonstudent/" + x,
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
                        page(a)
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        lists(username);
        function page(x) {
            html = '';
            for (var item of x) {
                $('#sel1').append(`<option value="${item.StudentId}">${item.StudentName}</option>`);
            }
        }
        $("#sel1").off();
        $("#sel1").mouseup(function () {
            var open = $(this).data("isopen");
            var select = $(this).val();
            if (open) {
                for (var itam of a) {
                    if (itam.StudentId == select) {
                        $('#tow').text(itam.tow);
                        $('#three').text(itam.three);
                        $('#fore').text(itam.fore);
                        $('#sump').text(itam.PricePerLesson * itam.three);
                        //$('#forstudent').removeClass('hidden');
                        page2(username, select, itam.PricePerLesson * itam.three);
                    }
                }
            }
            $(this).data("isopen", !open);
        });

        function page2(x, select, blance) {
            $.ajax({
                url: "/api/v1/payStudent/" + x,
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
                        sumf(b, select, blance);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        var sumst;
        var blance = 0;
        function sumf(x, y, z) {
            sumst = 0;
            for (var it of x) {
                if (it.StudentId == y) {
                    sumst += it.Sum;
                }
            }
            bla = z - sumst
            $('#sumst').text(sumst);
            if (bla > 0) {
                $('#balance').text(bla + "-");
                document.getElementById('balance').style.background = '#ed143d7a';
            }
            else {
                $('#balance').text(bla * -1);
                document.getElementById('balance').style.background = "#beff2f61";
                //$("#balance").css("background-color:#beff2f61;");
            }

        }
        function payclik() {
            var id = document.querySelector('#sel1').value;
            var sum = $('#usr').val();
            if (sum < 0) {
                alert('שגיאה!!!');
            }
            else {
                $.ajax({
                    type: 'POST',
                    url: '/api/v1/payStudent',
                    data: { "Id": id, "sum": sum },
                    success: function () {
                        yesmess();
                    }
                });
            }
            
        }
        $('input[name="number"]').keyup(function (e) {
            if (/\D/g.test(this.value)) {
                // Filter non-digits from input value.
                this.value = this.value.replace(/\D/g, '');
            }
        });
        function cc() {
            $.ajax({
                type: 'PUt',
                url: '/api/v1/payStudent/5',
                data: { "Item1": 71, "Item2": 12 },
                success: function () {
                    yesmess();
                }
            });
        }
    </script>
</asp:Content>
