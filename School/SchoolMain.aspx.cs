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
    public partial class SchoolMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillData();
        }
        protected void FillData()
        {
            DataTable Dt = new DataTable();//יצירת אובייקט טבלה
      
            School user = (School)Session["user"];
            user = SchoolData.getById(7);//זמני כל עוד אין סשן
            Dt= TeacherData.getAllData(user.schoolId);
            RptDataTable.DataSource = Dt;// הגדרת מקור הנתונים של הרפיטר
            RptDataTable.DataBind();// קשירת הנתונים של הרפיטר
           
        }
    }
}