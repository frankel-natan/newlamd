using LamedNetLite.BLL;
using LamedNetLite.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LamedNetLite
{
    public partial class updetTaecher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                page();
            }
        }
        public void page()
        {
            School user = (School)Session["user"];
            //user = SchoolData.getById(7);//זמנית
            Session["user"] = user;//זמנית
            nameScool.Text = (string)user.SchoolName.ToString();
            Teacher userte = (Teacher)Session["userst"];
            Label2.Text = "  המורה "  + userte.TeacherName;


        }
    }
}