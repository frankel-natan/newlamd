using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LamedNetLite
{
    public partial class aaaa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            int a = 15;
            LinkButton btn = (LinkButton)(sender);
            btn.PostBackUrl = "~/School/SchoolMain.aspx";
        }
    }
}