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
    public partial class StudentsWaitingList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillData();
            }
        }
        private void fillData()
        {
            //Teacher user = (Teacher)Session["user"];
            Teacher user = TeacherData.getById(1);
            RptList.DataSource= user.GetWaitingStudents();
            RptList.DataBind();

        }

        protected void RptList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Literal itemTextLtr = (Literal)e.Item.FindControl("itemText");
            HtmlInputCheckBox checkboxStudent = (HtmlInputCheckBox)e.Item.FindControl("checkboxStudent");
            HtmlButton btnOk = (HtmlButton)e.Item.FindControl("btnOk");
            HtmlButton btnDelete = (HtmlButton)e.Item.FindControl("btnDelete");
            string studName = (string)(((DataRowView)e.Item.DataItem)["StudentName"]);
            int StudentId = (int)(((DataRowView)e.Item.DataItem)["StudentId"]);
            //string lessTypeName = (string)(((DataRowView)e.Item.DataItem)["TypeName"]);
            string GatheringPlace = (string)(((DataRowView)e.Item.DataItem)["GatheringPlace"]);
            btnOk.Attributes["value"] = StudentId + "";
            btnDelete.Attributes["value"] = StudentId + "";
            checkboxStudent.Value = "" + StudentId;
            itemTextLtr.Text = studName +"   ";
            itemTextLtr.Text += GatheringPlace;

        }

        protected void btnOk_ServerClick(object sender, EventArgs e)
        {
            HtmlButton btn = (HtmlButton)sender;
            //btn.id
            string s = btn.Attributes["value"].ToString();

            TeacherData.ChangeStudentStatus(2, new[] { int.Parse(s) }.OfType<int>().ToList());//ממיר ממספר למערך וממערך לליסט
            fillData();
        }

        protected void btnDelete_ServerClick(object sender, EventArgs e)
        {
            HtmlButton btn = (HtmlButton)sender;
            string s = btn.Attributes["value"].ToString();
            TeacherData.DeleteStudentse(s.Split(',').Select(Int32.Parse).ToList());
            fillData();
        }

        protected void btnOkhi_ServerClick(object sender, EventArgs e)
        {
            //HtmlButton btn = (HtmlButton)sender;
            //string s = btn.Attributes["value"].ToString();
            //s = btnOkhi.Attributes["value"];
            string s = inputHi.Value;//3,3,4,4,5,5,6,7,8,8,9,9,10,10,11,11,12,13,13,14,14
            //ממיר למערך ואז ממיר למספרים ולליסט
            TeacherData.ChangeStudentStatus(2, s.Split(',').Select(Int32.Parse).ToList());
            fillData();
        }

        protected void Btndeletehi_ServerClick(object sender, EventArgs e)
        {
            HtmlButton btn = (HtmlButton)sender;
            //string s = btn.Attributes["value"].ToString();
            //s = btnOkhi.Attributes["value"];
            string s = inputHi.Value;//3,3,4,4,5,5,6,7,8,8,9,9,10,10,11,11,12,13,13,14,14
            //ממיר למערך ואז ממיר למספרים ולליסט
            TeacherData.DeleteStudentse(s.Split(',').Select(Int32.Parse).ToList());
            fillData();
        }
    }
}
