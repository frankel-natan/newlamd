using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using LamedNetLite.Data;
using System.Data.SqlClient;
using LamedNetLite.BLL;
using Newtonsoft.Json;

namespace LamedNetLite
{
    namespace DAL
    {
        public class LicenseTypesData
        {
            private static DataTable getDt(string sql)
            {
                SqlClass s = new SqlClass();
                DataTable dt = s.DataTable(sql);
                s.Conn.Close();
                return dt;
            }
            public static List<LicenseTypes> getlistgeneric()
            {
                string sql = "select LicenseTypeID as id , LicenseType as type from LicenseTypes";
                SqlClass s = new SqlClass();
                SqlDataReader Dr = s.ExecuteReader(sql);
                List<LicenseTypes> tmp = new List<LicenseTypes>();
                while (Dr.Read())
                {
                    LicenseTypes tmpl = new LicenseTypes((int)Dr["id"], (string)Dr["type"]);
                    tmp.Add(tmpl);
                }
                s.Conn.Close();
                return tmp;
            }
        }

    }

}