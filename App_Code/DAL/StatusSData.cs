using LamedNetLite.BLL;
using LamedNetLite.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LamedNetLite
{
    namespace DAL
    {
        public class StatusSData
        {
            private static DataTable getDt(string sql)
            {
                SqlClass s = new SqlClass();
                DataTable dt = s.DataTable(sql);
                s.Conn.Close();
                return dt;
            }
            public static DataTable getAllData()
            {
                SqlClass s = new SqlClass();
                DataTable Dt = s.DataTable("Select * From Status");
                s.Conn.Close();
                return Dt;
            }

            public static List<StatusS> getListStatus()
            {
                SqlClass s = new SqlClass();
                string sql = "select id,[ StatusName] as name from Status";
                SqlDataReader dr = s.ExecuteReader(sql);
                
                List<StatusS> tamp = new List<StatusS>();
                while (dr.Read())
                {
                    int idt = int.Parse(dr["Id"].ToString());
                    string namet = dr["name"].ToString();
                    StatusS sttmp = new StatusS(idt,namet);
                    tamp.Add(sttmp);
                }
                s.Conn.Close();
                return tamp;
            }

        }


    }

    
}