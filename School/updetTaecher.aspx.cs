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
using Newtonsoft.Json;

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
            string datt = userte.DateAdded;
            string dat = datt.Substring(0, datt.IndexOf(" "));
            addTeather.Value = dat;
            addTeather.Attributes.Add("readonly", "readonly");
            statusTeacher.Value = (userte.StatusId.ToString()=="1" ? "פעיל" :"לא פעיל");
            see.Attributes["Value"]= userte.StatusId.ToString();
            see.InnerText = (userte.StatusId.ToString() == "1" ? "פעיל" : "לא פעיל");
            hid.Attributes["Value"] = (userte.StatusId.ToString() == "1" ? "0" : "1");
            //hid.Attributes["Taxt"] = (userte.StatusId.ToString() == "1" ? "לא פעיל" : "פעיל");
            hid.InnerText = (userte.StatusId.ToString() == "1" ? "לא פעיל" : "פעיל");
            int typeint = (int)int.Parse(userte.LicenseTypesId.ToString());
            string[] arrtype = new string[2];
            arrtype[0] =typeint.ToString();
            arrtype[1] = TeacherData.getTypeLic(typeint);
            typeLics.InnerText = arrtype[1];
            typeLics.Attributes["Value"] = arrtype[0];
            string[] arr = TeacherData.getAllLicAndId();
            int flag = 0;
            for(int i = 0;i<arr.Length;i++)
            {
                if (arrtype[0] != arr[i] && flag == 0)
                {
                    typeLicn.Attributes["Value"] = arr[i];
                    i++;
                    typeLicn.InnerText = arr[i];
                    flag = 1;
                    continue;
                }
                else if (arrtype[0] != arr[i] && flag == 1)
                {
                    typeLicn2.Attributes["Value"] = arr[i];
                    i++;
                    typeLicn2.InnerText = arr[i];
                    flag++;
                }
                else
                    i++;
            }

            string areId = userte.StudyAreaId;
            string[] arrareId = areId.Split(',');
            string[] arrareName = new string[arrareId.Length];
            string tampArr = "";
            for (int i = 0; i<arrareId.Length;i++)
            {
                arrareName[i] = TeacherData.nameAreId(int.Parse(arrareId[i]));
                tampArr += arrareName[i] + ", " ;
            }
            areName.Value = tampArr.Substring(0, tampArr.Length - 2);
            areName.Attributes["data-value"] = areId;
            areName.Attributes.Add("readonly", "readonly");
            DataTable Dt = new DataTable();
            Dt = TeacherData.getAllCity();
            repeaterCity.DataSource = Dt;// הגדרת מקור הנתונים של הרפיטר
            repeaterCity.DataBind();// קשירת הנתונים של הרפיטר
            


        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Teacher userte = (Teacher)Session["userst"];
            userte.TeacherName = inputName.Value;
            userte.UserName = inputEmail.Value;
            userte.Phone = inputPhone.Value;
            userte.Password = inputPassword.Value;
            userte.AddOrUpdate_Teather();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "yesmess()", true);

        }

        protected void repeaterType_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            
        }
    }
}