<%@ Page Title="" Language="C#" MasterPageFile="~/School/SchoolMaster.Master" AutoEventWireup="true" CodeBehind="listPayT.aspx.cs" Inherits="LamedNetLite.listPayT"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_header" runat="server">
    פירוט תשלומי מורים
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    רשימת מורים
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>שם מורה</th>
                                    <th>תאריך תשלום</th>
                                    <th>סכום</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="RptDataTableTe" OnItemDataBound="RptDataTableTe_ItemDataBound" runat="server">
                                    <ItemTemplate>
                                        <tr class="odd gradeX">                                        
                                            <td><a id="opmod" runat="server" class="a" onclick="func(this)"> <%#Eval("nameTe") %></a></td>
                                            <td><asp:Label ID="dataP" runat="server"></asp:Label></td>
                                            <td><%#Eval("Sum") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>

                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    
    <button id="df" type="button" class="btn btn-info btn-lg hidden" data-toggle="modal" data-target="#myModal">Open Small Modal</button>
       <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="Header"></h4>
        </div>
        <div class="modal-body">
          <p>מקום לתוכן המודל</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">סגור</button>
            <input id="listStu" type="button" value="לרשימת התלמידים" onserverclick="listStu_ServerClick"  data-value="בדיקה" class="btn btn-primary" data-dismiss="modal" runat="server" />
            <input type="hidden" runat="server" id="hi" />
            <asp:Button class="btn btn-success" runat="server" ID="paybuuten" OnClick="paybuuten_Click" Text="תשלום"></asp:Button>
<%--            <asp:Button ID="Button1" UseSubmitBehavior="false" OnClick="listStu_ServerClick" data-value="בדיקה" CssClass="btn btn-primary" data-dismiss="modal" runat="server" Text="רשימת התלמידים2"/>--%>

        </div>
      </div>
    </div>
  </div>
           
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
</asp:Content>

    

<asp:Content ID="Content6" ContentPlaceHolderID="scripts" runat="server">
    <script>
        function func(index) {
            //alert(this.text);
            //$('#df').attr('data-target',myModal5);
            //$('#listStu').attr('value', index);
            //alert($(this).html());
            //console.log($(this).attr("data-value"));
            console.log(index.getAttribute("data-value"));
            var tam = (index.getAttribute("data-value"));
            var tam3 = tam.replaceAll("'", "\"");
            console.log(tam3);
            //var obj2 = jQuery.parseJSON(tam3);
            var tam2 = JSON.parse(tam3);
            console.log(tam3);
            $('#Header').text(tam2.name);
            //$('#main_listStu').attr('value', tam2.id);
            $('#main_listStu').attr('data-value', tam2.id);
            $('#main_Button1').attr('data-value', tam2.id);
            $('#main_hi').attr('value', tam2.id);//לכפתור המוסתר

            $('#main_paybuuten').attr('data-value', tam2.id);

            $('#df').click();

            
            //$('#main_Button1').attr('value', tam2.id);
            //console.log($(this));
            //$('#Header').text(this.attr("data-value"));

        }
        //אופציה דרך קלאס
        //$(".a").click(function () {
        //    console.log($(this).attr("data-value"));
        //    $('#listStu').attr('value');
        //    $('#Header').text($(this).attr("data-value"));
        //    $('#df').click();
        //})

        $('#listStu').click(function () {         
            $(this).val()
        })
        $('#paybuuten').click(function () {
            $(this).val()
        })
        

    </script>
</asp:Content>
