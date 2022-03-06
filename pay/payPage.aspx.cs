using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LamedNetLite
{
    public partial class payPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            biz.pelecard.ws101.TrxWs lamedPay = new biz.pelecard.ws101.TrxWs();
            //string a = lamedPay.AuthrizeCreditType("aaaa", "555", "0962210", "458066331111111", "1212", "", "150000", "1", "1", "888","kdddd","jjjjj");
        }
    }
}