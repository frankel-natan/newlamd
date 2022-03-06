using LamedNetLite.BLL;
using LamedNetLite.DAL;
using LamedNetLite.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LamedNetLite
{
    namespace DAL
    {
        public class idNameData
        {
            public static List<idName> getlistgenericTeacher(int scoolId)
            {
                string sql = "select TeacherId as id , TeacherName as Tname from Teachers where schoolId = " + scoolId + " order by Tname asc";
                SqlClass s = new SqlClass();
                SqlDataReader Dr = s.ExecuteReader(sql);
                List<idName> tmp = new List<idName>();
                while (Dr.Read())
                {
                    idName tmpl = new idName((int)Dr["id"], (string)Dr["Tname"].ToString());
                    tmp.Add(tmpl);
                }
                s.Conn.Close();
                return tmp;
            }
            public static List<idName> getlistgenericScools()
            {
                string sql = "select schoolId as id , SchoolName as Sname from schools order by Sname asc";
                SqlClass s = new SqlClass();
                SqlDataReader Dr = s.ExecuteReader(sql);
                List<idName> tmp = new List<idName>();
                while (Dr.Read())
                {
                    idName tmpl = new idName((int)Dr["id"], (string)Dr["Sname"].ToString());
                    tmp.Add(tmpl);
                }
                s.Conn.Close();
                return tmp;
            }
            public static List<idName> getlistgenericStatusTast()
            {
                string sql = "select id as id , nameStatus as Sname from TastStatus";
                SqlClass s = new SqlClass();
                SqlDataReader Dr = s.ExecuteReader(sql);
                List<idName> tmp = new List<idName>();
                while (Dr.Read())
                {
                    idName tmpl = new idName((int)Dr["id"], (string)Dr["Sname"].ToString());
                    tmp.Add(tmpl);
                }
                s.Conn.Close();
                return tmp;
            }

        }
    }
    
}