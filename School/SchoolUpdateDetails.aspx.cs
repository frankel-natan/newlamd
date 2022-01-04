using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using LamedNetLite.BLL;
using LamedNetLite.DAL;

namespace LamedNetLite
{
    public partial class SchoolUpdateDetails : System.Web.UI.Page
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
            Session["user"] = SchoolData.getById(1);//למחוק
            School user = (School)Session["user"];
            inputName.Value = user.SchoolName;
            inputEmail.Value = user.AdministratorUserName;
            inputPhone.Value = user.Phone;
            inputPassword.Value = user.Password;
            inputPassword.Attributes["type"] = "password";
            var statusSchool = user.Status;
            var pay = user.MonthlyPayment;
            var addSchool = user.DateAdded;

            List<LicenseTypes> listGeneric = new List<LicenseTypes>(LicenseTypesData.getlistgeneric());
            for (var i = 0; i < listGeneric.Count; i++)
            {
                if (listGeneric[i].LicenseTypeID.ToString() == typeint.ToString())
                    listGeneric.RemoveAt(i);
            }

            listGeneric.ForEach((item) =>
            {
                var optiongen = new HtmlGenericControl("option") { InnerText = item.LicenseType.ToString() };
                optiongen.Attributes["Value"] = item.LicenseTypeID.ToString();
                optiongen.Attributes.Add("class", "form - control");
                contentArea.Controls.Add(optiongen);
            });

            Session["user"] = user;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            School user = (School)Session["user"];
            user.SchoolName = inputName.Value;
            user.AdministratorUserName = inputEmail.Value;
            user.Phone = inputPhone.Value;
            user.Password = inputPassword.Value;
            user.AddOrUpdate_School();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "yesmess()", true);
        }
    }
}