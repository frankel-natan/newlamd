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
    public partial class SignUpStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["SelectedTeacherId"] == null)
            //    Response.Redirect("../Login/ChoosingTeacher.aspx");
            if (!IsPostBack)
                FillData();
        }
        protected void FillData()
        {
            //string LicenseTypse = (string)Session["LicenseTypse"];
            //string LicenseTypseId = (string)Session["LicenseTypseId"];
            //if ((LicenseTypse.Split('/')).Length>1)
            //{
            //    rptLicenseTypes.DataSource = StudentData.getLicenseTypes();
            //    rptLicenseTypes.DataBind();
            //}
            rptLicenseTypes.DataSource = StudentData.getLicenseTypes();
            rptLicenseTypes.DataBind();

        }

        protected void BtnSignUp_Click(object sender, EventArgs e)
        {
            if (StudentData.IsExist(inputEmail.Value))
            {
                ltrMessage.Text = "<span style='color:red'>* משתמש קיים במערכת*</span>";
            }
            else
            {
                string s1=LicenseType.Value;
                Student s = new Student(-1, -1, inputName.Value, inputID.Value, inputPhone.Value, 
                    inputEmail.Value, inputPassword.Value,int.Parse((LicenseType.Value)), 
                    inputGatheringPlace.Value, /*float.Parse(inputPrice.Value)*/0, "");
                Session["user"] = s;
                //s.AddOrUpdate_Student();
                Response.Redirect("../Login/SearchTeacher.aspx");
            }
                
        }

        protected void rptLicenseTypes_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string type = (string)((DataRowView)e.Item.DataItem)["LicenseType"];
            int id = (int)((DataRowView)e.Item.DataItem)["LicenseTypeID"];
            HtmlGenericControl lable = (HtmlGenericControl)e.Item.FindControl("text");
            HtmlInputRadioButton rdio = (HtmlInputRadioButton)e.Item.FindControl("rdio");
            //rdio.Attributes["name"] = id.ToString();
            lable.InnerText = type;
            //lable.Attributes["for"] = id.ToString();
            rdio.Value = id.ToString();
        }
    }
}