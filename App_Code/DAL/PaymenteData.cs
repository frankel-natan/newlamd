using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using LamedNetLite.Data;

namespace LamedNetLite
{
    namespace DAL
    {
        public class PaymenteData
        {
            public static DataTable getPaymentsWays()
            {
                SqlClass s = new SqlClass();
                string sql = "select * from PaymentWays";
                DataTable dt= s.DataTable(sql);
                s.Conn.Close();
                return dt;
            }
        }
    }
   
}