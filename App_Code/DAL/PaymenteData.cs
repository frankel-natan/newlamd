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
                    "from Payments  inner join Teachers on Payments.PayerId = Teachers.TeacherId " +
                    " where Teachers.schoolId = "+ScoolId;
                DataTable dt = s.DataTable(sql);
                s.Conn.Close();
                return dt;
            }
            public static DataTable gatAllPayTeaterByIdScoolAndIdTaecher(int idScool, int idTeacher)
            {
                SqlClass s = new SqlClass();
                string sql = "select Payments.PayerId, Payments.PaymentDate as datePay,Payments.[Sum],Teachers.TeacherName as nameTe , Teachers.TeacherId as idTeacher " +
                    "from Payments  inner join Teachers on Payments.PayerId = Teachers.TeacherId " +
                    " where Teachers.schoolId = " + idScool + " and Teachers.TeacherId = " + idTeacher;                              
                DataTable dt = s.DataTable(sql);
                s.Conn.Close();
                return dt;
            }
            public static DataTable gatAllPayScoolIdByAdmin(int ScoolId)
            {
                SqlClass s = new SqlClass();
                string sql = "select Payments.PayerId, Payments.PaymentDate as datePay,Payments.[Sum],Teachers.TeacherName as nameTe , Teachers.TeacherId as idTeacher " +
                    "from Payments  inner join Students on Payments.PayerId = Students.StudentId " +
                    "inner join Teachers on Teachers.TeacherId = Students.TeacherId where Teachers.schoolId = " + ScoolId;
                DataTable dt = s.DataTable(sql);
                s.Conn.Close();
                return dt;
            }
            public static void receivingPaymentTaecherToScool(int idTaecher, int sum)
            {
                SqlClass s = new SqlClass();
                string sql = "insert into Payments(PaymentTypeId,PayerId,PaymentDate,PaymentsNum,[Sum])" +
                    "values (2," + idTaecher + ",GETDATE(),1," + sum + ")";
                s.ExecuteNonQuery(sql);               
            }
            public static void receivingPaymentScoolToAdmin(int idTaecher, int sum)
            {
                SqlClass s = new SqlClass();
                string sql = "insert into Payments(PaymentTypeId,PayerId,PaymentDate,PaymentsNum,[Sum])" +
                    "values (3," + idTaecher + ",GETDATE(),1," + sum + ")";
                s.ExecuteNonQuery(sql);
            }

        }
    }
   
}