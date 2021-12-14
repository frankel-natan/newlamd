using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace LamedNetLite
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string ConnStr = ConfigurationManager.ConnectionStrings["Constr"].ConnectionString;
            //string Sql = "Select * From StudyAreas";
            //// יצירת אוביקט מסוג קונקשן שישמש כצינור גישה לבסיס הנתונים
            //SqlConnection Conn = new SqlConnection();
            //Conn.ConnectionString = ConnStr;
            //Conn.Open();// פתיחת החיבור לבסיס הנתונים
            //// הגדרת אוביקט מסוג פקודה שיזרים שאילתות דרך הצינור
            //SqlCommand Cmd = new SqlCommand();
            //Cmd.Connection = Conn;
            //Cmd.CommandText = Sql;
            //SqlDataReader Dr= Cmd.ExecuteReader();
            //while(Dr.Read())
            //{
            //    Response.Write("hjgh");
            //}
        }
    }
}