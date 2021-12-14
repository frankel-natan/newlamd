using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using LamedNetLite.BLL;
using LamedNetLite.Data;

namespace LamedNetLite
{
    namespace DAL
    {
        public class AdminData
        {
            public static Admin validation(string UserName,string Password)
            {
                SqlClass s = new SqlClass();
                string sql = "select * from Admin where UserName='"+UserName+"' and Password='"+Password+"'";
                SqlDataReader Dr = s.ExecuteReader(sql);
                Admin A=null;
                if (Dr.Read())
                {
                    A= new Admin((int)Dr["AdminId"], (string)Dr["UserName"], (string)Dr["Password"], (int)Dr["PaymentsNum"], (int)Dr["LessonLen"]);
                }
                s.Conn.Close();
                return A;
            }

            public static int GetPriceForSchool()
            {
                SqlClass s = new SqlClass();
                object obg = s.ExecuteScalar("select top 1 PriceForSchool from Admin");
                s.Conn.Close();
                return Convert.ToInt32(obg);
            }
        }
    }
    
}