<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchSchool.aspx.cs" Inherits="LamedNetLite.SearchSchool" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../JQ/jquery.min.js"></script>
    <link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />

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
        #myVideo {
            position: fixed;
            right: 0;
            bottom: 0;
            min-width: 100%;
            min-height: 100%;
        }

        @media (min-aspect-ratio: 16/9) {
            #videoBG {
                width: 100%;
                height: auto;
            }
        }

        @media (max-aspect-ratio: 16/9) {
            #videoBG {
                width: auto;
                height: 100%;
            }
        }

        @media (max-width: 767px) {
            #videoBG {
                display: none;
            }
        }

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
    <div class="jumbotron bg-cover text-white">
        <div class="container py-5 text-center">
            <h1 style="color: orange" class="display-4 font-weight-bold">חיפוש בית ספר</h1>
            <p style="color: black" class="font-italic mb-0"></p>

        </div>
    </div>
    <form id="form1" runat="server">
        <div>
            <div class="container mt-5 mb-5">
                <div <%--class="container mt-5 mb-5"--%> style="direction: rtl">
<%--                    <input type="hidden" runat="server" id="txtTid" />--%>
                    <div class="d-flex justify-content-center row">
                        <div class="col-md-8">
                            <div class="row">
                                <div class="container col-md-8">
                                    <input id="SchoolSearch" type="text" class="form-control" style="width: 100%" placeholder="הזן שם בית ספר" />
                                    <select name="SchoolSelect" runat="server" id="SchoolSelect" style="margin-top: 5px;" class="form-select" size="3" aria-label="size 3 select example">
                                    </select>
                                    <input type="hidden" runat="server" id="SelectedSchool" />

                                    <button onserverclick="SetSelectedSchool_ServerClick" type="button" runat="server" hidden="hidden" id="SetSelectedSchool"></button>

                                </div>
                                
                            </div>
                            <asp:Repeater runat="server" ID="rptSchools" OnItemDataBound="rptSchools_ItemDataBound" >
                                <ItemTemplate>
                                    <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded container">
                                        <div class="mr-1">
                                            <img class="rounded" src="https://i.imgur.com/XiFJkhI.jpg" width="70">
                                        </div>
                                        <div class="d-flex flex-column align-items-center product-details">
                                            <span class="font-weight-bold">
                                                <asp:Literal runat="server" ID="ltrSchoolName" /></span>
                                            <div class="d-flex flex-row product-desc">
                                                <div class="size mr-1"><span class="text-grey"></span><span class="font-weight-bold">&nbsp;</span></div>
                                                <div class="color"><span class="text-grey"></span><span class="font-weight-bold">&nbsp;</span></div>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-row align-items-center qty">
                                            <i class="fa fa-minus text-danger"></i>
                                            <h5 class="text-grey mt-1 mr-1 ml-1">
                                                <asp:Literal runat="server"  /></h5>
                                            <i class="fa fa-plus text-success"></i>
                                        </div>
                                        <div>
                                            <h5 class="text-grey">
                                                
                                                <asp:Literal runat="server" ID="Call" /></h5>
                                        </div>
                                        <div class="d-flex align-items-center ">
                                            <i class="fa fa-trash mb-1 text-danger">
                                                <asp:Button OnClick="btnSub_Click"  CssClass="btn btn-outline-primary" runat="server" ID="btnSub" Text="שלח בקשה להרשמה" /></i>
                                        </div>
                                    </div>
                                 
                                </ItemTemplate>
                            </asp:Repeater>
                            <div runat="server" id="NoResultDiv" class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                                <div class="mx-auto" style="width: 200px;">
                                    <span>לא נמצאו מורים </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
    <script src="js/SearchScript.js"></script>
</html>
