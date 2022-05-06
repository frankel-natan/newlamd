<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="StudentsWaitingList.aspx.cs" Inherits="LamedNetLite.StudentsWaitingList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    <label>תלמידים בהמתנה  </label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <form id="form1" runat="server">

        <label id="CheckAllLable" class="hidden">
            בחר הכל
    <input class="form-check-input" type="checkbox" value="" id="CheckAll">
        </label>
        <div id="headChecks">
            <input type="hidden" runat="server" id="inputHi" value="" />
            <button class="hidden" runat="server" id="btnOkhi" onserverclick="btnOkhi_ServerClick" value="" name="jj"></button>
            <button class="hidden" runat="server" id="Btndeletehi" onserverclick="Btndeletehi_ServerClick" value=""></button>
            <button type="button" onclick="btnSetchecksClik('btnOkhi');" class="btn btn-success hidden" id="btnOkHead">אישור</button>
            <button type="button" onclick="btnSetchecksClik('Btndeletehi');" id="btnDeleHead" style="background-color: red; border-color: red;" class="btn btn-success hidden">מחיקה</button>
            <%-- 
                            בעת לחיצה על כפתור אישור שבראש הדף          
                               btnSetchecksClik      מופעלת הפונקציה
                               btnOkhi ונשלח לה האיידי של הכפתור המוסתר
                   inputHi  הפונקציה ממלאה את הערך של האינפוט המוסתר 
                בכל האידיים בדף שנבחרו
                ואז מפעילה את הכפתור שהאיידי שלו נשלח אליה
                אותו דבר עם הכפתור מחק שבראש הדף
            --%>
        </div>

        <br />
        <br />

        <ul class="list-group ">
            <asp:Repeater runat="server" ID="RptList" OnItemDataBound="RptList_ItemDataBound">
                <ItemTemplate>
                    <li class="list-group-item container" style="height: 100%;">
                        <input runat="server" id="checkboxStudent" style="display: initial;" class="form-check-input me-1" type="checkbox" value="" aria-label="..." />
                        <%--                        שלמה ילין - שיעור רגיל   תאריך:17/3/2022    משך השיעור:40 דקות תחילת שיעור:12:20:00        --%>
                        <asp:Literal runat="server" ID="itemText"></asp:Literal>
                        <div>
                            <button runat="server" onserverclick="btnOk_ServerClick" id="btnOk" style="float: left" class="btn btn-success">אישור</button>

                            <button runat="server" onserverclick="btnDelete_ServerClick" id="btnDelete" style="float: left; background-color: red; border-color: red;" class="btn btn-success">מחיקה</button>
                        </div>
                    </li>

                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </form>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="js" runat="server">
    <script>
        $('#CheckAll').click(function (event) {//מופעל מתי שלוחצים על בחר הכל
            if (this.checked) {
                // Iterate each checkbox
                $(':checkbox').each(function () {
                    this.checked = true;
                });
            }
            else {
                $(':checkbox').each(function () {
                    this.checked = false;
                });
            }
        });
        $('input[type="checkbox"]').change(function () {//מופעל בעת לחיצה על כל תיבת סימון בדף
            var c = 0;
            $(':checkbox').each(function () {
                if (this.checked) {
                    c++;
                }
            });
            if (c == 0) {
                $(':button').each(function () {
                    if (this.innerText == "אישור" || this.innerText == "מחיקה") {
                        $(this).removeClass('hidden');
                    }
                });
                $('#btnOkHead').addClass('hidden');//מסתיר את הכפתורים למעלה
                $('#btnDeleHead').addClass('hidden');//CheckAllLable
                $('#CheckAllLable').addClass('hidden');

            }
            else {
                $(':button').each(function () {
                    if (this.innerText == "אישור" || this.innerText == "מחיקה") {
                        $(this).addClass('hidden');
                    }
                });
                $('#btnOkHead').removeClass('hidden');
                $('#btnDeleHead').removeClass('hidden');
                $('#CheckAllLable').removeClass('hidden');
            }

        });

        //var OkArr = [];
        //$("button").click(function () {
        //    //alert($(this).html());
        //    var text = $(this).html();//val();
        //    var val = $(this).val();
        //    if (text[0] == "א") {
        //        OkArr.push(val)
        //        $(this).parent().parent().parent().parent().hide();
        //        // alert(val);
        //    }

        //});
        function btnSetchecksClik(id) {
            var str = '';
            $(':checkbox').each(function () {
                if (this.checked) {
                    str += $(this).val() + ',';
                }
            });
            str = str.substring(0, str.length - 1);//מוחק את הפסיק האחרון
            if (str[0] == ',')
                str = str.substring(1);
            if (id == 'btnOkhi') {
               // $('#main_btnOkhi').val(str);
                $('#main_inputHi').val(str);//מכניס לכפתור המוסתר את רשימת האידייים
                $('#main_btnOkhi').trigger('click');
            }
            else {
               // $('#main_Btndeletehi').val(str);
                $('#main_inputHi').val(str);
                $('#main_Btndeletehi').trigger('click');
            }

        }
        //$("button").click(function () {
        //    $(this).parent().hide();
        //});

    </script>
</asp:Content>
