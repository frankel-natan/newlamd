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
    public partial class receivingPaymentPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            { Paged(); }

        }
        public void Paged()
        {
            List<idName> listGeneric = new List<idName>(idName.getlistgenericScools());
            listGeneric.ForEach((item) =>
            {
                var optiongen = new HtmlGenericControl("option") { InnerText = item.name.ToString() };
                optiongen.Attributes["Value"] = item.Id.ToString();
                optiongen.Attributes.Add("class", "form - control");
                contentTeachers.Controls.Add(optiongen);
            });
            
        }

        protected void Update_ServerClick(object sender, EventArgs e)
        {
            int pays = int.Parse(payy.Value);
            int ids = int.Parse(Request.Form["idSelectTae"]);
            Paymente.receivingPaymentScoolToAdmin(ids, pays);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "yesmess()", true);
            Paged();
        }
    }
}