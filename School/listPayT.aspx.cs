using LamedNetLite.BLL;
using LamedNetLite.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;



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

            DataTable Dt2 = new DataTable();
            Dt2 = Paymente.gatAllPayTeaterByIdScool(7);// זמנית
            RptDataTableTe.DataSource = Dt2;// הגדרת מקור הנתונים של הרפיטר
            RptDataTableTe.DataBind();// קשירת הנתונים של הרפיטר
        }

        protected void RptDataTableTe_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string dateT = (string)((DataRowView)e.Item.DataItem)["datePay"].ToString();
            string nameT = (string)((DataRowView)e.Item.DataItem)["nameTe"].ToString();
            Label nt = (Label)e.Item.FindControl("dataP");
            string[] arr = dateT.Split(' ');
            nt.Text = arr[0];
            string fu = (string)((DataRowView)e.Item.DataItem)["idTeacher"].ToString();
            HtmlAnchor motelcoantstudent = (HtmlAnchor)e.Item.FindControl("opmod");
            motelcoantstudent.Attributes["data-value"] = "{'id':'"+ fu +"','name':'" + nameT + "'}";
           // motelcoantstudent.Attributes["onclick"] = "func("+ fu + ")";

        }

    }
}