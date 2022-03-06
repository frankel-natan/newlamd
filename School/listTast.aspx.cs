using LamedNetLite.BLL;
using LamedNetLite.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace LamedNetLite
{
    public partial class listTast : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page();
            }
        }
        public void Page()
        {
            School user = (School)Session["user"];
            user = SchoolData.getById(7);//זמנית
            //Session["user"] = user;//זמנית
            nameScool.Text = (string)user.SchoolName.ToString();
            DataTable dt = new DataTable();
            dt = School.getAllTastBySchoolId(user.schoolId);
            RptDataTable.DataSource = dt;// הגדרת מקור הנתונים של הרפיטר
            RptDataTable.DataBind();// קשירת הנתונים של הרפיטר

            List<idName> listGeneric = new List<idName>(idName.getlistgenericStatusTast());
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
            HtmlButton bt = (HtmlButton)e.Item.FindControl("upTast");
            int tamp = (int)((DataRowView)e.Item.DataItem)["itTast"];
            //bt.CommandArgument = tamp.ToString();
            string date = (string)((DataRowView)e.Item.DataItem)["dat"].ToString();
            string idst =(string)((DataRowView)e.Item.DataItem)["idStatus"].ToString();
            string nameStatus = (string)((DataRowView)e.Item.DataItem)["nameStatus"].ToString();
            string nanrTaecher = (string)((DataRowView)e.Item.DataItem)["nameTeacher"].ToString(); 
            bt.Attributes["data-id"] ="{'id':'"+ tamp.ToString() +"','date':'" + date + "','idstatus':'"+idst + "','nameSta" +
                "tus':'"+ nameStatus + "','nanrTaecher':'"+ nanrTaecher +"'}";
            




        }
        
        protected void update_Click(object sender, EventArgs e)
        {
            Button btn = (Button)(sender);
            string yourValue = btn.CommandArgument;
            int idTast = int.Parse(hi.Value);
            int newstatus = int.Parse(Request.Form["idSelectTae"]);
            //int va = int.Parse(b.CommandArgument);
            StatusS.upLicenseStatus(idTast, newstatus);
            Page();
        }

    }
}