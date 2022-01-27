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
                School userc = (School)Session["user"];//זמני
                userc = SchoolData.getById(7);//זמני
                Session["userc"] = userc;//זמני
                if (Session["userc"] != null) { page(); } else { Response.Redirect("~/Login/GeneralLogin.aspx"); }//אם אים סשן שליחה להתחברות
            }
            
        }
        public void page()
        {          
            DataTable Dt = new DataTable();
            School userc = (School)Session["userc"];
            userc = SchoolData.getById(7);//זמנית
            Dt = TeacherData.getAllData(userc.schoolId);

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

        protected void listStu_ServerClick(object sender, EventArgs e)
        {
            //HtmlButton bt1 = (HtmlButton)(sender);//נסיון לעבוד עם הכפתור לבד
            HtmlInputButton bt = (HtmlInputButton)(sender);
            string ids = bt.Attributes["value"];
            string ids2 = bt.Attributes["data-value"];           

            string idHid = hi.Value;

            Session["TeacherIdst"] = idHid;
            Response.Redirect("~/School/StudentsList.aspx");

        }

        protected void Button1_Click(object sender, EventArgs e)//אפשר למחוקנסיון לעבוד עם ערך כפתור
        {
            HtmlButton bt = (HtmlButton)(sender);

            string ids = bt.Attributes["value"];
            string aa = bt.Attributes["data-value"];
            string aaa = hi.Value;
            
        }

      
    }
}