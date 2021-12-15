using LamedNetLite.BLL;
using LamedNetLite.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LamedNetLite
{
    public partial class updetTaecher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                page();
            }
        }
        public void page()
        {
            School user = (School)Session["user"];
            //user = SchoolData.getById(7);//זמנית
            Session["user"] = user;//זמנית
            nameScool.Text = (string)user.SchoolName.ToString();
            Teacher userte = (Teacher)Session["userst"];
            Label2.Text = "  המורה "  + userte.TeacherName;

            inputName.Value = userte.TeacherName;
            inputEmail.Value = userte.UserName;
            inputPhone.Value = userte.Phone;
            inputPassword.Value = userte.Password;
            inputPassword.Attributes["type"] = "password";
            //Session["user"] = user;
            inputIdTe.Value = userte.ID;
            inputIdTe.Attributes.Add("readonly", "readonly");
            addTeather.Value = userte.DateAdded;
            addTeather.Attributes.Add("readonly", "readonly");
            statusTeacher.Value = (userte.StatusId.ToString()=="1" ? "פעיל" :"לא פעיל");
            see.Attributes["Value"]= userte.StatusId.ToString();
            see.InnerText = (userte.StatusId.ToString() == "1" ? "פעיל" : "לא פעיל");
            hid.Attributes["Value"] = (userte.StatusId.ToString() == "1" ? "0" : "1");
            //hid.Attributes["Taxt"] = (userte.StatusId.ToString() == "1" ? "לא פעיל" : "פעיל");
            hid.InnerText = (userte.StatusId.ToString() == "1" ? "לא פעיל" : "פעיל");

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Teacher userte = (Teacher)Session["userst"];
            userte.TeacherName = inputName.Value;
            userte.UserName = inputEmail.Value;
            userte.Phone = inputPhone.Value;
            userte.Password = inputPassword.Value;
            userte.AddOrUpdate_Teather();
        }
    }
}