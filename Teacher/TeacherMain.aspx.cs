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
    public partial class TeacherMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //int TeacherId = ((Teacher)Session["user"]).TeacherId;
            //המורה לא ביצע עדיין תשלום לבית ספר
            if (TeacherData.GetTeachersPayments(1).Rows.Count == 0)
            {
                Response.Redirect("TeacherPay.aspx");
            }
        }
    }
}