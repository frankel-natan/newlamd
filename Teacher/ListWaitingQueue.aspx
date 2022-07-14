<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="ListWaitingQueue.aspx.cs" Inherits="LamedNetLite.ListWaitingQueue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    רשימת תלמידים הממתינים לאישור
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div id="allse">
        <label>
            <input type="checkbox" id="allredio" name="remember">
            לבחירת הכל סמן כאן</label><br />
    </div>
    <div>
        <button type="button" id="allButtenConfir" class="btn btn-success hidden">אישור</button>
        <button type="button" id="allButtenCancel" class="btn btn-danger hidden">ביטול</button>
    </div>
    <div id="tabel" style="width: 80%"></div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="js" runat="server">
    <script>
        var username = '<%= Session["TeacherId"] %>';//שליפה מסשן
        var a;
        var listUpdet = [];
        var listStudent = [];
        var tampString;
        function listWatining(x) {
            $.ajax({
                url: "/api/v1/ListWaitinigQueue/" + x,
                type: "GET",
                dataType: "JSON",
                beforeSend: function () {
                    a = [];
                    listUpdet = [];
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        a = JSON.parse(data);
                        page2();
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function page(x) {
            tampString = '';
            document.getElementById('tabel').innerHTML = "";
            $('#allButtenConfir').addClass('hidden');
            $('#allButtenCancel').addClass('hidden');
            $('#allredio').prop("checked", false);
            listWatining(x);
        }
        function page2() {
            for (var i = 0; i < a.length; i++) {
                tampString += '<div class="panel-group">' +
                    '<div class="panel panel-warning">' +
                    '<div class="panel-heading""><div>' +
                    '<h4 class="panel-title" style="display: flex;" >' +
                    '<div style="width: 60%">' +
                    '<label style="padding: 12px;"><input type="checkbox" id="put#$%' + a[i]['StudentId']+'"  value="' + a[i]['StudentId'] +'" onclick="calc(this)"; /></label>' +
                    '<a data-toggle="collapse" href="#collapse' + i + '"><strong>' + a[i]['StudentName'] + '</strong></a>' +
                    '</div>' +
                    '<div >' +
                    '<button class="btn btn-success" style="margin:3px;"  value="' + a[i]['StudentId'] + '" onclick="oneupdete(' + a[i]['StudentId'] +')">אישור</button>' +
                    '<button class="btn btn-danger" style="margin:3px;"  value="' + a[i]['StudentId'] + '" onclick="onedelite(' + a[i]['StudentId']+');">ביטול</button>' +
                    '</div>' +
                    '</h4>' +
                    '</div>' +
                    '</div>' +
                    '<div id="collapse' + i + '" class="panel-collapse collapse">' +
                    '<div class="panel-body">כתובת -' + a[i]['GatheringPlace'] + '&nbsp טלפון :' + a[i]['Phone'] + '</div>' +
                    '<div class="panel-footer">דוא"ל :&nbsp ' + a[i]['userName'] + '&nbsp מספר זהות :&nbsp' + a[i]['ID'] + '&nbsp סוג רשיון :&nbsp' + a[i]['LicenseType']  +'</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
            }
            document.getElementById('tabel').innerHTML = "";
            document.getElementById('tabel').innerHTML = tampString;
            if (a.length <= 0)
                $('#allse').addClass("hidden");
            else
                $('#allse').removeClass("hidden");
        };
        page(username);
        $('#allredio').click(function (event) {//מופעל מתי שלוחצים על בחר הכל
            if (this.checked) {
                $(':checkbox').each(function () {
                    this.checked = true;
                });
                $(':button').each(function () {
                    $(this).addClass("hidden");
                });
                $('#allButtenConfir').removeClass('hidden');
                $('#allButtenCancel').removeClass('hidden');
            }
            else {
                $(':checkbox').each(function () {
                    this.checked = false;
                });
                $(':button').each(function () {
                    $(this).removeClass("hidden");
                });
                $('#allButtenConfir').addClass('hidden');
                $('#allButtenCancel').addClass('hidden');
            }
        });
        function calc(change) {//מופעל בעת לחיצה על כל תיבת סימון בדף
            var flag = false;
            $(':checkbox').each(function () {
                if (this.checked) {
                    flag = true;
                }
            });
            if (flag) {
                testRedioTrue();
            }
            else {
                testRedioFalse();
            }
        }
        function testRedioTrue() {
            $(':button').each(function () {
                $(this).addClass("hidden");
            });
            $('#allButtenConfir').removeClass('hidden');
            $('#allButtenCancel').removeClass('hidden');
        }
        function testRedioFalse() {
            $(':button').each(function () {
                $(this).removeClass("hidden");
            });
            $('#allButtenConfir').addClass('hidden');
            $('#allButtenCancel').addClass('hidden');
        }
        function oneupdete(x) {
            $.ajax({
                url: "/api/v1/ListWaitinigQueue/" + x,
                type: "PUT",
                dataType: "JSON",
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        page(username);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function onedelite(x) {
            $.ajax({
                url: "/api/v1/ListWaitinigQueue/" + x,
                type: "DELETE",
                dataType: "JSON",
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        page(username);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        $("#allButtenConfir").click(() => {
            $(':checkbox').each(function () {
                if (this.checked) {
                    listUpdet.push(this.value);
                }
            });
            var index = listUpdet.indexOf('on');
            if (index != -1) {
                listUpdet.splice(index, 1);
            }
            for (var itam of listUpdet) {
                oneupdete(itam);
            }
            listUpdet = [];
            page(username);
        })
        $("#allButtenCancel").click(() => {
            $(':checkbox').each(function () {
                if (this.checked) {
                    listUpdet.push(this.value);
                }
            });
            var index = listUpdet.indexOf('on');
            if (index != -1) {
                listUpdet.splice(index, 1);
            }
            for (var itam of listUpdet) {
                onedelite(itam);
            }
            listUpdet = [];
            page(username);
        })

    </script>
</asp:Content>
