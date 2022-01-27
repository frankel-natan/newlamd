using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LamedNetLite.BLL;
using LamedNetLite.DAL;


namespace LamedNetLite
{
    public partial class StudentsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["TeacherName"] = "רפי כהן";
            //Session["user"] = SchoolData.getById(7);//
            //Session["TeacherId"] = 1;//                  זמני - למחוק   
            Teacher te = new Teacher();
            te.getById(int.Parse(Session["TeacherIdst"].ToString()));
            if (Session["userc"] != null && Session["TeacherIdst"] != null)
            {
                FillData();
            }


        }
        protected void FillData()
        {
            DataTable Dt = new DataTable();//יצירת אובייקט טבלה
            string tamp = (string)Session["TeacherIdst"].ToString();
            int TeacherId = int.Parse(tamp);
            Dt = StudentData.getAllData(TeacherId);
            RptDataTable.DataSource = Dt;// הגדרת מקור הנתונים של הרפיטר
            RptDataTable.DataBind();// קשירת הנתונים של הרפיטר
            header.Text = (string)Session["TeacherName"];
        }
    }
}