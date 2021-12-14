using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LamedNetLite.BLL;
using LamedNetLite.DAL;
using LamedNetLite.Data;

namespace LamedNetLite
{
    public partial class SignUpSchool : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void BtnSignUp_Click(object sender, EventArgs e)
        {
            if( SchoolData.IsExist(inputEmail.Value))
            {
                ltrMessage.Text = "<span style='color:red'>* משתמש קיים במערכת*</span>";
            }
            else
            {
                School s = new School(-1, inputName.Value, inputPassword.Value, inputEmail.Value, inputPhone.Value, "",-1);
                s.AddOrUpdate_School();
                s.schoolId=s.getMaxId();
                Session["user"] = s;
                Response.Redirect("SchoolMain.aspx");
            }
            
        }
    }
}