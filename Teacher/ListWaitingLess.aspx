<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="ListWaitingLess.aspx.cs" Inherits="LamedNetLite.ListWaitingLess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    רשימת שיעורים בהמתנה
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div id="tabel" style="width: 80%"></div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="js" runat="server">
    <script>
        var username = '<%= Session["TeacherId"] %>';//שליפה מסשן
        var a;
        var tampString;
        function listWatining(x) {
            $.ajax({
                url: "/api/v1/getLessonsWatinng/" + x,
                type: "GET",
                dataType: "JSON",
                beforeSend: function () {
                    a = [];
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        a = JSON.parse(data);
                        page(a);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function page(x) {
            tampString = '';
            for (let itam of x) {
                var day = itam.DateLesson.split("T");
                dayRli = day[0].split("-");
                newDay = dayRli[2] + "/" + dayRli[1] + "/" + dayRli[0];
                var tim = itam.BeginningTime.split(":");
                var newTime = tim[0] + ":" + tim[1];
                var timEnd = itam.EndTime.split(":");
                var newTimeEnd = tim[0] + ":" + tim[1];
                tampString += '<div  class="alert alert-danger id=""  style="display: flex;"><div style="width: 60%">' +
                    '<input type="checkbox" id= name="remember"> סמן כאן</label><br/>' +
                    '<a href = "#" class="alert-link" >' + itam.StudentName + '&nbsp</a><br/>' +
                    'פרטי שיעור  :' + newDay + '&nbsp  מ - ' + newTime + 'עד&nbsp -&nbsp' + newTimeEnd +
                    '</div>' +
                    '<div style="width: 35%">'+
                    '<button type="button" class="btn btn-warning">אישור</button>' +
                    '<button type="button" class="btn btn-success">ביטול</button>'+
                    '</div>'+
                    '</div>';
            }
            document.getElementById('tabel').innerHTML = tampString;
        }
        listWatining(username);



    </script>
</asp:Content>
