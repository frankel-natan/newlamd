using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LamedNetLite.DAL;
using System.Data;
using System.Web.UI.HtmlControls;

namespace LamedNetLite
{
    public partial class LessWaitingList : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillData();
            }
        }
         private void fillData()
        {
            // int Tid = ((Teacher)Session["user"]).TeacherId;
            int Tid = 1;
            DataTable dt = DrLessonsData.getWaitingLessons(Tid);
            RptList.DataSource = dt;
            RptList.DataBind();
        }

        protected void RptList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Literal itemTextLtr = (Literal)e.Item.FindControl("itemText");
            HtmlInputCheckBox checkboxLess = (HtmlInputCheckBox)e.Item.FindControl("checkboxLess");
            //Literal titleLtr = (Literal)e.Item.FindControl("title");
            //Literal BodyLtr = (Literal)e.Item.FindControl("body");
            //Literal lesidLtr = (Literal)e.Item.FindControl("lesid");
            HtmlButton btnOk = (HtmlButton)e.Item.FindControl("btnOk");
            HtmlButton btnDelete = (HtmlButton)e.Item.FindControl("btnDelete");
            //HtmlGenericControl div = (HtmlGenericControl)e.Item.FindControl("divItem");
            string studName =(string)(((DataRowView)e.Item.DataItem)["StudentName"]);
            int lessid = (int)(((DataRowView)e.Item.DataItem)["DrivingLessonsId"]);
            string lessTypeName = (string)(((DataRowView)e.Item.DataItem)["TypeName"]);
            int lessLen = (int)(((DataRowView)e.Item.DataItem)["lesslen"]);
            DateTime lessDate = (DateTime)(((DataRowView)e.Item.DataItem)["DateLesson"]);
            TimeSpan Btime = (TimeSpan)(((DataRowView)e.Item.DataItem)["BeginningTime"]);
           // titleLtr.Text = studName + " - " + lessTypeName;
            btnOk.Attributes["value"] = lessid + "";
            btnDelete.Attributes["value"] = lessid + "";
            checkboxLess.Value = ""+lessid;
            // div.ID += "_" + lessid;
            string[] dataArr = lessDate.ToShortDateString().Split('/');
            string date = dataArr[1] + "/" + dataArr[0] + "/" + dataArr[2];
            //BodyLtr.Text = "תאריך:" + date + "<br /><br />משך השיעור:" + lessLen + " דקות" + "<br /><br />";
            //BodyLtr.Text += "תחילת שיעור:" + Btime.ToString() + "<br />";
            //lesidLtr.Text = "קוד שיעור:" + lessid.ToString();
            itemTextLtr.Text = studName + " - " + lessTypeName;
            itemTextLtr.Text += " תאריך:" + date+ " משך השיעור:" + lessLen + " דקות";
            itemTextLtr.Text += " תחילת שיעור:" + Btime.ToString();

        }

        protected void btnOk_ServerClick(object sender, EventArgs e)
        {
            HtmlButton btn = (HtmlButton)sender;
            //btn.id
            string s= btn.Attributes["value"].ToString();

            DrLessonsData.changeLessStatus(2,new[]{int.Parse(s)}.OfType<int>().ToList());//ממיר ממספר למערך וממערך לליסט
            fillData();
        }

        protected void btnDelete_ServerClick(object sender, EventArgs e)
        {
            HtmlButton btn = (HtmlButton)sender;
            string s = btn.Attributes["value"].ToString();
            DrLessonsData.Delete(s.Split(',').Select(Int32.Parse).ToList());
            fillData();
        }

        protected void btnOkhi_ServerClick(object sender, EventArgs e)
        {
            HtmlButton btn = (HtmlButton)sender;
            string s = btn.Attributes["value"].ToString();
            s=btnOkhi.Attributes["value"];
            s=inputHi.Value;//3,3,4,4,5,5,6,7,8,8,9,9,10,10,11,11,12,13,13,14,14
            //ממיר למערך ואז ממיר למספרים ולליסט
            DrLessonsData.changeLessStatus(2, s.Split(',').Select(Int32.Parse).ToList());
            fillData();
        }

        protected void Btndeletehi_ServerClick(object sender, EventArgs e)
        {
            HtmlButton btn = (HtmlButton)sender;
            string s = btn.Attributes["value"].ToString();
            s = btnOkhi.Attributes["value"];
            s = inputHi.Value;//3,3,4,4,5,5,6,7,8,8,9,9,10,10,11,11,12,13,13,14,14
            //ממיר למערך ואז ממיר למספרים ולליסט
            DrLessonsData.Delete(s.Split(',').Select(Int32.Parse).ToList());
            fillData();
        }
    }
}
