<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChoosingTeacher.aspx.cs" Inherits="LamedNetLite.ChoosingTeacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../JQ/jquery.min.js"></script>
    <link rel="stylesheet" href="../Bootstrap/css/bootstrap.min.css" />

    <style>
        div.searchable {
            width: 300px;
            float: left;
            margin: 0 15px;
        } 

        .searchable input {
            width: 100%;
            height: 50px;
            font-size: 18px;
            padding: 10px;
            -webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
            -moz-box-sizing: border-box; /* Firefox, other Gecko */
            box-sizing: border-box; /* Opera/IE 8+ */
            display: block;
            font-weight: 400;
            line-height: 1.6;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: .25rem;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
            /*            background: url("data:image/svg+xml;charset=utf-8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'%3E%3Cpath fill='%23343a40' d='M2 0L0 2h4zm0 5L0 3h4z'/%3E%3C/svg%3E") no-repeat right .75rem center/8px 10px;
*/
        }

        .searchable ul {
            display: none;
            list-style-type: none;
            background-color: #fff;
            border-radius: 0 0 5px 5px;
            border: 1px solid #add8e6;
            border-top: none;
            max-height: 180px;
            margin: 0;
            overflow-y: scroll;
            overflow-x: hidden;
            padding: 0;
        }

            .searchable ul li {
                padding: 7px 9px;
                border-bottom: 1px solid #e1e1e1;
                cursor: pointer;
                color: #6e6e6e;
            }

                .searchable ul li.selected {
                    background-color: #e8e8e8;
                    color: #333;
                }
    </style>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Manrope:wght@200&display=swap');

        body {
            font-family: 'Manrope', sans-serif;
            background: #eee
        }

        .size span {
            font-size: 11px
        }

        .color span {
            font-size: 11px
        }

        .product-deta {
            margin-right: 70px
        }

        .gift-card:focus {
            box-shadow: none
        }

        .pay-button {
            color: #fff
        }

            .pay-button:hover {
                color: #fff
            }

            .pay-button:focus {
                color: #fff;
                box-shadow: none
            }

        .text-grey {
            color: #a39f9f
        }

        .qty i {
            font-size: 11px
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" >
        <div>
            <div class="searchable" style="width: 991px; float: right; direction: rtl">
                <input type="text" id="inputSearch" placeholder="   חיפוש מורה  "  onkeyup="filterFunction(this,event)" />
                <ul>
                    <li></li>
                    <asp:Repeater runat="server" ID="rptTnames" OnItemDataBound="rptTnames_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <asp:Literal runat="server" ID="liName" /></li>
                        </ItemTemplate>
                    </asp:Repeater>

                </ul>
            </div>
            <br />
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <div>

            <div id="DivListTeachers">

                <asp:Repeater ID="rptTechersDetails" runat="server" OnItemDataBound="rptTechersDetails_ItemDataBound">
                    <ItemTemplate>
                        <div class="container mt-5 mb-5" style="direction: rtl">
                            <input type="hidden" runat="server" id="txtTid" />
                            <div class="d-flex justify-content-center row">
                                <div class="col-md-8">
                                    <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                                        <div class="mr-1">
                                            <img class="rounded" src="https://i.imgur.com/XiFJkhI.jpg" width="70">
                                        </div>
                                        <div class="d-flex flex-column align-items-center product-details">
                                            <span class="font-weight-bold">
                                                <asp:Literal runat="server" ID="ltrTname" /></span>
                                            <div class="d-flex flex-row product-desc">
                                                <div class="size mr-1"><span class="text-grey"></span><span class="font-weight-bold">&nbsp;</span></div>
                                                <div class="color"><span class="text-grey"></span><span class="font-weight-bold">&nbsp;</span></div>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-row align-items-center qty">
                                            <i class="fa fa-minus text-danger"></i>
                                            <h5 class="text-grey mt-1 mr-1 ml-1">
                                                <asp:Literal runat="server" ID="ltrSchoolName" /></h5>
                                            <i class="fa fa-plus text-success"></i>
                                        </div>
                                        <div>
                                            <h5 class="text-grey"><asp:Literal runat="server" ID="ltrLicenseTypse" /></h5>
                                        </div>
                                        <div class="d-flex align-items-center"><i class="fa fa-trash mb-1 text-danger">
                                            <asp:Button OnClick="btnSubFromList_Click" OnClientClick="" CssClass="btn-danger" runat="server" ID="btnSubFromList" Text="שלח בקשה להרשמה" /></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div id="SelectedTeacherDiv" class="container mt-5 mb-5 " style="direction: rtl; display: none">
                <input type="hidden" runat="server" id="txtTid" />
                <div class="d-flex justify-content-center row">
                    <div class="col-md-8">
                        <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                            <div class="mr-1">
                                <img class="rounded" src="https://i.imgur.com/XiFJkhI.jpg" width="70" />
                            </div>
                            <div class="d-flex flex-column align-items-center product-details">
                                <span class="font-weight-bold" id="Tname"></span>
                                <div class="d-flex flex-row product-desc">
                                    <div class="size mr-1"><span class="text-grey"></span><span class="font-weight-bold">&nbsp;</span></div>
                                    <div class="color"><span class="text-grey"></span><span class="font-weight-bold">&nbsp;</span></div>
                                </div>
                            </div>
                            <div class="d-flex flex-row align-items-center qty">
                                <i class="fa fa-minus text-danger"></i>
                                <h5 class="text-grey mt-1 mr-1 ml-1" id="SchoolName"></h5>
                                <i class="fa fa-plus text-success"></i>
                            </div>
                            <div>
                                <h5 class="text-grey" id="LicenseTypes"></h5>
                            </div>
                            <div class="d-flex align-items-center"><i class="fa fa-trash mb-1 text-danger">
                                <asp:Button CssClass="btn-danger" OnClick="btnSub_Click" runat="server" ID="btnSub" Text="שלח בקשה להרשמה" /></i></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:TextBox runat="server" ID="SelectedTeacherId" Style="visibility: hidden" Text="nb"></asp:TextBox>
        <input runat="server" hidden="hidden" id="HiddenInput" name="HiddenInput" value="" />
</form>
</body>
<asp:Literal runat="server" ID="ltrJs"></asp:Literal><%--var TeachersDet--%>
<script>

    var str;
    var s;
    var DataJson;
    var name;
    function setSelectedTeacer(val) {
        //var arrVal = val.split(" ");
        // alert(arrVal[0]);
        // str = val;
        // s = str.replaceAll(" ", "");
        //// s = s.split('שםביתספר');
        //// s = s.split('שםביתספר')[0];
        // s = s.split('שםביתספר')[0].replaceAll("\n", "");

        var data = { "val": val };
        $.ajax({
            url: "/api/v1/GetTeachers",
            type: "POST",
            dataType: "JSON",
            data: data,
            beforeSend: function () {
            },
            success: function (data) {
                if (data == 'invalid') {
                    console.log('error');
                }
                else {
                    DataJson = (JSON.parse(data))[0];//אובייקט עם נתוני המורה ובית הספר
                    var html = '';
                    $("#LicenseTypes").html(DataJson.LicenseType);
                    $("#Tname").html(DataJson.TeacherName);//      הכנסת הנתונים לאלמנט המוסתר
                    //$("#SchoolName").html = DataJson.TeacherId;
                    $("#SchoolName").html("בית ספר  "+DataJson.SchoolName);
                    $('#DivListTeachers').css('display', 'none');//   הסתרת רשימת המורים
                    $('#SelectedTeacherDiv').css('display', 'initial');//   ביטול הסתרה לאלמנט עם המורה שבחר
                    $("#SelectedTeacherId").val(DataJson.TeacherId + "," + DataJson.LicenseType + "," + DataJson.LicenseTypeID);
                    //    myData = data;
                    //    lessons = JSON.parse(data);
                    //    //lessons = data.split('_');
                    //    //צריך לרוץ בלולאה
                    //    var bool = true;
                    //    for (var i = 0; i < lessons.length; i++) {
                    //        if ((lessons[i][1].length) > 0) {
                    //            bool = false;
                    //        }
                    //    }
                    //    if (bool) {
                    //        alert("אין שיעורים פנויים  ביום שבחרת");
                    //    }
                    //    else {
                    //        document.getElementById("btn1").click();//מקפיץ את המודול
                    //    }
                }
            },
            error: function (e) {
                console.log('error ' + e);
            }
        });
    }
    function filterFunction(that, event) {
        let container, input, filter, li, input_val;
        container = $(that).closest(".searchable");
        input_val = container.find("input").val().toUpperCase();
        if (input_val == "") {
            $('#DivListTeachers').css('display', 'initial');//   הסתרת רשימת המורים
            $('#SelectedTeacherDiv').css('display', 'none');
        }
        if (["ArrowDown", "ArrowUp", "Enter"].indexOf(event.key) != -1) {
            keyControl(event, container)
        } else {
            li = container.find("ul li");
            li.each(function (i, obj) {
                if ($(this).text().toUpperCase().indexOf(input_val) > -1) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });

            container.find("ul li").removeClass("selected");
            setTimeout(function () {
                container.find("ul li:visible").first().addClass("selected");
            }, 100)
        }
    }

    function keyControl(e, container) {
        if (e.key == "ArrowDown") {

            if (container.find("ul li").hasClass("selected")) {
                if (container.find("ul li:visible").index(container.find("ul li.selected")) + 1 < container.find("ul li:visible").length) {
                    container.find("ul li.selected").removeClass("selected").nextAll().not('[style*="display: none"]').first().addClass("selected");
                }

            } else {
                container.find("ul li:first-child").addClass("selected");
            }

        } else if (e.key == "ArrowUp") {

            if (container.find("ul li:visible").index(container.find("ul li.selected")) > 0) {
                container.find("ul li.selected").removeClass("selected").prevAll().not('[style*="display: none"]').first().addClass("selected");
            }
        } else if (e.key == "Enter") {
            container.find("input").val(container.find("ul li.selected").text()).blur();
            onSelect(container.find("ul li.selected").text())
        }

        container.find("ul li.selected")[0].scrollIntoView({
            behavior: "smooth",
        });
    }

    function onSelect(val) {

        name = val.split('-')[0];
        name = name.replaceAll("\n", "");
        name = name.replaceAll("  ", "");
        $("#inputSearch").val(name);
        setSelectedTeacer(name.replaceAll(" ", ""));


        //for (var i = 0; i < TeachersDet.length; i++) {
        //    var Tid = TeachersDet[i].TeacherId;
        //    var Tname = TeachersDet[i].TeacherName;
        //    if (name == Tname.replaceAll(" ", "")) {

        //    }
        //}
        //console.log(val);
        //console.log(name);
        //alert(val);
        //setSelectedTeacer(val);
        //$("#btnSelectedOption").val(val);
        //$("#btn").val(val);
        ////$("#btn").attr("val") = val;
        //$('#btn').attr('value', val);
        ////alert(1);
        ////$("#btn").click();
        ////$('#txSelectedTeacherIdt1').attr('value', val);
        //s = val.replaceAll(" ", "");
        //// s = s.split('שםביתספר');
        //// s = s.split('שםביתספר')[0];
        //s = s.split('שםביתספר')[0].replaceAll("\n", "");
        //$("#HiddenInput").val(val);
        //$('#HiddenInput').attr('name', val);
        //window.location = "ChoosingTeacher.aspx?name=" + s;
        //$("#btnSelectedOption").click();
        //HiddenInput
    }

    $(".searchable input").focus(function () {
        $(this).closest(".searchable").find("ul").show();
        $(this).closest(".searchable").find("ul li").show();
    });
    $(".searchable input").blur(function () {
        let that = this;
        setTimeout(function () {
            $(that).closest(".searchable").find("ul").hide();
        }, 300);
    });

    $(document).on('click', '.searchable ul li', function () {
        $(this).closest(".searchable").find("input").val($(this).text()).blur();
        onSelect($(this).text())
    });

    $(".searchable ul li").hover(function () {
        $(this).closest(".searchable").find("ul li.selected").removeClass("selected");
        $(this).addClass("selected");
    });
    $(document).on("keydown", "form", function (event) {//  מנטרל את שליחת הטופס בעת לחיצה על אנטר
        return event.key != "Enter";
    });
</script>
</html>
