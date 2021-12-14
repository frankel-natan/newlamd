﻿using System;
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
        public class TeacherData
        {
            private static DataTable getDt(string sql)
            {
                SqlClass s = new SqlClass();
                DataTable dt = s.DataTable(sql);
                s.Conn.Close();
                return dt;
            }
            private static DataTable GetStudentsByStatuse(int TeacherId, int statuseId)
            {
                string sql = "select * from Students where " +
                    "TeacherId=" + TeacherId + " and StatuseId=" + statuseId;
                return getDt(sql);
            }
            public static DataTable GetTeachersPayments(int TeacherId)
            {                                                                           //תשלום מורה לבת ספר
                string sql = "select * from Payments where PayerId=" + TeacherId + " and PaymentTypeId=2";
                return getDt(sql);
            }
            public static void DeleteStudentse(List<int> StudentsIdList)
            {
                foreach (int i in StudentsIdList)
                {
                    Student s = StudentData.getById(i);
                    s.Delete();
                }
            }
            public static void ChangeStudentStatus(int StatuseId, List<int> StudentsIdList)
            {
                SqlClass s = new SqlClass();
                string sql = "";
                int count = 0;
                foreach (int i in StudentsIdList)
                {
                    sql += "update Students set StatuseId=" + StatuseId + " " +
                        "where StudentId=" + i;
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
            public static DataTable GetWaitingStudents(int TeacherId)
            {
                return GetStudentsByStatuse(TeacherId, 1);
            }
            public static DataTable GetLicenseTypes()
            {
                return getDt("select * from LicenseTypes");
            }
            public static string GetSchoolsSearchResult(string SchoolSearchVal)
            {
                string sql = "select * from schools where SchoolName like N'%" + SchoolSearchVal + "%'";
                return JsonConvert.SerializeObject(getDt(sql));
            }
            public static DataTable GetSchools()
            {
                return getDt("select * from schools");
            }
            public static DataTable GetSchools(int schoolId)
            {
                return getDt("select * from schools where schoolId=" + schoolId);
            }
            public static DataTable GetStudyAreas()
            {
                return getDt("Select * From StudyAreas");
            }
            public static void AddOrUpdate_Teather(int TeacherId, int schoolId, string TeacherName, string ID, string Phone, string StudyAreaId, string UserName, string Password, int LicenseTypesId, int PaymentsNum, int StatusId)
            {
                SqlClass s = new SqlClass();
                if (TeacherId == -1)
                    s.ExecuteNonQuery("Insert into [Teachers] ( schoolId, TeacherName, ID, Phone, StudyAreaId, UserName, Password,DateAdded,LicenseTypesId,PaymentsNum,StatusId)values(" + schoolId + ",N'" + TeacherName + "','" + ID + "','" + Phone + "'," + StudyAreaId + ",'" + UserName + "','" + Password + "',GETDATE())," + LicenseTypesId + "," + PaymentsNum + "," + StatusId);
                else
                    s.ExecuteNonQuery("update [Teachers] set schoolId=" + schoolId + ",TeacherName=N'" + TeacherName + "', ID='" + ID + "', Phone='" + Phone + "', StudyAreaId='" + StudyAreaId + "', UserName='" + UserName + "', Passsword='" + Password + ",LicenseTypesId=" + LicenseTypesId + ",PaymentsNum=" + PaymentsNum + ",StatusId=" + StatusId + "'where TeacherId=" + TeacherId);
                s.Conn.Close();
            }
            public static DataTable getAllData()
            {
                SqlClass s = new SqlClass();
                DataTable Dt = s.DataTable("Select * From Teachers");
                s.Conn.Close();
                return Dt;
            }
            public static DataTable getAllData(int ScholId)//מקבל אייידי של בית ספר
            {
                SqlClass s = new SqlClass();
                DataTable Dt = s.DataTable("Select * From Teachers where schoolId=" + ScholId);
                s.Conn.Close();
                return Dt;
            }
            public static Teacher getById(int id)
            {
                SqlClass s = new SqlClass();
                SqlDataReader Dr = s.ExecuteReader("Select * From Teachers where TeacherId=" + id);      //TeacherData.getById(id);
                Teacher tmp = null;
                while (Dr.Read())
                {
                    tmp = new Teacher((int)Dr["TeacherId"], (int)Dr["schoolId"], (string)Dr["TeacherName"], (string)Dr["ID"], (string)Dr["Phone"], (string)Dr["StudyAreaId"], (string)Dr["UserName"], (string)Dr["Password"], "" + Dr["DateAdded"], (int)Dr["LicenseTypesId"], (int)Dr["PaymentsNum"], (int)Dr["StatuseId"]);
                }
                s.Conn.Close();
                return tmp;
            }
            public static void Delete(int TeacherId)
            {
                SqlClass s = new SqlClass();
                s.ExecuteNonQuery("DELETE FROM [Teachers] WHERE TeacherId=" + TeacherId);
                s.Conn.Close();
            }
            //מחזירה - אמת! במידה וכבר קיים 
            public static bool IsExist(string UserName)
            {
                SqlClass s = new SqlClass();
                SqlDataReader Dr = s.ExecuteReader("Select * From Teachers where UserName='" + UserName + "'");
                bool tmp = Dr.Read();
                s.Conn.Close();
                return tmp;
            }
            public static int getStudyAreasId(string name)
            {
                SqlClass s = new SqlClass();
                int tmp = int.Parse((string)s.ExecuteScalar("Select StudyAreaId From Teachers where StudyAreaName=" + name));
                s.Conn.Close();
                return tmp;
            }

            public static Teacher validation(string Email, string Password)
            {
                string sql = "select* from Teachers where UserName ='" + Email + "' and Password='" + Password + "'";
                SqlClass s = new SqlClass();
                SqlDataReader Dr = s.ExecuteReader(sql);
                if (Dr.Read())
                {
                    Teacher tmp = new Teacher((int)Dr["TeacherId"], (int)Dr["schoolId"], (string)Dr["TeacherName"], (string)Dr["ID"], (string)Dr["Phone"], (string)Dr["StudyAreaId"], (string)Dr["UserName"], (string)Dr["Password"], "" + Dr["DateAdded"], (int)Dr["LicenseTypesId"], (int)Dr["PaymentsNum"], (int)Dr["StatusId"]);
                    s.Conn.Close();
                    return tmp;
                }
                s.Conn.Close();
                return null;
            }
            public static DataTable GetAllTestByTaecherAndStatus1(int idTaecher)
            {
                return getDt("Select * from TableTast Where statusTast = 1 and TeacherId = " + idTaecher);
            }
            public static DataTable GetStudentByTaecher(int TaecherId)
            {
                return getDt("Select * From Students where TeacherId=" + TaecherId);
            }
            public static int GetCostByIdTaecher(int IdTaecher)
            {
                SqlClass s = new SqlClass();
                string Sql = "select ISNULL (sum(TableTast.priceTast) , 0 ) from TableTast where TableTast.TeacherId=" + IdTaecher;
                int tamp = int.Parse(s.ExecuteScalar(Sql).ToString());
                //int tamp = int.Parse(a);
                s.Conn.Close();
                return tamp;
            }
            public static int GetPayByIdTaecher(int TaypPay, int TaecherId)
            {
                string sql = "select ISNULL (sum(Payments.Sum),0) from Payments where paymenttypeid =" + TaypPay + " and Payerid =" + TaecherId;
                SqlClass s = new SqlClass();
                int tamp = int.Parse(s.ExecuteScalar(sql).ToString());
                return tamp;
            }
            public static DataTable GetAllTastByITeacher(int idTaecher)
            {
                return getDt("select * from TableTast inner join TastStatus on TableTast.statusTast = TastStatus.Id inner join Teachers on Teachers.TeacherId = TableTast.TeacherId where Teachers.TeacherId = " + idTaecher);
            }
        }

    }
}