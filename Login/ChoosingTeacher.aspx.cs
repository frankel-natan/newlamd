
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LamedNetLite.DAL;
using System.Web.UI.HtmlControls;
using Newtonsoft.Json;
using LamedNetLite.BLL;

namespace LamedNetLite
{
    public partial class ChoosingTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Session["user"] == null)
            //    Response.Redirect("../Student/SignUpStudent.aspx");
            Session["user"] =  StudentData.getById(1);//רק לצורך בדיקה , למחוק
            if (!IsPostBack)
                FillData();

            //if (Request["name"]!=null)
            //{
            //    string s =(string) Request["name"];
            //    s = (string)Request["search"];
            //}
        }
        protected void FillData()
        {
            DataTable dt = StudentData.getTeachersData(((Student)Session["user"]).LicenseTypeID);
            rptTnames.DataSource = dt;
            rptTnames.DataBind();     //שולף 20 שורות מהטבלה
            rptTechersDetails.DataSource = dt.AsEnumerable().Take(20).CopyToDataTable();
            rptTechersDetails.DataBind();
            //DataView view = new DataView(dt);//    יצירת טבלה חדשה עם השדות הרצויים
            //DataTable table2 = view.ToTable(false, "TeacherName", "TeacherId");
            //string JSONresult;//     המרה למחרוזת בתבנית גייסון
            //JSONresult = JsonConvert.SerializeObject(table2);
            //ltrJs.Text = "<script>var TeachersDet=";
            //ltrJs.Text += JSONresult;
            //ltrJs.Text += ";</script>";

        }

        protected void rptTnames_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {//LicenseTypeID
            Literal ltrName = (Literal)e.Item.FindControl("liName");
            string Tname = (string)((DataRowView)e.Item.DataItem)["TeacherName"];
            string Sname = (string)((DataRowView)e.Item.DataItem)["SchoolName"];
            string Tphone = (string)((DataRowView)e.Item.DataItem)["Phone"];
            ltrName.Text = Tname+"-";
            ltrName.Text += Tphone+"-";
            ltrName.Text +=  "- בית ספר:" + Sname;
        }

        protected void rptTechersDetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //txtTid 
            HtmlInputHidden txtTid = (HtmlInputHidden)e.Item.FindControl("txtTid");
            Literal ltrTName = (Literal)e.Item.FindControl("ltrTname");
            Literal ltrSrName = (Literal)e.Item.FindControl("ltrSchoolName");
            Button btnSub = (Button)e.Item.FindControl("btnSubFromList");
            Literal ltrLicenseTypse = (Literal)e.Item.FindControl("ltrLicenseTypse");
            string Tname = (string)((DataRowView)e.Item.DataItem)["TeacherName"];
            string Sname = (string)((DataRowView)e.Item.DataItem)["SchoolName"];
            int Tid =(int)((DataRowView)e.Item.DataItem)["TeacherId"];
            string LicenseTypse = (string)((DataRowView)e.Item.DataItem)["LicenseType"];
            int LicenseTypseId = (int)((DataRowView)e.Item.DataItem)["LicenseTypeID"];
            ltrTName.Text = Tname;
            ltrSrName.Text = "בית ספר " + Sname;
            txtTid.Value = Tid.ToString();
            //btnSub.OnClientClick = "f("+Tid+")";
            btnSub.Attributes["name"] = Tid + "," + LicenseTypse + "," +LicenseTypseId ;
            ltrLicenseTypse.Text = LicenseTypse;
        }

        protected void btnSub_Click(object sender, EventArgs e)
        {
            string[] s = (SelectedTeacherId.Text).Split(',');
            Session["SelectedTeacherId"] = int.Parse(s[0]);
            Session["LicenseTypse"] = s[1];
            Session["LicenseTypseId"] = s[2];
            //Response.Redirect("~/Student/SignUpStudent.aspx");
            //להעביר לדף עם הודעה שיש להמתין עד לאישור המורה
        }

        protected void btnSubFromList_Click(object sender, EventArgs e)
        {
            Button btnSub = (Button)sender;
            string[] s = (btnSub.Attributes["name"]).Split(',');
            Session["SelectedTeacherId"] = int.Parse(s[0]);
            Session["LicenseTypse"] = s[1];
            Session["LicenseTypseId"] = s[2];
            //Response.Redirect("~/Student/SignUpStudent.aspx");
            //להעביר לדף עם הודעה שיש להמתין עד לאישור המורה
        }
    }
}