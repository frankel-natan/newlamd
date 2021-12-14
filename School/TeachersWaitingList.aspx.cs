using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using LamedNetLite.BLL;
using LamedNetLite.DAL;

namespace LamedNetLite
{
    public partial class TeachersWaitingList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                FillData();
        }
        private void FillData()
        {
            //School user = (School)Session["user"];
            School user = SchoolData.getById(7);
            RptList.DataSource = user.GetWaitingTeachers();
            RptList.DataBind();
        }

        protected void RptList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Literal itemTextLtr = (Literal)e.Item.FindControl("itemText");
            HtmlInputCheckBox checkboxLess = (HtmlInputCheckBox)e.Item.FindControl("checkboxTeacher");
            HtmlButton btnOk = (HtmlButton)e.Item.FindControl("btnOk");
            HtmlButton btnDelete = (HtmlButton)e.Item.FindControl("btnDelete");
            string TeacherName = (string)(((DataRowView)e.Item.DataItem)["StudentName"]);
            int lessid = (int)(((DataRowView)e.Item.DataItem)["DrivingLessonsId"]);
            string lessTypeName = (string)(((DataRowView)e.Item.DataItem)["TypeName"]);
        }
    }
}