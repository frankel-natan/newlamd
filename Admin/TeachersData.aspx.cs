using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LamedNetLite.DAL;
using System.Data;
namespace LamedNetLite
{
    public partial class TeachersData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillData();
        }
        protected void FillData()
        {
            DataTable dt = TeacherData.getAllData();
            RptData.DataSource = dt;
            RptData.DataBind();
        }
    }
}