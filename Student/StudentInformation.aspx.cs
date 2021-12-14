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
    public partial class StudentInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillData();
            }
        }
        protected void FillData()
        {
            //Student user = (Student)Session["user"];
            //להפעיל על הסשן
            string[] data= StudentData.getStudentInformation(1, 1, 1, 130);
            if(data==null)//יש שגיאה בנתונים
            {
                
            }
            StudentName.InnerText ="שלמה";//מהסשן
            TeacherName.InnerText ="שם מורה:"+ data[0];
            SchoolName.InnerText ="בית ספר-"+ data[1];
            NumOfLessons.InnerText=data[2];
            AmountPaid.InnerText = data[3];
            debt.InnerText = data[4];
            LicenseType.InnerText = "סוג רישיון-"+data[5];
        }
    }
}