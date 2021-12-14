<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUpStudent.aspx.cs" Inherits="LamedNetLite.SignUpStudent" %>

<!DOCTYPE html>

<html lang="en" dir="rtl" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors" />
    <meta name="generator" content="Hugo 0.79.0" />
    <title>Signin Template · Bootstrap v5.0</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/" />


    <script src="../JQ/jquery.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous" />
    <%--integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"--%>

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180" />
    <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png" />
    <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png" />
    <link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json" />
    <link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3" />
    <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico" />
    <meta name="theme-color" content="#7952b3" />


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        body {
            margin: 0;
            padding: 0;
            background-color: #17a2b8;
            height: 100vh;
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="../Bootstrap/css/signin.css" rel="stylesheet" />
    <link href="css/Style.css" rel="stylesheet" />
    <script type="text/javascript" src="chrome-extension://aggiiclaiamajehmlfpkjmlbadmkledi/popup.js" async=""></script>
    <script type="text/javascript" src="chrome-extension://aggiiclaiamajehmlfpkjmlbadmkledi/tat_popup.js" async=""></script>
</head>
<body class="text-center" style="background-image: url('images/Lamed6.jpg'); background-repeat: no-repeat; background-position: bottom; height: 100%; width: 100%; background-size: cover;">

    <main runat="server" class="form-signin" style="background-color: aliceblue; border-radius: 25px; box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)">
        <form runat="server" method="post" dir="rtl">
            <img class="mb-4" src="images/logo1.jpeg" alt="" width="72" height="57" />
            <h1 class="h3 mb-3 fw-normal" style="color: #000000">הרשמה</h1>
            <%--            <input runat="server" type="text" id="inputTid" class="form-control" placeholder="קוד מורה" required="" /><br />--%>
            <input type="text" runat="server" id="inputName" class="form-control" placeholder="שם מלא" required="" autofocus="" /><br />
            <input runat="server" type="text" id="inputID" class="form-control" placeholder="ת.ז" required="" /><br />
            <input runat="server" type="tel" id="inputPhone" class="form-control" placeholder="טלפון" required="" /><br />
            <%--            <label for="inputEmail" class="visually-hidden">Email address</label>--%>
            <input runat="server" type="email" id="inputEmail" class="form-control" placeholder="כתובת אימייל" required="" /><br />
            <%--            <label for="inputPassword" class="visually-hidden">Password</label>--%>
            <input runat="server" type="password" id="inputPassword" class="form-control" placeholder="סיסמא" required="" /><br />
            <input type="text" runat="server" id="inputGatheringPlace" class="form-control" placeholder="מקום איסוף" required="" autofocus="" /><br />
            <%--            <input type="text" runat="server" id="inputPrice" class="form-control" visible="false" placeholder="מחיר לשיעור" required="" autofocus="" /><br />--%>
            <h6>בחר סוג רישיון</h6>
            <asp:Repeater runat="server" ID="rptLicenseTypes" OnItemDataBound="rptLicenseTypes_ItemDataBound">
                <ItemTemplate>
                    <div class="form-check form-check-inline" runat="server" dir="rtl">
                        <input
                            runat="server"
                            class="form-check-input"
                            type="radio"
                            name="inlineRadioOptions"
                            id="rdio"
                            value="" />
                        <label class="form-check-label" for="inlineRadio1" runat="server" id="text">ידני</label>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <%--  <div class="form-check form-check-inline" runat="server" dir="rtl">
                <input
                    runat="server"
                    class="form-check-input"
                    type="radio"
                    name="inlineRadioOptions"
                    id="inlineRadio1"
                    value="option1" />
                <label class="form-check-label" for="inlineRadio1">ידני</label>
            </div>

            <div class="form-check form-check-inline" runat="server" dir="rtl">
                <input
                    runat="server"
                    class="form-check-input"
                    type="radio"
                    name="inlineRadioOptions"
                    id="inlineRadio2"
                    value="option2" />
                <label class="form-check-label" for="inlineRadio2">אוטומט</label>
            </div>--%>
            <input type="hidden" runat="server" id="LicenseType" /><br />
            <asp:Literal ID="ltrMessage" runat="server"></asp:Literal>
            <asp:Button runat="server" ID="BtnSignUp" OnClick="BtnSignUp_Click" CssClass="w-100 btn btn-lg btn-primary" Text="הרשם" />
            <p class="mt-5 mb-3 text-muted">© 2017-2021</p>
        </form>

    </main>





</body>
<script>
        $('input[type=radio]').each(function () {
            var array = $(this).attr('name').split('$');
            $(this).attr('name', array[array.length - 1]);
        });//מאפשר לבחור רק אפשרות אחת ברדיו באטן
        $('input[type=radio]').change(function () {
            $('#LicenseType').val($("input[type=radio]:checked").val());
        }); 
</script>
</html>
