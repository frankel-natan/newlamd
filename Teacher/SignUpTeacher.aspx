<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUpTeacher.aspx.cs" Inherits="LamedNetLite.SignUpTeacher" %>

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

        .help-tip {
            position: absolute;
            top: 18px;
            right: 18px;
            text-align: center;
            background-color: #BCDBEA;
            border-radius: 50%;
            width: 24px;
            height: 24px;
            font-size: 14px;
            line-height: 26px;
            cursor: default;
        }

            /*.help-tip:before {
                content: '?';
                font-weight: bold;
                color: #fff;
            }*/

            .help-tip:hover p {
                display: block;
                transform-origin: 100% 0%;
                -webkit-animation: fadeIn 0.3s ease-in-out;
                animation: fadeIn 0.3s ease-in-out;
            }

            .help-tip p {
                display: none;
                text-align: left;
                background-color: #1E2021;
                padding: 20px;
                width: 300px;
                position: absolute;
                border-radius: 3px;
                box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
                right: -4px;
                color: #FFF;
                font-size: 13px;
                line-height: 1.4;
            }

                .help-tip p:before {
                    position: absolute;
                    content: '';
                    width: 0;
                    height: 0;
                    border: 6px solid transparent;
                    border-bottom-color: #1E2021;
                    right: 10px;
                    top: -12px;
                }

                .help-tip p:after {
                    width: 100%;
                    height: 40px;
                    content: '';
                    position: absolute;
                    top: -40px;
                    left: 0;
                }

        /* @-webkit-keyframes fadeIn {
            0% {
                opacity: 0;
                transform: scale(0.6);
            }

            100% {
                opacity: 100%;
                transform: scale(1);
            }
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }

            100% {
                opacity: 100%;
            }
        }*/
    </style>


    <!-- Custom styles for this template -->
    <link href="../Bootstrap/css/signin.css" rel="stylesheet" />
    <script type="text/javascript" src="chrome-extension://aggiiclaiamajehmlfpkjmlbadmkledi/popup.js" async=""></script>
    <script type="text/javascript" src="chrome-extension://aggiiclaiamajehmlfpkjmlbadmkledi/tat_popup.js" async=""></script>
</head>
<body class="text-center" style="background-image: url('images/Lamed6.jpg'); background-repeat: no-repeat; background-position: bottom; height: 100%; width: 100%; background-size: cover;">

    <main runat="server" class="form-signin" style="background-color: aliceblue; border-radius: 25px; box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)">
        <form runat="server" method="post">
            <img class="mb-4" src="images/logo1.jpeg" alt="" width="72" height="57" />
            <h1 class="h3 mb-3 fw-normal" style="color: #000000">הרשמה</h1>
            <input runat="server" type="text" id="inputSid" class="form-control" placeholder="קוד בית ספר" required="" /><br />
            <input type="text" runat="server" id="inputName" class="form-control" placeholder="שם מלא" required="" /><br />
            <input runat="server" type="text" id="inputID" class="form-control" placeholder="ת.ז" required="" /><br />
            <input runat="server" type="tel" id="inputPhone" class="form-control" placeholder="טלפון" required="" /><br />
            <input list="AreasList" runat="server" id="seletdIt" class="form-control" placeholder="אזור לימוד" /><%-- placeholder="אזור לימוד"--%>
            <datalist id="AreasList" runat="server">
                <asp:Repeater ID="rptAreasList" runat="server">
                    <ItemTemplate>
                        <option>
                            <asp:Literal ID="option" runat="server"></asp:Literal></option>
                    </ItemTemplate>
                </asp:Repeater>


            </datalist>
            <br />
            <label for="inputEmail" class="visually-hidden">Email address</label>
            <input runat="server" type="email" id="inputEmail" class="form-control" placeholder="כתובת אימייל" required="" /><br />
            <label for="inputPassword" class="visually-hidden">Password</label>
            <input runat="server" type="password" id="inputPassword" class="form-control" placeholder="סיסמא" required="" /><br />


            <asp:Literal ID="ltrMessage" runat="server"></asp:Literal>
            <asp:Button runat="server" ID="BtnSignUp" OnClick="BtnSignUp_Click" CssClass="w-100 btn btn-lg btn-primary" Text="הרשם" />
            <p class="mt-5 mb-3 text-muted">© 2017-2021</p>

        </form>

    </main>





</body>
</html>

