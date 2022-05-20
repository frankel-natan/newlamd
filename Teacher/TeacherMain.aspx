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
    <button id="test">Hide</button>
    <div id="calendar"></div>
</asp:Content>
<asp:Content ContentPlaceHolderID="js" ID="script" runat="server">

    <script src="../Calendar/lib/main.js"></script>
    <script src="../Calendar/lib/locales/he.js"></script>
    <link href="../Calendar/lib/main.css" rel="stylesheet" />
    <script src="eventsHandler.ashx"></script>
    <script>



        var ev = {
            title: 'event15',
            start: '2022-05-12T19:20:00',
            end: '2022-05-12T20:00:00',
            allDay: false // will make the time show
        };
        var llkk = '';
        var llkk2 = '';
        var tamp;
        var q;
        var q2;
        $.ajax({
            url: "/api/v1/taemain",
            type: "GET",
            dataType: "JSON",
            //data: data,
            beforeSend: function () {
            },
            async: true,
            success: function (data) {
                if (data == 'invalid') {
                    console.log('error');
                }
                else {
                    //data = data.responseText;
                    //var zx = data.responseJSON;
                    //var w = JSON.parse(zx);
                    //console.log(JSON.stringify(data));
                    //alert(zx);
                    //alert(eval(data));
                    //llkk = '{' + eval(data) + '}';
                    //llkk2 = w;//JSON.parse(data.responseJSON);
                    //alert(llkk2.title);
                    //jQuery.parseJSON(data);
                    alert(data);
                    //q = data.responseJSON;
                    q2 = JSON.parse(data);
                    alert(q2);
                    debugger
                    tamp = q2;
                    
                    
                }
            },
            error: function (e) {
                console.log('error ' + e);
            }
        });

        


        //$(document).ready(function () {
        //    $("#test").click(function () {
        //        document.addEventListener('DOMContentLoaded', function () {
        //            var calendarEl = document.getElementById('calendar');
        //            var calendar = new FullCalendar.Calendar(calendarEl, {
        //                //initialView: 'dayGridMonth',

        //                events: arrEvent,
        //                headerToolbar: {
        //                    left: 'prev,next today',
        //                    center: 'title',
        //                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
        //                }, // buttons for switching between views
        //                locale: 'he',
        //                buttonIcons: true, // show the prev/next text
        //                weekNumbers: false,
        //                navLinks: true, // can click day/week names to navigate views
        //                editable: true,
        //                dayMaxEvents: true,




        //                direction: 'rtl',
        //                slotMinTime: '01:00',
        //                slotMaxTime: '24:00',
        //                events: [tamp,
        //                    {
        //                        title: 'event1',
        //                        start: '2022-05-01'
        //                    },
        //                    {
        //                        title: 'event2',
        //                        start: '2022-05-05',
        //                        end: '2022-05-07'
        //                    },
        //                    {
        //                        title: 'event3',
        //                        start: '2022-05-12T13:20:00',
        //                        end: '2022-05-12T14:00:00',
        //                        allDay: false // will make the time show
        //                    },
        //                    {
        //                        title: 'event3',
        //                        start: '2022-05-12T14:00:00',
        //                        end: '2022-05-12T14:40:00',
        //                        allDay: false // will make the time show
        //                    },
        //                    {
        //                        title: 'event3',
        //                        start: '2022-05-12T14:40:00',
        //                        end: '2022-05-12T15:10:00',
        //                        allDay: false // will make the time show
        //                    },
        //                    {
        //                        title: 'event3',
        //                        start: '2022-05-12T15:10:00',
        //                        end: '2022-05-12T15:50:00',
        //                        allDay: false // will make the time show
        //                    }
        //                ],
        //                //dateClick: function () {
        //                //    alert('a day has been clicked!');
        //                //},
        //                dateClick: function (info) {
        //                    alert('Date: ' + info.dateStr);
        //                    //window.location="../MyAcount.aspx";
        //                    //alert('Resource ID: ' + info.resource.id);


        //                }

        //            });
        //            calendar.render();

        //            //calendar.setOption('locale', 'fr');

        //        });
        //    });
        //});



        var data1 = "{  \"key1\": \"value1\" }";
        var data = { 5: "hhh", 3: "jjj" };
        var x;
        function aj(x) {
            var c = $.ajax({
                url: "/api/v1/taemain/" + x,
                type: "GET",
                dataType: "JSON",
                //data: data,
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');

                    }
                    else {
                        alert(data);
                        JSON.parse(data);
                        x = data += "ddd";
                        alert(data.responseJSON);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
            alert(c.responseJSON);
            return c;
        }
        function praj(x) {
            var y = aj(x);
            var z = y.responseText;// + "  " + y.responseText;
            alert(z);
            console.log("kkkkkkkky");


        };
        function xxx() {
            console.log(500);
        };
        debugger

        $.ajax({
            url: "/api/v1/taemain",
            type: "POST",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            data: 'natan',
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

        //DOMContentLoaded
        document.addEventListener('DOMContentLoaded', function () {
        //document.addEventListener('unload', function () {
        //document.getElementById("test").addEventListener("click", function () {
        //$(document).ready(function aa() {

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
                buttonIcons: true, // show the prev/next text
                weekNumbers: false,
                navLinks: true, // can click day/week names to navigate views
                editable: true,
                dayMaxEvents: true,
                direction: 'rtl',
                slotMinTime: '01:00',
                slotMaxTime: '24:00',
                events: [
                    {
                        title: 'event1',
                        start: '2022-05-01'
                    },
                    {
                        title: 'event2',
                        start: '2022-05-05',
                        end: '2022-05-07'
                    },
                    {
                        title: 'event3',
                        start: '2022-05-12T13:20:00',
                        end: '2022-05-12T14:00:00',
                        allDay: false // will make the time show
                    },
                    {
                        title: 'event3',
                        start: '2022-05-12T14:00:00',
                        end: '2022-05-12T14:40:00',
                        allDay: false // will make the time show
                    },
                    {
                        title: 'event3',
                        start: '2022-05-12T14:40:00',
                        end: '2022-05-12T15:10:00',
                        allDay: false // will make the time show
                    },
                    {
                        title: 'event3',
                        start: '2022-05-12T15:10:00',
                        end: '2022-05-12T15:50:00',
                        allDay: false // will make the time show
                    }
                    //{
                    //    //title: q2.title,
                    //    //start: q2.start,
                    //    //end: q2.end,
                    //    //allDay: false
                    //}
                ],
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
        });
        
          
    </script>
</asp:Content>


