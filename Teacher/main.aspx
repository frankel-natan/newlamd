<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="LamedNetLite.main" %>

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
   <script  src =" https://polyfill.io/v3/polyfill.min.js?features=Array.from,Promise,Symbol,Object.setPrototypeOf,Object.getOwnPropertySymbols,Set,Math.trunc,BigInt,Map,Reflect ,WeakMap,WeakRef,WeakSet "> </script>

    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    ברוך שובך המורה 
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <button id="test">Hide</button>
    <div id="calendar"></div>


    <%--        <div class="col-md-4">
            <div class="panel panel-primary ">
            <div class="panel-heading">Panel with panel-primary class</div>
            <div class="panel-body">Panel Content</div>
        </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-primary ">
            <div class="panel-heading">Panel with panel-primary class</div>
            <div class="panel-body">Panel Content</div>
        </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-primary ">
            <div class="panel-heading">Panel with panel-primary class</div>
            <div class="panel-body">Panel Content</div>
        </div>
        </div>       
        <div class="panel panel-success col-md-4">
            <div class="panel-heading">Panel with panel-success class</div>
            <div class="panel-body">Panel Content</div>
        </div>
        <div class="panel panel-info col-md-4">
            <div class="panel-heading">Panel with panel-info class</div>
            <div class="panel-body">Panel Content</div>
        </div><div class="col-md-4">
            <div class="panel panel-primary ">
            <div class="panel-heading">Panel with panel-primary class</div>
            <div class="panel-body">Panel Content</div>
        </div>
        </div>        
        <div class="panel panel-warning col-md-4">
            <div class="panel-heading">Panel with panel-warning class</div>
            <div class="panel-body">Panel Content</div>
        </div>
        <div class="panel panel-danger col-md-4">
            <div class="panel-heading">Panel with panel-danger class</div>
            <div class="panel-body">Panel Content</div>
        </div>
    </div>--%>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; align-content: center;">כל הזכויות שמורות </div>
    <script src="../Calendar/lib/main.js"></script>
    <script src="../Calendar/lib/locales/he.js"></script>
    <link href="../Calendar/lib/main.css" rel="stylesheet" />
    <script src="eventsHandler.ashx"></script>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="js" runat="server">
    <script>
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
                    xx(q2);
                }
            },
            error: function (e) {
                console.log('error ' + e);
            }
        });
        function xx(q2) {
            
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
                selectable: false,

                events: [q2
                    //{          
                    //    start: q2.start,
                    //    title: q2.title,
                    //    end: q2.end,
                    //    allDay: false // will make the time show
                    //}
                ],
                //dateClick: function () {
                //    alert('a day has been clicked!');
                //},
                dateClick: function (info) {
                    alert('Date: ' + info.dateStr);
                    //window.location="../MyAcount.aspx";
                    //alert('Resource ID: ' + info.resource.id);
                },
                
            });
            calendar.render();
        }

    </script>
</asp:Content>
