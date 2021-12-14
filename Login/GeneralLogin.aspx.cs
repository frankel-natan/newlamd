using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LamedNetLite.DAL;
using LamedNetLite.BLL;

namespace LamedNetLite
{
    public partial class GeneralLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                BtnSignUp.Visible = true;
        }

        protected void BtnSignUp_Click(object sender, EventArgs e)
        {
            if(LinksDiv.Visible)
            {
                LinksDiv.Visible = false;
                //HlsignUpSc.Visible = false;
                //HlsignUpSt.Visible = false;
                //HlsignUpTe.Visible = false;

            }
            else
            {
                LinksDiv.Visible = true;
                //HlsignUpSc.Visible = true;
                //HlsignUpSt.Visible = true;
                //HlsignUpTe.Visible = true;
                BtnSignUp.Visible = false;
            }
           
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {          
                School sch = SchoolData.validation(inputEmail.Value, inputPassword.Value);
                if (sch!=null)
                {
                    Session["user"] = sch;
                    Response.Redirect("~/School/SchoolMain.aspx");
                }
                else
                {
                    Teacher tea = TeacherData.validation(inputEmail.Value, inputPassword.Value);
                    if(tea!=null)
                    {
                        Session["user"]=tea;
                        Response.Redirect("~/Teacher/TeacherMain.aspx");
                    }
                    else
                    {
                        Student stu= StudentData.validation(inputEmail.Value, inputPassword.Value);
                        if(stu!=null)
                        {
                            Session["user"] = stu;
                            if(stu.StatuseId==1)
                                Response.Redirect("~/Student/WaitingPage.aspx");
                            else if(stu.StatuseId==2)
                                Response.Redirect("~/Student/StudentMain.aspx");
                        }
                        else
                        {
                            ltrMessage.Text = "<span style='color:red'>* שם המשתמש או הסיסמה שגויה אנא נסה שנית*</span>";
                        }
                    }
                    
                }
        }
        
    }
}