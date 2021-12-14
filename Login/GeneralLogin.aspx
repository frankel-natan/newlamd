<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GeneralLogin.aspx.cs" Inherits="LamedNetLite.GeneralLogin" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
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
    <link rel="stylesheet" href="css/Style.css" />
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
    <script type="text/javascript" src="chrome-extension://aggiiclaiamajehmlfpkjmlbadmkledi/popup.js" async=""></script>
    <script type="text/javascript" src="chrome-extension://aggiiclaiamajehmlfpkjmlbadmkledi/tat_popup.js" async=""></script>
</head>
<body class="text-center" style="background-image: url('images/Lamed6.jpg'); background-repeat: no-repeat; background-position: bottom; height: 100%; width: 100%; background-size: cover;">

    <main runat="server" class="form-signin" style="background-color: aliceblue; border-radius: 25px; box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)">
        <form runat="server" method="post">
            <%-- בלי שיש את התגית הזאת בדף הפנל לא יעבוד --%>
            <asp:ScriptManager ID="Scrman" runat="server" />
            <img class="mb-4" src="images/logo1.jpeg" alt="" width="72" height="57" />
            <h1 class="h3 mb-3 fw-normal" style="color: #000000">התחברות</h1>
            <label for="inputEmail" class="visually-hidden">Email address</label>
            <input runat="server" type="email" id="inputEmail" class="form-control" placeholder="כתובת אימייל" required="" autofocus="" />
            <label for="inputPassword" class="visually-hidden">Password</label>
            <input runat="server" type="password" id="inputPassword" class="form-control" placeholder="סיסמא" required="" />
            <asp:Literal ID="ltrMessage" runat="server"></asp:Literal>
            <%--<div class="checkbox mb-3">
                <label>
                                        <input runat="server" type="checkbox" value="remember-me" /> זכור אותי
                </label>
            </div>--%>
            <asp:Button ID="BtnLogin" OnClick="BtnLogin_Click" runat="server" CssClass="w-100 btn btn-lg btn-primary" Text="התחבר" /><br />

            <asp:UpdatePanel ID="Updpmain" runat="server" >
                <ContentTemplate>
                    <asp:Button UseSubmitBehavior="false" CssClass="btn btn-outline-secondary" runat="server" ID="BtnSignUp" OnClick="BtnSignUp_Click" Text="לחץ כאן להרשמה" /><br />

                    <br />
                    <div runat="server" id="LinksDiv" visible="false">


                        <asp:HyperLink NavigateUrl="~/School/SignUpSchool.aspx" CssClass="btn btn-link" runat="server" ID="HlsignUpSc">הרשמה לבית ספר</asp:HyperLink><br />
                        <asp:HyperLink NavigateUrl="~/Teacher/SignUpTeacher.aspx" CssClass="btn btn-link" runat="server" ID="HlsignUpTe">הרשמה למורה</asp:HyperLink><br />
                        <asp:HyperLink NavigateUrl="~/Student/SignUpStudent.aspx" CssClass="btn btn-link" runat="server" ID="HlsignUpSt">הרשמה לתלמיד</asp:HyperLink><br />
                        <p class="mt-5 mb-3 text-muted">© 2017-2021</p>
                    </div>
                </ContentTemplate>

            </asp:UpdatePanel>

        </form>

    </main>





</body>
</html>
