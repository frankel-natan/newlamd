<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="LamedNetLite.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="Bootstrap/js/bootstrap.min.js"></script>
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
    <%--<form id="form1" runat="server">
        <div>
            <asp:Literal ID="ltr1" runat="server"></asp:Literal>
            <asp:Repeater ID="Rpt" runat="server" OnItemDataBound="Rpt_ItemDataBound">
               <HeaderTemplate>
                   <h1>רשימת לקוחות</h1>
               </HeaderTemplate>
               <ItemTemplate>
                   <table>
                       <tr>
                           <td><%#Eval("UserId")%></td>
                           <td><%#Eval("UserFname")%></td>
                           <td><%#Eval("UserLname")%></td>
                           <td><%#Eval("UserEmail")%></td>
                           <td><asp:Button runat="server" ID="Btn" OnClick="Btn_Click" CommandArgument="<%#Eval("UserId") %>" /></td>
                       </tr>
                   </table>
               </ItemTemplate>
           </asp:Repeater>
           <asp:Literal ID="litr" runat="server"></asp:Literal>‏

        </div>
    </form>--%>

    <div class="container mt-5 mb-5">
        <div class="d-flex justify-content-center row">
            <div class="col-md-8">
                <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                    <div class="mr-1">
                        <img class="rounded" src="https://i.imgur.com/XiFJkhI.jpg" width="70"></div>
                    <div class="d-flex flex-column align-items-center product-details">
                        <span class="font-weight-bold">Basic T-shirt</span>
                        <div class="d-flex flex-row product-desc">
                            <div class="size mr-1"><span class="text-grey">Size:</span><span class="font-weight-bold">&nbsp;M</span></div>
                            <div class="color"><span class="text-grey">Color:</span><span class="font-weight-bold">&nbsp;Grey</span></div>
                        </div>
                    </div>
                    <div class="d-flex flex-row align-items-center qty">
                        <i class="fa fa-minus text-danger"></i>
                        <h5 class="text-grey mt-1 mr-1 ml-1">2</h5>
                        <i class="fa fa-plus text-success"></i>
                    </div>
                    <div>
                        <h5 class="text-grey">$20.00</h5>
                    </div>
                    <div class="d-flex align-items-center"><i class="fa fa-trash mb-1 text-danger"></i></div>
                </div>
                </div>
        </div>
    </div>
</body>
</html>
