<%@ Page Title="" Language="C#" MasterPageFile="~/School/SchoolMaster.Master" AutoEventWireup="true" CodeBehind="listTast.aspx.cs" Inherits="LamedNetLite.listTast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_header" runat="server">
    רשימת טסטים להזמנה
    <asp:Label runat="server" ID="nameScool"></asp:Label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div class="col-md-8">
        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
            <thead>
                <tr>
                    <th>מצב טסט</th>
                    <th>תאריך טסט</th>
                    <th>תאריך הזמנה</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="RptDataTable" runat="server" OnItemDataBound="RptDataTable_ItemDataBound">
                    <ItemTemplate>
                        <tr class="odd gradeX">
                            <td><%#Eval("nameStatus") %></td>
                            <td>
                                <div runat="server" id="dateT"><%#Eval("nameTeacher") %></div>
                            </td>
                            <td>
                                <div runat="server" id="dateO"><%#Eval("dat") %></div>
                            </td>
                            <td>
                                <button type="button" runat="server" class="btn btn-primary a" id="upTast" data-toggle="modal" data-target="#myModal" onclick="modeldata()" >לעדכון</button>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">נא בחר סטטוס מתוך הרשימה</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group col-5">
                        <label for="sel1"></label>
                        <div id="selectdata"></div>
                        <select class="form-control" id="sel1" name="idSelectTae">
                            <asp:Panel ID="contentTeachers" runat="server">
                            </asp:Panel>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" ID="update" class="btn btn-primary"  OnClick="update_Click"/>
                    <input type="hidden" runat="server" id="hi" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">סגור</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="scripts" runat="server">
    <script>
        function modeldata() {
            alert('gggggggg');
        }
        $(".a").click(function () {
            alert($(this).attr("data-id"));
            var x = $(this).attr("data-id");
            var y = x.replaceAll("'", "\"");
            var z = JSON.parse(y);

            $('#selectdata').text("מצב עדכני: " + z.nameStatus + " לטסט מתאריך: " + z.date);
            //var tmp = '<option value="' + z.idtast + '" selected>' + z.namesta + '</option>';
            $("#sel1 option[value='" + z.idstatus + "']").remove();//מחיקת הסטטוס הקיים 
            $('#main_one').text(z.nameStatus);//הזנת הסטטוס הקיים לתחילת הרשימה
            $('#main_one').val(z.idstatus);//הזנת הסטטוס הקיים לתחילת הרשימה
            //$('#sel1').append(tmp);
            //$('#sel1').before(tmp);
            //$('#sel1').offset().top(tmp);
            $('#main_update').val("עדכן");
            $('#main_update').attr("CommandArgument", z.id);//ךא פועל עדין
            $('#main_update').attr("CommandName", z.id);//ךא פועל עדין
            $('#main_hi').attr('value', z.id);//הזררקה לכפתור נסתר
            $('#main_update').attr("data-value", z.id);





        })
    </script>
</asp:Content>
