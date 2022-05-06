using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LamedNetLite.BLL;
using LamedNetLite.DAL;

namespace LamedNetLite
{
    public partial class SearchSchool : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
                Response.Redirect("SignUpTeacher.aspx");
            if(!IsPostBack)
            {
                FillData();
            }

        }
        private void FillData()
        {
            DataTable dt = TeacherData.GetSchools();
            //שולף 20 שורות מהטבלה
            rptSchools.DataSource = dt.AsEnumerable().Take(20).CopyToDataTable();
            rptSchools.DataBind();
        }

        protected void SetSelectedSchool_ServerClick(object sender, EventArgs e)
        {
            string s = SelectedSchool.Value;
            DataTable dt = TeacherData.GetSchools(int.Parse(s));
            rptSchools.DataSource = dt;
            rptSchools.DataBind();
            if (dt.Rows.Count == 0)
                NoResultDiv.Visible = true;
        }

        protected void rptSchools_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            NoResultDiv.Visible = false;
            //HtmlInputHidden txtTid = (HtmlInputHidden)e.Item.FindControl("txtTid");
            Literal ltrSchoolName = (Literal)e.Item.FindControl("ltrSchoolName");
            //Literal ltrSrName = (Literal)e.Item.FindControl("ltrSchoolName");
            Button btnSub = (Button)e.Item.FindControl("btnSub");
            Literal Call = (Literal)e.Item.FindControl("Call");
            //string Tname = (string)((DataRowView)e.Item.DataItem)["TeacherName"];
            string Sname = (string)((DataRowView)e.Item.DataItem)["SchoolName"];
            string Phone = (string)((DataRowView)e.Item.DataItem)["Phone"];
            int SchoolId = (int)((DataRowView)e.Item.DataItem)["schoolId"];
            //int LicenseTypseId = (int)((DataRowView)e.Item.DataItem)["LicenseTypeID"];
            //ltrTName.Text = Tname;
            ltrSchoolName.Text = "בית ספר " + Sname;
            btnSub.Attributes["name"] = SchoolId.ToString();
            Call.Text = "<a href=\"tel: "+Phone+ "\"><img src=\"../icons/call.png\"></img></a>";
        }

        protected void btnSub_Click(object sender, EventArgs e)
        {
            Button btnSub = (Button)sender;
            string SchoolId=(string) btnSub.Attributes["name"];
            Teacher user = (Teacher)Session["user"];
            user.schoolId = int.Parse(SchoolId);
            user.AddOrUpdate_Teather();
            Session["user"] = user;

        }
    }
}