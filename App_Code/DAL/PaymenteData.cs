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
                string sql = "select * from PaymentTypes";
                DataTable dt= s.DataTable(sql);
                s.Conn.Close();
                return dt;
            }
            public static DataTable gatAllPayTeaterByIdScool(int ScoolId)
            {
                SqlClass s = new SqlClass();
                string sql = "select Payments.PayerId, Payments.PaymentDate as datePay,Payments.[Sum],Teachers.TeacherName as nameTe , Teachers.TeacherId as idTeacher " +
                    "from Payments  inner join Students on Payments.PayerId = Students.StudentId " +
                    "inner join Teachers on Teachers.TeacherId = Students.TeacherId where Teachers.schoolId = 7";
                DataTable dt = s.DataTable(sql);
                s.Conn.Close();
                return dt;
            }
        }
    }
   
}