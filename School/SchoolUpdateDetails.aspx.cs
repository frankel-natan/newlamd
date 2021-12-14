using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
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
        }
    }
}