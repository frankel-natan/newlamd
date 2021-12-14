using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using LamedNetLite.DAL;
using System.Data;
using LamedNetLite.BLL;

namespace LamedNetLite.Login
{
    public partial class SearchTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["user"] == null)
            //    Response.Redirect("../Student/SignUpStudent.aspx");
            Session["user"] = StudentData.getById(1);//רק לצורך בדיקה , למחוק
            if (!IsPostBack)
                FillData();
           
            

        }
        private void FillData()
        {
            DataTable dt = StudentData.getTeachersData(((Student)Session["user"]).LicenseTypeID);
                //שולף 20 שורות מהטבלה
            rptTeachers.DataSource = dt.AsEnumerable().Take(20).CopyToDataTable();
            rptTeachers.DataBind();
        }
        

        protected void SelectedTeacher_ServerClick(object sender, EventArgs e)
        {
           //NoResultDiv.Visible = false;
            string s=SelectedTeacher.Value;
            DataTable dt=StudentData.getTeacherData(int.Parse(s));
            rptTeachers.DataSource = dt;
            rptTeachers.DataBind();
            if (dt.Rows.Count == 0)
                NoResultDiv.Visible = true;
        }

        protected void SetSelecedCity_ServerClick(object sender, EventArgs e)
        {
            //NoResultDiv.Visible = false;
            string s = SelectedCity.Value;
            DataTable dt=StudentData.getTeachersData
                (int.Parse(s), ((Student)Session["user"]).LicenseTypeID);
            rptTeachers.DataSource = dt;
            rptTeachers.DataBind();
            if (dt.Rows.Count == 0)
                NoResultDiv.Visible = true;
        }

        protected void rptTeachers_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            NoResultDiv.Visible = false;
            //HtmlInputHidden txtTid = (HtmlInputHidden)e.Item.FindControl("txtTid");
            Literal ltrTName = (Literal)e.Item.FindControl("ltrTname");
            Literal ltrSrName = (Literal)e.Item.FindControl("ltrSchoolName");
            Button btnSub = (Button)e.Item.FindControl("btnSub");
            Literal ltrLicenseTypse = (Literal)e.Item.FindControl("ltrLicenseTypse");
            string Tname = (string)((DataRowView)e.Item.DataItem)["TeacherName"];
            string Sname = (string)((DataRowView)e.Item.DataItem)["SchoolName"];
            int Tid = (int)((DataRowView)e.Item.DataItem)["TeacherId"];
            string LicenseTypse = (string)((DataRowView)e.Item.DataItem)["LicenseType"];
            int LicenseTypseId = (int)((DataRowView)e.Item.DataItem)["LicenseTypeID"];
            ltrTName.Text = Tname;
            ltrSrName.Text = "בית ספר " + Sname;
            txtTid.Value = Tid.ToString();
            //btnSub.OnClientClick = "f("+Tid+")";
            btnSub.Attributes["name"] = Tid.ToString() ;
            ltrLicenseTypse.Text = LicenseTypse;
        }

        protected void btnSub_Click(object sender, EventArgs e)
        {
            Button btnSub = (Button)sender;
            int Tid =int.Parse((btnSub.Attributes["name"]));
            Student user = (Student)Session["user"];
            user.TeacherId = Tid;
            user.AddOrUpdate_Student();
            Response.Redirect("../Student/WaitingPage.aspx");
        }
    }
}