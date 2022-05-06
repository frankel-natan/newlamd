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
    public partial class TeacherUpdateDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillData();
            }
        }
        protected void fillData()
        {
            Session["user"] = TeacherData.getById(1);//למחוק
            Teacher user = (Teacher)Session["user"];
            inputName.Value = user.TeacherName ;
            inputEmail.Value = user.UserName;
            inputID.Value = user.ID;
            inputPhone.Value = user.Phone;
            selectedLicenseTypes.Value = user.LicenseTypesId.ToString();
            selectedStudyAreas.Value = user.StudyAreaId;
            inputPassword.Value = user.Password;
            inputPassword.Attributes["type"] = "password";
            Session["user"] = user;

            LicenseTypes.DataSource = TeacherData.GetLicenseTypes();
            LicenseTypes.DataBind();
            StudyAreas.DataSource = TeacherData.GetStudyAreas();
            StudyAreas.DataBind();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Teacher user = (Teacher)Session["user"];
            user.TeacherName = inputName.Value;
            user.UserName = inputEmail.Value;
            user.ID = inputID.Value;
            user.Phone = inputPhone.Value;
            user.Password = inputPassword.Value;
            user.LicenseTypesId=int.Parse(selectedLicenseTypes.Value);
            user.StudyAreaId=selectedStudyAreas.Value;
            user.AddOrUpdate_Teather();
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