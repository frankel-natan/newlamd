using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LamedNetLite
{
    public partial class StudentMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void exit_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("../Login/GeneralLogin.aspx");
        }
    }
}