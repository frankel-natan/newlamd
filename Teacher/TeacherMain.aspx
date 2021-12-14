<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="TeacherMain.aspx.cs" Inherits="LamedNetLite.TeacherMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="head2" runat="server" ID="js2">
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
<%--    <script src="../JQ/jquery.min.js"></script>--%>
    <%--    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>--%>
<%--    <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />--%>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />--%>
    <%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>--%>
<%--    <script src="../Bootstrap/js/bootstrap.min.js"></script>--%>

</asp:Content>
<asp:Content ContentPlaceHolderID="main" ID="calendarView" runat="server">

    <div id="calendar"></div>
</asp:Content>
<asp:Content ContentPlaceHolderID="js" ID="script" runat="server">
    <script src="../Calendar/lib/main.js"></script>
    <link href="../Calendar/lib/main.css" rel="stylesheet" />
    <script src="eventsHandler.ashx"></script>
    <script>
            document.addEventListener('DOMContentLoaded', function () {
                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    //initialView: 'dayGridMonth',

                    events: arrEvent,
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                    }, // buttons for switching between views

                    locale: 'he',
                    direction: 'rtl',
                    slotMinTime: '01:00',
                    slotMaxTime: '24:00',
                    //dateClick: function () {
                    //    alert('a day has been clicked!');
                    //},
                    dateClick: function (info) {
                        alert('Date: ' + info.dateStr);
                        //window.location="../MyAcount.aspx";
                        //alert('Resource ID: ' + info.resource.id);


                    }

                });
                calendar.render();

                //calendar.setOption('locale', 'fr');

            });


    </script>
</asp:Content>
