using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LamedNetLite.Data;
using LamedNetLite.BLL;
using LamedNetLite.DAL;

namespace LamedNetLite
{
    public partial class SignUpTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FilDrD();
        }
        protected void FilDrD()
        {
            //SqlDataReader Dr = new SqlClass().ExecuteReader2("StudyAreas");
            //while (Dr.Read())
            //{
            //    AreasList.InnerHtml += "< option value =\"" + Dr["StudyAreaName"] + "\" id=\""+ Dr["StudyAreaId"] +"\" />";

            //}
            //AreasList.InnerHtml += "<option value =\"ירושלים\" id =\"1\" />"; 



        }

        protected void BtnSignUp_Click(object sender, EventArgs e)
        {
            if (StudentData.IsExist(inputEmail.Value))
            {
                ltrMessage.Text = "<span style='color:red'>* משתמש קיים במערכת*</span>";
            }
            else
            {
               // Teacher t = new Teacher(-1, int.Parse(inputSid.Value), inputName.Value, inputID.Value, inputPhone.Value, TeacherData.getStudyAreasId(seletdIt.Value), inputEmail.Value, inputPassword.Value, "",);
               // t.AddOrUpdate_Teather();
                Response.Redirect("TeacherMain.aspx");
            }
                
            
        }
    }
}