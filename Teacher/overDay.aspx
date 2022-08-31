<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="overDay.aspx.cs" Inherits="LamedNetLite.overDay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    שיעורים הממתינים לעדכון מצב
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div class="panel panel-green">
        <div class="panel-heading">
            <div class="row">
                <div class="col-md-6">
                    <h3>רשימת שיעורים</h3>
                </div>
                <div class="col-md-6" style="text-align: end; padding: 5px 16px 5px 20px; display: block; float: left; font-size: 16px; margin-top: 4px">
                    <button class="btn btn-primary" id="sendL" type="button">עדכן</button>
                </div>
            </div>


        </div>
        <div class="panel-body">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>שם תלמיד</th>
                        <th>תאריך </th>
                        <th>שעת התחלה</th>
                        <th>שעת סיום</th>
                        <th>עדכון מצב שיעור</th>
                    </tr>
                </thead>
                <tbody id="ta">
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="js" runat="server">
    <script>
        var username = '<%= Session["TeacherId"] %>';//שליפה מסשן
        var arrvent;
        var tampjs;
        var jsonarr;
        var stringtable = '';
        function ajLassons2(x) {
            $.ajax({
                url: "/api/v1/taemain/" + x,
                type: "GET",
                dataType: "JSON",
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        jsonarr = JSON.parse(data);
                        lisrup();
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function lisrup() {
            stringtable = '';
            for (var i of jsonarr) {
                var d = new Date();
                var d2 = new Date(i.DateLesson.split("T")[0] + " " + i.EndTime);
                if (d < d2 && i.StatuseId == 2)
                    stringtable += "<tr>" +
                        "<td>" + i.StudentName + "</td>" +
                        "<td>" + i.DateLesson.split("T")[0] + "</td>" +
                        "<td>" + i.BeginningTime + "</td>" +
                        "<td>" + i.EndTime + "</td>" +
                        '<td><input name="' + i.DrivingLessonsId + '" id="' + i.DrivingLessonsId + '" type="radio" value="n' + i.DrivingLessonsId + ' />&rlm;<label for="' + i.DrivingLessonsId + '">בוצע</label><br/>' +
                        '<input name="' + i.DrivingLessonsId + '" id="' + i.DrivingLessonsId + '@" type="radio" value="y' + i.DrivingLessonsId + ' />&rlm;<label for="' + i.DrivingLessonsId + '@">לא בוצע</label></dt>'
                "</tr>";
            }
            document.getElementById('ta').innerHTML = stringtable;
        }
        ajLassons2(username);
        var lis1 = [];
        $("#sendL").click(() => {
            lis1 = [];
            $('input[type=radio]').each(function () {
                if ((document.getElementById(this.id).checked)) {

                    lis1.push(this.id);
                    alert(lis1);
                }

            });
            updlist();
        })
        function updlist() {
            for (var i of lis1) {
                if (i.substring(i.length - 1) == '@') {
                    alert('no');
                    var idsend = i.substring(0, i.length - 1);
                    upone(idsend, 4);
                }
                else {
                    upone(i, 3);
                }
            }
            ajLassons2(username);
        }
        function upone(idDrivung, st) {
            $.ajax({
                url: "/api/v1/updlessonoverday/" + idDrivung,
                type: "PUT",
                contentType: "application/json; charset=utf-8",
                dataType: "text",
                data: '"' + st + '"',
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });

        }
    </script>
</asp:Content>
