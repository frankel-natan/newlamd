using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LamedNetLite.Data;
using System.Data.SqlClient;
using LamedNetLite.DAL;
using LamedNetLite.BLL;
using System.Data;

namespace LamedNetLite
{
    public partial class StudentMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["TeacherId"] = 1;//למחוק ולקחת מסשן
            if (!IsPostBack)
                FillData();
            
            //string js = "<script>var matLessTypes={";
            //foreach(DataRow dr in TypesDt.Rows)
            //{
            //    //משך זמן השיעור
            //    TimeSpan time = (TimeSpan)dr["DurationOfTheLesson"];
            //    //המרה למספר דקות
            //    int minut = (time.Hours * 60) + time.Minutes;
            //    js += "'"+(string)dr["TypeName"]+"':'"+minut +"',";
            //}
            //js = js.Remove((js.Length)-1,1);
            //js += "};</script>";
            //ltrsrc.Text = js;
        }
        protected void FillData()
        {
            //להפעיל על האובייקט שבסשן
            //Student user = (Student)Session["user"];
            DataTable TypesDt = StudentData.getLesstypes(1);
            rptLessTypes.DataSource = TypesDt;// הגדרת מקור הנתונים של הרפיטר
            rptLessTypes.DataBind();// קשירת הנתונים של הרפיטר
        }
        

        protected void btnSetLess_Click(object sender, EventArgs e)
        {
            string selectedLess = (string)Request["cars"];//"שיעור רגיל-40-08:00:00"
            SelectedDay sd=(SelectedDay)Session["less"];
            string[] selectedLessArr = selectedLess.Split('-');
            //int studId = ((Student)Session["user"]).StudentId;
            int studId = 1;//למחוק
            DrLessons Less = new DrLessons(selectedLess, sd, studId);
            Less.AddLesson();
        }



        //פונקצייה שמופעלת עבור כל איבר שנוצר ברפיטר
        protected void rptLessTypes_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //יצירת מציבע לרדיו באטן בסיבוב הנוכחי
            RadioButton Rb = (RadioButton)e.Item.FindControl("LessTypeRb");
            //גישה לשורה בטבלה שקיבל האיבר כמקור לנתונים, ושליפת הערך "משך זמן" למשתנה
            TimeSpan time = (TimeSpan)(((DataRowView)e.Item.DataItem)["DurationOfTheLesson"]);
            //המרה למספר הדקות
            int minut = (time.Hours * 60) + time.Minutes;
            string text = (((DataRowView)e.Item.DataItem)["TypeName"]).ToString() + "-" + minut;
            Rb.Text = text;
        }

       
    }
}