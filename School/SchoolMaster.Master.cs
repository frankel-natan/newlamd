using LamedNetLite.BLL;
using LamedNetLite.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


namespace LamedNetLite
{
    public partial class SchoolMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            School user = (School)Session["user"];//זמנית
            user = SchoolData.getById(1);//זמנית
            Session["user"] = user;//זמנית
            if (!IsPostBack)
            {
                if(Session["user"]==null)
                    Response.Redirect("../Login/GeneralLogin.aspx");
                else
                    PagerM();
            }
        }
        public void PagerM()
        {
            appdete.HRef = "SchoolUpdateDetails.aspx";
            appdete.Attributes["value"] = "500";//אפשר למחוק 
        }

        protected void exit_Click(object sender, EventArgs e)
        {        
            Session.RemoveAll();
            Response.Redirect("../Login/GeneralLogin.aspx");
        }

        
    }
}