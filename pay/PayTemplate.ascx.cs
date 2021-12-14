using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using LamedNetLite.DAL;
using System.Data;

namespace LamedNetLite
{
    namespace pay
    {
        public partial class PayTemplate : System.Web.UI.UserControl
        {
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                    FillData();
            }
            protected void FillData()
            {
                Session["PaymentsNumber"] = 3;
                Session["sum"] = 50;
                if ((int)Session["PaymentsNumber"] == 1)
                    SelectedPaymentOptin.Value = "1";
                else
                {
                    PaymentOptins.Visible = true;
                    List<int> PaymentsNumbers = new List<int>();
                    for (int i = 2; i <= (int)Session["PaymentsNumber"]; i++)
                        PaymentsNumbers.Add(i);
                    rptPaymentOptins.DataSource = PaymentsNumbers;
                    rptPaymentOptins.DataBind();
                }
                //rptPaymentWays.DataSource = PaymenteData.getPaymentsWays();
                // rptPaymentWays.DataBind();
            }

            protected void rptPaymentWays_ItemDataBound(object sender, RepeaterItemEventArgs e)
            {
                string PaymentWayName = (string)((DataRowView)e.Item.DataItem)["PaymentWayName"];
                HtmlGenericControl lable = (HtmlGenericControl)e.Item.FindControl("text");
                lable.InnerText = PaymentWayName;
            }
        }

    }
}