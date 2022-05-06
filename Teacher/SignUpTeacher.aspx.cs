using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using LamedNetLite.Data;
using LamedNetLite.BLL;
using LamedNetLite.DAL;
using System.Data;

namespace LamedNetLite
{
    public partial class SignUpTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                FilData();
        }
        protected void FilData()
        {
            //SqlDataReader Dr = new SqlClass().ExecuteReader2("StudyAreas");
            //while (Dr.Read())
            //{
            //    AreasList.InnerHtml += "< option value =\"" + Dr["StudyAreaName"] + "\" id=\""+ Dr["StudyAreaId"] +"\" />";

            //}
            //AreasList.InnerHtml += "<option value =\"ירושלים\" id =\"1\" />"; 
            LicenseTypes.DataSource = TeacherData.GetLicenseTypes();
            LicenseTypes.DataBind();
            StudyAreas.DataSource= TeacherData.GetStudyAreas();
            StudyAreas.DataBind();
        }

        protected void BtnSignUp_Click(object sender, EventArgs e)
        {
            if (StudentData.IsExist(inputEmail.Value))
            {
                ltrMessage.Text = "<span style='color:red'>* משתמש קיים במערכת*</span>";
            }
            else
            {
                string selectedSA = selectedStudyAreas.Value;
                string selectedLT = selectedLicenseTypes.Value;
                Teacher t = new Teacher(
                    inputName.Value,
                    inputID.Value,
                    inputPhone.Value,
                    selectedSA,
                    inputEmail.Value,
                    inputPassword.Value,
                    int.Parse(selectedLT)
                    );
                Session["user"] = t;
                // t.AddOrUpdate_Teather();
                Response.Redirect("SearchSchool.aspx");
            }
                
            
        }

        protected void LicenseTypes_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            HtmlGenericControl option = (HtmlGenericControl)e.Item.FindControl("option");
            int LicenseTypeID = (int)((DataRowView)e.Item.DataItem)["LicenseTypeID"]; 
            string LicenseType = (string)((DataRowView)e.Item.DataItem)["LicenseType"]; 
            option.Attributes["text"] = LicenseTypeID.ToString();
            option.Attributes["value"] = LicenseTypeID.ToString();
            option.InnerText = LicenseType;
        }

        protected void StudyAreas_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            HtmlGenericControl option = (HtmlGenericControl)e.Item.FindControl("option");
            int StudyAreaId = (int)((DataRowView)e.Item.DataItem)["StudyAreaId"];
            string StudyAreaName = (string)((DataRowView)e.Item.DataItem)["StudyAreaName"];
            option.Attributes["text"] = StudyAreaId.ToString();
            option.Attributes["value"] = StudyAreaId.ToString();
            option.InnerText = StudyAreaName;
        }
    }
}