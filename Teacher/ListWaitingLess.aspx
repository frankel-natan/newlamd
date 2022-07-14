<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="ListWaitingLess.aspx.cs" Inherits="LamedNetLite.ListWaitingLess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    רשימת שיעורים בהמתנה
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div id="allse">
        <label>
            <input type="checkbox" id="allredio" name="remember">
            לבחירת הכל סמן כאן</label><br />
    </div>
    <div>
        <button type="button" id="allButtenConfir" class="btn btn-warning hidden">אישור</button>
        <button type="button" id="allButtenCancel" class="btn btn-success hidden">ביטול</button>
    </div>
    <div id="tabel" style="width: 80%"></div>
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog" style="text-align: center;">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="titel">כותרת</h4>
                </div>
                <div class="modal-body">
                    <div style="display: flex;">
                        <div style="width: 40%;">
                            <div class="form-group">
                                <label for="Place">שם פרטי ומשפחה</label>
                                <input class="form-control input-sm" id="nameFamaly" type="text">
                            </div>
                            <div class="form-group">
                                <label for="Place">כתובת</label>
                                <input class="form-control input-sm" id="Place" type="text">
                            </div>
                            <div class="form-group">
                                <label for="idnumber">מספר זהות</label>
                                <input class="form-control input-sm" id="idnumber" type="text" disabled>
                            </div>
                            <div class="form-group">
                                <label for="phone">טלפון</label>
                                <input class="form-control input-sm" id="phone" type="text">
                            </div>
                            <div class="form-group">
                                <label for="email">דוא"ל</label>
                                <input class="form-control input-sm" id="email" type="text">
                            </div>
                            <div class="form-group">
                                <label for="price">מחיר לשיעור</label>
                                <input class="form-control input-sm" id="price" type="text">
                            </div>
                        </div>
                        <div style="width: 60%; text-align: -webkit-center;">
                            <img src="../Student/images/cat.jpg" class="img-circle" alt="Cinque Terre" width="304" height="236">
                            <div class="form-group" style="width: 50%; text-align: center">
                                <label for="sel1">סטאטוס תלמיד</label>
                                <select class="form-control" id="sel1" style="text-align: center;">
                                </select>
                            </div>
                            <div class="form-group" style="width: 50%; text-align: center">
                                <label for="sel2">סוג רשיון</label>
                                <select class="form-control" id="sel2" style="text-align: center;">
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" id="footerButten">
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
        var a;
        var listUpdet = [];
        var tampString;
        var jsonarrTest = {}
        function listWatining(x) {
            $.ajax({
                url: "/api/v1/getLessonsWatinng/" + x,
                type: "GET",
                dataType: "JSON",
                beforeSend: function () {
                    a = [];
                    listUpdet = [];
                    jsonarrTest = {};
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
            var i = 0;
            for (let itam of x) {
                var day = itam.DateLesson.split("T");
                dayRli = day[0].split("-");
                newDay = dayRli[2] + "/" + dayRli[1] + "/" + dayRli[0];
                var tim = itam.BeginningTime.split(":");
                var newTime = tim[0] + ":" + tim[1];
                var timEnd = itam.EndTime.split(":");
                var newTimeEnd = timEnd[0] + ":" + timEnd[1];
                var stringtamp = 'les' + itam.DrivingLessonsId;
                var tmp;
                for (var j = 0; j < a.length; j++) {
                    if (a[j]['DrivingLessonsId'] != itam.DrivingLessonsId) {
                        tmp = betwin(day[0], newTime, newTimeEnd, stringtamp, j);
                        if (jsonarrTest.stringtamp) {
                            jsonarrTest[stringtamp].push(tmp);
                        }
                        else if (tmp != -1) {
                            stringtamp = "les" + itam.DrivingLessonsId;
                            jsonarrTest[stringtamp] = [];
                            jsonarrTest[stringtamp].push(tmp);
                        }
                    }
                }
                if (tmp == -1) {
                    tampString += '<div  class="alert alert-danger id=""  style="display: flex;"><div style="width: 60%">' +
                        '</label><input type="checkbox" id="les' + itam.DrivingLessonsId + '" value="' + itam.DrivingLessonsId + '" name="chaek' + itam.DrivingLessonsId + '" onclick="calc(this)";/> סמן כאן</label><br/>' +
                        '<a data-toggle="modal" href="#myModal" class="alert-link" id=' + itam.StudentId + ' onclick="func(' + [i] + ')" value="' + [i] + '" >' + itam.StudentName + '&nbsp</a><br/>' +
                        'פרטי שיעור  :' + newDay + '&nbsp  מ - ' + newTime + 'עד&nbsp -&nbsp' + newTimeEnd +
                        '</div>' +
                        '<div style="width: 35%">' +
                        '<button type="button" id="lesBuconf' + itam.DrivingLessonsId + '" value="' + itam.DrivingLessonsId + '" class="btn btn-warning" onclick="oneupdete(this)" style="margin:3px;">אישור</button>' +
                        '<button type="button" id="lesBuDel' + itam.DrivingLessonsId + '"  value="' + itam.DrivingLessonsId + '" class="btn btn-success" onclick="onedelite(this);" style="margin:3px;">ביטול</button>' +
                        '</div>' +
                        '</div>';
                }
                else {
                    tampString += '<div  class="alert alert-danger id=""  style="display: flex;"><div style="width: 60%">' +
                        '</label><input type="checkbox" id="les' + itam.DrivingLessonsId + '" value="' + itam.DrivingLessonsId + '" name="chaek' + itam.DrivingLessonsId + '" onclick="calc(this)";/> סמן כאן</label><br/>' +
                        '<a data-toggle="modal" href="#myModal" class="alert-link" id=' + itam.StudentId + ' onclick="func(' + [i] + ')" value="' + [i] + '" >' + itam.StudentName + '&nbsp</a><br/>' +
                        'פרטי שיעור  :' + newDay + '&nbsp  מ - ' + newTime + 'עד&nbsp -&nbsp' + newTimeEnd + '<br/><div style="color:#ff1b12;">שים לב : שיעור זה חופף לשיעור אחר!!!!</div>'+
                        '</div>' +
                        '<div style="width: 35%">' +
                        '<button type="button" id="lesBuconf' + itam.DrivingLessonsId + '" value="' + itam.DrivingLessonsId + '" class="btn btn-warning" onclick="oneupdete(this)" style="margin:3px;" >אישור</button>' +
                        '<button type="button" id="lesBuDel' + itam.DrivingLessonsId + '"  value="' + itam.DrivingLessonsId + '" class="btn btn-success" onclick="onedelite(this);" style="margin:3px;">ביטול</button>' +
                        '</div>' +
                        '</div>';
                }
                i++;
            }
            i = 0;
            document.getElementById('tabel').innerHTML = "";
            document.getElementById('tabel').innerHTML = tampString;
            $('#allButtenConfir').addClass('hidden');
            $('#allButtenCancel').addClass('hidden');
            $('#allredio').prop("checked", false);
            if (a.length <= 0)
                $('#allse').addClass("hidden");
            else
                $('#allse').removeClass("hidden");
        }
        listWatining(username);
        $('#allredio').click(function (event) {//מופעל מתי שלוחצים על בחר הכל
            if (this.checked) {
                $(':checkbox').each(function () {
                    this.checked = true;
                });
                $(':checkbox').each(function () {
                    if (this.checked) {
                        if (jsonarrTest[this.id])
                        for (var x of jsonarrTest[this.id]) {
                            $('#' + x).prop("checked", false);
                        }
                    }
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
            if (change.checked) {
                for (var x of jsonarrTest[change.id]) {
                    if ($('#' + x).is(":checked"))
                        alert('שיעור חופף מבוטל!!!');
                    $('#' + x).prop("checked", false);
                }
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
            updetLessons(listUpdet);
            listWatining(username);
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
            deliteLessons(listUpdet);
            listWatining(username);
        })
        function updetLessons(listlesu) {
            for (var itam of listlesu) {
                $.ajax({
                    url: "/api/v1/getLessonsWatinng/" + itam,
                    type: "PUT",
                    dataType: "JSON",
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
        }
        function deliteLessons(listlesu) {
            for (var itam of listlesu) {
                $.ajax({
                    url: "/api/v1/getLessonsWatinng/" + itam,
                    type: "DELETE",
                    dataType: "JSON",
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
        }
        function oneupdete(x) {
            listUpdet.push(x.value);
            updetLessons(listUpdet);
            listWatining(username);
        }
        function onedelite(x) {
            listUpdet.push(x.value);
            deliteLessons(listUpdet);
            listWatining(username);
        }
        function func(ew) {
            $("#titel").text(a[ew]['StudentName']);
            $("#Place").attr('placeholder', a[ew]['GatheringPlace']);
            $("#nameFamaly").attr('placeholder', a[ew]['StudentName']);
            //$("#Place").attr('value',);
            document.getElementById('Place').value = "";//פועל
            //$("#Place").text($("#Place").text() + "  " + a[ew.value]['GatheringPlace']);
            //$("#idnumber").text($("#idnumber").text() + " " + a[ew.value]['ID']);
            $("#idnumber").attr('placeholder', a[ew]['ID']);
            $("#phone").attr('placeholder', a[ew]['Phone']);
            $("#email").attr('placeholder', a[ew]['userName']);
            $("#price").attr('placeholder', a[ew]['PricePerLesson']);
            clairValue(['Place', 'nameFamaly', 'phone', 'idnumber', 'email', 'price']);
            $("#sel1 option").each(function () {
                $(this).remove();
            });
            $("#sel2 option").each(function () {
                $(this).remove();
            });
            $("#footerButten button").each(function () {
                $(this).remove();
            });
            $("#footerButten").append(`<button type="button" id=${a[ew]['StudentId']} value=id=${a[ew]['StudentId']} class="btn btn-success" onclick="updetStudent(this)" data-dismiss="modal">עדכן</button>`);
            $("#footerButten").append(`<button type="button" class="btn btn-info" data-dismiss="modal">סגור</button>`);
            selectStatusAjax(a[ew]['StatuseId']);
            selectLicensAjax(a[ew]['LicenseTypeID']);
        }
        function clairValue(idinput) {
            for (let itam of idinput) {
                document.getElementById(itam).value = "";//פועל
            }
        }
        function selectStatusAjax(x) {
            $.ajax({
                url: "/api/v1/selectStatusStudent",
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
                        b.map((name, i) => {
                            if (name.Id === x) {
                                $('#sel1').append(`<option selected value="${name.Id}">${name.name}</option>`);
                            }
                            else {
                                $('#sel1').append(`<option value="${name.Id}">${name.name}</option>`);
                            }
                        })
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function selectLicensAjax(x) {
            $.ajax({
                url: "/api/v1/LiceneType",
                type: "GET",
                dataType: "JSON",
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        c = JSON.parse(data);
                        c.map((name, i) => {
                            if (name.Id === x) {
                                $('#sel2').append(`<option selected value="${name.Id}">${name.name}</option>`);
                            }
                            else {
                                $('#sel2').append(`<option value="${name.Id}">${name.name}</option>`);
                            }
                        })
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function updetStudent(bw) {
            for (let name of a) {
                if (name.StudentId == bw.id) {
                    jsstudent = { ...name };//העתקת גי'סון ולא מצביע(שלא ישנה את המקור)
                }
            }
            jsstudent.GatheringPlace = (Place.value ? Place.value : Place.placeholder);//$("#Place").val();
            jsstudent.StatuseId = document.querySelector('#sel1').value;//($('#sel1 option:selected').val ? $('#sel1 option:selected').val : 55);//תיבת בחירה
            jsstudent.StudentName = (nameFamaly.value ? nameFamaly.value : nameFamaly.placeholder);
            jsstudent.ID = (idnumber.value ? idnumber.value : idnumber.placeholder);
            jsstudent.Phone = (phone.value ? phone.value : phone.placeholder);
            jsstudent.userName = (email.value ? email.value : email.placeholder);
            jsstudent.LicenseTypeID = document.querySelector('#sel2').value;//זמני
            jsstudent.PricePerLesson = (price.value ? price.value : price.placeholder);
            jsstudentAJAX = {
                'StudentId': jsstudent.StudentId,
                'TeacherId': jsstudent.TeacherId,
                'StatuseId': jsstudent.StatuseId,
                'StudentName': jsstudent.StudentName,
                'ID': jsstudent.ID,
                'Phone': jsstudent.Phone,
                'UserName': jsstudent.userName,
                'Password': jsstudent.Password,
                'LicenseTypeID': jsstudent.LicenseTypeID,
                'GatheringPlace': jsstudent.GatheringPlace,
                'PricePerLesson': jsstudent.PricePerLesson,
                'DateAdded': (jsstudent.DateAdded).replace('T', ' '),
                'ProfilePicName': 'dif'
            }
            $.ajax({
                url: "/api/v1/lassonstudent",
                type: "POST",
                dataType: "json",
                data: jsstudentAJAX,
                beforeSend: function () {
                    alert(jsstudent.StudentId);
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        document.getElementById('tabel').innerHTML = "";
                        listWatining(username);
                        yesmess();
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });

        }
        function betwin(dateLess, timeS, timeE, idless, j) {
            var test=-1;
            const testStart = new Date(dateLess + ' ' + timeS+':00');
            const testend = new Date(dateLess + ' ' + timeE+':00');
            var indexT = a[j]['DateLesson'].indexOf('T');
            var datelesson = a[j]['DateLesson'].substring(0, indexT);
            const start = new Date(datelesson + ' ' + a[j]['BeginningTime']);
            const end = new Date(datelesson + ' ' + a[j]['EndTime']);
            if (testStart > start && testStart < end)
                test = 'les' + a[j]['DrivingLessonsId'];
            else if (testend > start && testend < end)
                test = 'les' + a[j]['DrivingLessonsId'];
            return test;
            
        }
    </script>
</asp:Content>
