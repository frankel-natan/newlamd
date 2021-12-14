﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="testinfo.aspx.cs" Inherits="LamedNetLite.testinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
    <link rel="stylesheet" href="css/test/bootstrap.min.css">
    <link rel="stylesheet" href="css/test/font-awesome.min.css">
    <link rel="stylesheet" href="css/test/templatemo-blue.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_header" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <header>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12">

                    <img style="height:max-content;max-width: 30%;" src="images/test/tm-easy-profile.jpg" class="img-responsive img-circle tm-border" alt="templatemo easy profile">
                    <hr>
                    <h1 class="tm-title bold shadow">Hi, I am Julia</h1>
                    <h1 class="white bold shadow">Creative Director</h1>
                </div>
            </div>
        </div>
    </header>
    <!-- about and skills section -->
    <section class="container">
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <div class="about">
                    <h3 class="accent">Easy Profile</h3>
                    <h2>Bootstrap v3.3.5</h2>
                    <p>This easy HTML profile is brought to you by templatemo website. There are 4 color themes, <a href="index-green.html">Green</a>, <a href="index.html">Blue</a>, <a href="index-gray.html">Gray</a>, and <a href="index-orange.html">Orange</a>. Sed vitae dui in neque elementum tempor eu id risus. Phasellus sed facilisis lacus, et venenatis augue.</p>
                </div>
            </div>
            <div class="col-md-6 col-sm-12">
                <div class="skills">
                    <h2 class="white">Skills</h2>
                    <strong>PHP MySQL</strong>
                    <span class="pull-right">70%</span>
                    <div class="progress">
                        <div class="progress-bar progress-bar-primary" role="progressbar"
                            aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%;">
                        </div>
                    </div>
                    <strong>UI/UX Design</strong>
                    <span class="pull-right">85%</span>
                    <div class="progress">
                        <div class="progress-bar progress-bar-primary" role="progressbar"
                            aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%;">
                        </div>
                    </div>
                    <strong>Bootstrap</strong>
                    <span class="pull-right">95%</span>
                    <div class="progress">
                        <div class="progress-bar progress-bar-primary" role="progressbar"
                            aria-valuenow="95" aria-valuemin="0" aria-valuemax="100" style="width: 95%;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- education and languages -->
    <section class="container">
        <div class="row">
            <div class="col-md-8 col-sm-12">
                <div class="education">
                    <h2 class="white">Education</h2>
                    <div class="education-content">
                        <h4 class="education-title accent">New Web Design</h4>
                        <div class="education-school">
                            <h5>School of Media</h5>
                            <span></span>
                            <h5>2030 January - 2034 December</h5>
                        </div>
                        <p class="education-description">In lacinia leo sed quam feugiat, ac efficitur dui tristique. Ut venenatis, odio quis cursus egestas, nulla sem volutpat diam, ac dapibus nisl ipsum ut ipsum. Nunc tincidunt libero non magna placerat elementum.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <div class="languages">
                    <h2>Languages</h2>
                    <ul>
                        <li>Myanmar / Thai</li>
                        <li>English / Spanish</li>
                        <li>Chinese / Japanese</li>
                        <li>Arabic / Hebrew</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- contact and experience -->
    <section class="container">
        <div class="row">
            <div class="col-md-4 col-sm-12">
                <div class="contact">
                    <h2>Contact</h2>
                    <p><i class="fa fa-map-marker"></i>123 Rama IX Road, Bangkok</p>
                    <p><i class="fa fa-phone"></i>010-020-0890</p>
                    <p><i class="fa fa-envelope"></i>easy@company.com</p>
                    <p><i class="fa fa-globe"></i>www.company.com</p>
                </div>
            </div>
            <div class="col-md-8 col-sm-12">
                <div class="experience">
                    <h2 class="white">Experiences</h2>
                    <div class="experience-content">
                        <h4 class="experience-title accent">Website Development</h4>
                        <h5>New Media Company</h5>
                        <span></span>
                        <h5>2035 January - 2036 April</h5>
                        <p class="education-description">Cras porta tincidunt sem, in sollicitudin lorem efficitur ut. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- footer section -->

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
