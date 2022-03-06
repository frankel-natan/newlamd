using System;
using LamedNetLite.BLL;
using LamedNetLite.DAL;
using LamedNetLite.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

namespace LamedNetLite
{
    public partial class TastBtTeatcerId : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["TeacherIdst"]!=null)
            {
                int a;
                if (int.TryParse(Session["TeacherIdst"].ToString(), out a))
                {
                    page();
                }              
            }
        }
        public void page()
        {
            int userT = (int) int.Parse(Session["TeacherIdst"].ToString());
            Teacher teacherTamp = new Teacher();
            teacherTamp = TeacherData.getById(userT);
            aa.Text = teacherTamp.TeacherName;
            DataTable dt = new DataTable();
            dt = TeacherData.GetAllTastByITeacher(userT);
            RptDataTable.DataSource = dt;// הגדרת מקור הנתונים של הרפיטר
            RptDataTable.DataBind();// קשירת הנתונים של הרפיטר
            var optiongen1 = new HtmlGenericControl("option") { ID ="one" };
            //optiongen1.InnerText = "nassion";
            //optiongen1.Attributes["Value"] = "500";
            optiongen1.Attributes.Add("class", "form - control");
            contentTeachers.Controls.Add(optiongen1);
            List <idName> listGeneric = new List<idName>(idName.getlistgenericStatusTast());
            listGeneric.ForEach((item) =>
            {
                var optiongen = new HtmlGenericControl("option") { InnerText = item.name.ToString() };
                optiongen.Attributes["Value"] = item.Id.ToString();
                optiongen.Attributes.Add("class", "form - control");
                contentTeachers.Controls.Add(optiongen);
            });
        }

        protected void RptDataTable_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            HtmlGenericControl da =(HtmlGenericControl)e.Item.FindControl("dateT");
            string db = (string)((DataRowView)e.Item.DataItem)["TestRequestDate"].ToString();
            string[] list = db.Split(' ');
            da.InnerText = list[0];
            da.Attributes["style"] = "color:green;";
            HtmlGenericControl da2 = (HtmlGenericControl)e.Item.FindControl("dateO");
            string db2 = (string)((DataRowView)e.Item.DataItem)["TestOrderDate"].ToString();
            string[] list2 = db2.Split(' ');
            da2.InnerText = list2[0] + " שעת הזמנה : " + list2[1] ;
            da2.Attributes["style"] = "color:blue;";
            HtmlButton upd = (HtmlButton)e.Item.FindControl("upTast");
            string idtast = (string)((DataRowView)e.Item.DataItem)["idTast"].ToString();
            string nameTast = (string)((DataRowView)e.Item.DataItem)["statusTast"].ToString();
            string nameStatus = (string)((DataRowView)e.Item.DataItem)["nameStatus"].ToString();
            upd.Attributes["value"] = idtast;
            upd.Attributes["data-value"] = "{'id':'" + idtast + "' ,'status':'" +nameTast + "' ,'namesta':'" + nameStatus + "' ,'date':'"+ list[0] + "'}";

        }

        protected void update_Click(object sender, EventArgs e)
        {
            Button b = (Button)(sender);
            int y = int.Parse(Request.Form["idSelectTae"]);//חילוץ קוד סטטוס נבחר
            //int x = int.Parse(b.Attributes["data-value"]);//ID טסט
            int x = int.Parse(hi.Value);//ID טסט חילוץ מכפתור נסתר
            StatusS.upLicenseStatus(x, y);
        }
    }
}