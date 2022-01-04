using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using LamedNetLite.Data;
using System.Data.SqlClient;
using LamedNetLite.BLL;

namespace LamedNetLite
{
    namespace DAL
    {
        public class SchoolData
        {
            private static DataTable getDt(string sql)
            {
                SqlClass s = new SqlClass();
                DataTable dt = s.DataTable(sql);
                s.Conn.Close();
                return dt;
            }
            public static DataTable GetWaitingTeachers(int SchoolId)
            {
                string sql = "select * from Teachers inner join LicenseTypes " +
                    "on Teachers.LicenseTypesId=LicenseTypes.LicenseTypeID where " +
                    "schoolId="+SchoolId+" and StatuseId=1";
                return getDt(sql);
            }
            public static void DeleteTeachers(List<int> TeachersIdList)
            {
                foreach (int i in TeachersIdList)
                {
                    Teacher t = TeacherData.getById(i);
                    t.Delete();
                }
            }

            public static void ChangeTeachersStatus(int StatuseId, List<int> TeachersIdList)
            {
                SqlClass s = new SqlClass();
                string sql = "";
                int count = 0;
                foreach (int i in TeachersIdList)
                {
                    sql += "update Teachers set StatuseId=" + StatuseId + " " +
                        "where TeacherId=" + i;
                    count++;
                    if (count == 50)
                    {
                        s.ExecuteNonQuery(sql);
                        count = 0;
                        sql = "";
                    }
                }
                if (count > 0)
                    s.ExecuteNonQuery(sql);
                s.Conn.Close();
            }

            public static void AddOrUpdate_School(int schoolId, string SchoolName, string Password, string AdministratorUserName, string Phone, string DateAdded,int PaymentsNum, float MonthlyPayment, int Status)
            {

                SqlClass s = new SqlClass();
                if (schoolId == -1)
                    s.ExecuteNonQuery("Insert into [schools] (SchoolName,Password,AdministratorUserName,Phone,DateAdded,PaymentsNum)values(N'" + SchoolName + "','" + Password + "','" + AdministratorUserName + "','" + Phone + "',"  + "GETDATE(),3)" + MonthlyPayment +" , " + Status);//מספר תשלומים מוגדר 3 ב"מ
                else
                    s.ExecuteNonQuery("update [schools] set " +  "SchoolName=N'" + SchoolName  + "', Password='" + Password + "', AdministratorUserName='" + AdministratorUserName + "', Phone='" + Phone + "', DateAdded='" + DateAdded + "',PaymentsNum="+ PaymentsNum + MonthlyPayment + " , " + Status + " where schoolId=" + schoolId);
                s.Conn.Close();
            }
            public static DataTable getAllData()
            {
                SqlClass s = new SqlClass();
                DataTable Dt = s.DataTable("Select * From SchoolS");
                s.Conn.Close();
                return Dt;
            }
            public static DataTable getAllData(int id)
            {
                SqlClass s = new SqlClass();
                DataTable Dt = s.DataTable("Select * From schools where schoolId=" + id);
                s.Conn.Close();
                return Dt;
            }
            public static School getById(int id)
            {
                SqlClass s = new SqlClass();
                SqlDataReader Dr = s.ExecuteReader("Select * From schools where schoolId=" + id);
                Dr.Read();
                School tmp = new School((int)Dr["schoolId"], (string)Dr["SchoolName"], (string)Dr["Password"], (string)Dr["AdministratorUserName"], (string)Dr["Phone"], "" + Dr["DateAdded"], (int)Dr["PaymentsNum"], (float)Dr["MonthlyPayment"],(int)Dr["Status"]);
                s.Conn.Close();
                return tmp; 
            }
            public static void Delete(int schoolId)
            {
                SqlClass s = new SqlClass();
                s.ExecuteNonQuery("DELETE FROM [schools] WHERE schoolId=" + schoolId);
                s.Conn.Close();
            }
            //מחזירה - אמת! במידה וכבר קיים 
            public static bool IsExist(string AdministratorUserName)
            {
                SqlClass s = new SqlClass();
                SqlDataReader Dr = s.ExecuteReader("Select * From schools where AdministratorUserName='" + AdministratorUserName + "'");
                bool tmp = Dr.Read();
                s.Conn.Close();
                return tmp;
            }
            public static School validation(string Email, string Password)
            {
                //select* from schools where AdministratorUserName = 'momoyelin46@gmail.com' and Password = 'd123'
                string sql = "select* from schools where AdministratorUserName ='" + Email + "' and Password='"+Password+"'";
                SqlClass s = new SqlClass();
                SqlDataReader Dr = s.ExecuteReader(sql);
                if (Dr.Read())
                {
                    School tmp = new School((int)Dr["schoolId"], (string)Dr["SchoolName"], (string)Dr["Password"], (string)Dr["AdministratorUserName"], (string)Dr["Phone"],((DateTime)Dr["DateAdded"]).ToString(),(int)Dr["PaymentsNum"],(float)Dr["MonthlyPayment"], (int)Dr["Status"]);
                    s.Conn.Close();
                    return tmp;
                }               
                s.Conn.Close();
                return null;
            }
            public static int getMaxId()
            {
                string sql = "select MAX(schoolid) from schools";
                SqlClass s = new SqlClass();
               return (int)s.ExecuteScalar(sql);
            }
            public static Teacher GetTeache(int x)
            {
                SqlClass s = new SqlClass();
                string sql = "select * from Teachers where TeacherId = " + x;              
                SqlDataReader Dr = s.ExecuteReader(sql);    //TeacherData.getById(id);
                Teacher tmp = null;
                while (Dr.Read())
                {
                    tmp = new Teacher((int)Dr["TeacherId"], (int)Dr["schoolId"], (string)Dr["TeacherName"], (string)Dr["ID"], (string)Dr["Phone"], (string)Dr["StudyAreaId"], (string)Dr["UserName"], (string)Dr["Password"], "" + Dr["DateAdded"], (int)Dr["LicenseTypesId"], (int)Dr["PaymentsNum"], (int)Dr["StatuseId"]);
                }
                s.Conn.Close();
                return tmp;
            }
        }
        
    }
    
}