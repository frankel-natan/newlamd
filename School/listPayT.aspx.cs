using LamedNetLite.BLL;
using LamedNetLite.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LamedNetLite
{
    public partial class listPayT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                page();
            }
            
        }
        public void page()
        {
            DataTable Dt = new DataTable();
            School user = (School)Session["user"];
            user = SchoolData.getById(7);//זמנית
            Dt = TeacherData.getAllData(user.schoolId);

        }
    }
}