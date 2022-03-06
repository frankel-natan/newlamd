using LamedNetLite.BLL;
using LamedNetLite.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace LamedNetLite
{
    public partial class nananaMas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                page();
            }
        }
        public void page()
        {
            DataTable Dt = new DataTable();
            School user = (School)Session["user"];
            user = SchoolData.getById(7);//זמנית
            Dt = TeacherData.getAllData(user.schoolId);
            RptDataTable.DataSource = Dt;// הגדרת מקור הנתונים של הרפיטר
            RptDataTable.DataBind();// קשירת הנתונים של הרפיטר
            //Modals.DataSource = Dt;
            //Modals.DataBind();           
        }

        protected void RptDataTable_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataTable dt = new DataTable();
            int tamp = (int)((DataRowView)e.Item.DataItem)["TeacherId"];
            dt = TeacherData.GetStudentByTaecher(tamp);
            int sum = dt.Rows.Count;
            Label a = (Label)e.Item.FindControl("countstudnt");
            a.Text = sum.ToString();
            LinkButton ab = (LinkButton)e.Item.FindControl("linkcunt");
            ab.Attributes["data-value"] = (string)tamp.ToString();
            string tampname = (string)((DataRowView)e.Item.DataItem)["TeacherName"].ToString();
            ab.Attributes["data-name"] =tampname;
            DataTable dttast = new DataTable();
            dttast = TeacherData.GetAllTestByTaecherAndStatus1(tamp);
            int counttast = dttast.Rows.Count;
            LinkButton b = (LinkButton)e.Item.FindControl("linkTast");
            b.Text = counttast.ToString();
            b.Attributes["data-value"] = (string)tamp.ToString();
            int sumCostTast = TeacherData.GetCostByIdTaecher(tamp);
            int sumToTelPay = TeacherData.GetPayByIdTaecher(2, tamp);
            LinkButton c = (LinkButton)e.Item.FindControl("PayTast");
            c.Attributes["data-value"] = (string)tamp.ToString();
            c.CommandArgument = (string)tamp.ToString();
            int balance = sumToTelPay - sumCostTast;
            if (balance < 0)
            {
                balance = balance * -1;
                string str = balance.ToString();
                c.Attributes["style"] = "color:red;";
                str += "- ";
                c.Text = str;
            }
            else
            {
                c.Text = balance.ToString();
            }
            //HtmlAnchor aaa = (HtmlAnchor)e.Item.FindControl("nsion");
            LinkButton aaa = (LinkButton)e.Item.FindControl("nsion");
            aaa.Attributes["Text"] = sum.ToString();
            aaa.Attributes["Name"] = tamp.ToString();
            aaa.Text = (string)((DataRowView)e.Item.DataItem)["Phone"].ToString();//sum.ToString();
            aaa.ID = "@" + tamp.ToString() + "@";
            //aaa.PostBackUrl = "~/WebForm4.aspx";
            //aaa.ResolveUrl = "~/WebForm4.aspx";
            string idstring = aaa.ID.ToString();
            string[] startSe = idstring.Split('@');
            int idtechertoschool = int.Parse(startSe[1]);
            aaa.CommandArgument = idtechertoschool.ToString();
            LinkButton bbb = (LinkButton)e.Item.FindControl("nsio2");
            //bbb.PostBackUrl= "~/WebForm4.aspx";
            bbb.Text = sum.ToString();
            bbb.CommandArgument = idtechertoschool.ToString();
            HtmlButton limodel = (HtmlButton)e.Item.FindControl("openModelTeacher");
            int i = e.Item.ItemIndex;
            limodel.Attributes["data-target"] = "#main_RptDataTable_exampleModal_" + i.ToString();
            limodel.Attributes["id"] = "" + i;
            //limodel.Attributes["onclick"] = "func('#main_RptDataTable_myModal_" + i + "')";
            //limodel.Attributes["data-target"] = "#myModal" + i.ToString();   
            //HtmlGenericControl motelcoantstudent = (HtmlGenericControl)e.Item.FindControl("opmod");
            HtmlAnchor motelcoantstudent = (HtmlAnchor)e.Item.FindControl("opmod");
            motelcoantstudent.Attributes["onclick"] = "func('#main_RptDataTable_openModelTeacher_" + i + "')";
            string tampadddat = (string)((DataRowView)e.Item.DataItem)["DateAdded"].ToString();
            int inde = tampadddat.IndexOf(" ");
            string adddat = tampadddat.Substring(0, inde);
            HtmlGenericControl dateadd = (HtmlGenericControl)e.Item.FindControl("adddata");
            dateadd.InnerText = adddat;
            Button liststudents = (Button)e.Item.FindControl("listtehtserandstudent");
            liststudents.Attributes["data-value"] = (string)tamp.ToString();         
            liststudents.Attributes["data-name"] = tampname;
            Button upte = (Button)e.Item.FindControl("updata");
            upte.Attributes["data-value"] = (string)tamp.ToString();
            upte.Attributes["data-name"] = tampname;
            Button payIdTeacher = (Button)e.Item.FindControl("paybuuten");
            payIdTeacher.Attributes["data-value"] = (string)tamp.ToString();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Write("dffffffffff");
        }

        protected void aaaaaaaaa_Click(object sender, EventArgs e)
        {

        }

        protected void nsion_ServerClick(object sender, EventArgs e)
        {
            Response.Write("dffffffffff");
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            Console.WriteLine("djjjjjjjjjjjjjjjjjjjjjjjjjjd");
        }

        protected void nsion_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string yourValue = btn.CommandArgument;
            btn.PostBackUrl = "~/WebForm4.aspx";
            Session["idteacherToSchool"] = yourValue;
        }

        protected void nsio2_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string yourValue = btn.CommandArgument;
            Session["idteacherToSchool"] = int.Parse(yourValue);
            btn.PostBackUrl = "~/WebForm4.aspx";
            
        }

        protected void listtehtserandstudent_Click(object sender, EventArgs e)
        {
            Button bt = (Button)(sender);
            Session["TeacherIdst"] = ((Button)sender).Attributes["data-value"];
            Session["userc"] = ((Button)sender).Attributes["data-name"];
            //bt.PostBackUrl = "~/School/StudentsList.aspx";
            Response.Redirect("~/School/StudentsList.aspx");
        }

        protected void linkcunt_Click(object sender, EventArgs e)
        {
            LinkButton bt = (LinkButton)(sender);
            Session["TeacherIdst"] = ((LinkButton)sender).Attributes["data-value"];
            Session["userc"] = ((LinkButton)sender).Attributes["data-name"];
            bt.PostBackUrl = "~/School/StudentsList.aspx";
            Response.Redirect("~/School/StudentsList.aspx");
        }

        protected void linkTast_Click(object sender, EventArgs e)
        {
            LinkButton tastbyidteacer = (LinkButton)(sender);
            Session["TeacherIdst"] = ((LinkButton)sender).Attributes["data-value"];
            Response.Redirect("~/School/TastBtTeatcerId.aspx");
        }

        protected void updata_Click(object sender, EventArgs e)
        {
            Button bt = (Button)(sender);
            int tampTid;
            tampTid = int.Parse(bt.Attributes["data-value"]);
            Teacher tampT = new Teacher();
            tampT = SchoolData.GetTeache(tampTid);
            Session["TeacherIdst"] = ((Button)sender).Attributes["data-value"];
            Session["userc"] = tampT;
            Session["userst"] = tampT;//חדש
            Response.Redirect("~/School/updetTaecher.aspx");
        }

        protected void paybuuten_Click(object sender, EventArgs e)
        {
            Button bt = (Button)(sender);
            Session["TeacherIdst"] = ((Button)sender).Attributes["data-value"];
            Session["userc"] = ((Button)sender).Attributes["data-name"];
            Response.Redirect("~/School/receivingPaymentPage.aspx");

        }

        protected void PayTast_Click(object sender, EventArgs e)
        {
            LinkButton bt = (LinkButton)(sender);
            int tampTid;
            tampTid = int.Parse(bt.Attributes["data-value"]);
            Teacher tampT = new Teacher();
            tampT = SchoolData.GetTeache(tampTid);
            Session["TeacherIdst"] = ((LinkButton)sender).Attributes["data-value"];
            Session["userc"] = tampT;
            int teacherSelect = int .Parse(bt.CommandArgument);
            Session["userst"] = teacherSelect;//חדש
            Response.Redirect("~/School/listPayT.aspx");
        }
    }
}