using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using LamedNetLite.DAL;
using System.Data.SqlClient;


namespace LamedNetLite
{
    namespace BLL
    {
        public class Teacher
        {
            public int TeacherId { get; set; }
            public int schoolId { get; set; }
            public string TeacherName { get; set; }
            public string ID { get; set; }
            public string Phone { get; set; }
            public string StudyAreaId { get; set; }
            public string UserName { get; set; }
            public string Password { get; set; }
            public string DateAdded { get; set; }
            public int LicenseTypesId { get; set; }
            public int PaymentsNum { get; set; }
            public int StatusId { get; set; }

            public Teacher(int TeacherId, int schoolId, string TeacherName, string ID, string Phone, string StudyAreaId, string UserName, string Password, string DateAdded, int LicenseTypesId, int PaymentsNum, int StatusId)
            {
                this.TeacherId = TeacherId;
                this.schoolId = schoolId;
                this.TeacherName = TeacherName;
                this.ID = ID;
                this.Phone = Phone;
                this.StudyAreaId = StudyAreaId;
                this.UserName = UserName;
                this.Password = Password;
                this.DateAdded = DateAdded;
                this.LicenseTypesId = LicenseTypesId;
                this.PaymentsNum = PaymentsNum;
                this.StatusId = StatusId;
            }
            public Teacher(Teacher x)
            {
                this.TeacherId = x.TeacherId;
                this.schoolId = x.schoolId;
                this.TeacherName = x.TeacherName;
                this.ID = x.ID;
                this.Phone = x.Phone;
                this.StudyAreaId = x.StudyAreaId;
                this.UserName = x.UserName;
                this.Password = x.Password;
                this.DateAdded = x.DateAdded;
                this.LicenseTypesId = x.LicenseTypesId;
                this.PaymentsNum = x.PaymentsNum;
                this.StatusId = x.StatusId;
            }
            public Teacher()
            { }
            public Teacher(string TeacherName, string ID, string Phone, string StudyAreaId, string UserName, string Password, int LicenseTypesId)
            {
                this.TeacherId = -1;
                this.schoolId = -1;
                this.TeacherName = TeacherName;
                this.ID = ID;
                this.Phone = Phone;
                this.StudyAreaId = StudyAreaId;
                this.UserName = UserName;
                this.Password = Password;
                this.DateAdded = "";
                this.LicenseTypesId = LicenseTypesId;
                this.PaymentsNum = 1;
                this.StatusId = 1;
            }
            public DataTable GetWaitingStudents()
            {
                return TeacherData.GetWaitingStudents(TeacherId);
            }
            public void AddOrUpdate_Teather()
            {
                TeacherData.AddOrUpdate_Teather(TeacherId, schoolId, TeacherName, ID, Phone, StudyAreaId, UserName, Password, LicenseTypesId, PaymentsNum, StatusId);
            }
            public static void AddOrUpdate_Teather2(Teacher x)
            {
                TeacherData.AddOrUpdate_Teather2(x);
            }
            public DataTable getAllData()
            {
                return TeacherData.getAllData();
            }
            public Teacher getById(int id)
            {
                return TeacherData.getById(id);
            }
            public void Delete()
            {
                TeacherData.Delete(TeacherId);
            }
            public bool IsExist(string UserName)
            {
                return TeacherData.IsExist(UserName);
            }
            public DataTable getAllLessonesByIdTeather(int taecherId)
            {
                return TeacherData.getAllLessonesByIdTeather(taecherId);
            }
            public DataTable getAllVacationsIdTeather(int taecherId)
            {
                return TeacherData.getAllVacationsIdTeather(taecherId);
            }
            public static void deleteVacationById(int VacationId)
            {
                TeacherData.deleteVacationById(VacationId);
            }
            public static void deleteLessonById(int LessonId)
            {
                TeacherData.deleteLessonById(LessonId);
            }
            public static DataTable getAllStudentsByIdteacherAndCountLesonss(int idTaecher)
            {
                return TeacherData.getAllStudentsByIdteacherAndCountLesonss(idTaecher);
            }
            public static void updteStudentTeacher(Student x)
            {
                TeacherData.updteStudentTeacher(x);
            }
            public static DataTable getLessonsWatinngBtIdTaecher(int TaecherId)
            {
                return TeacherData.getLessonsWatinngBtIdTaecher(TaecherId);
            }
            public static void updteLesson(int LessonID)
            {
                TeacherData.updteLesson(LessonID);
            }
            public static void deliteLesson(int LessonID)
            {
                TeacherData.deliteLesson(LessonID);
            }
            public static DataTable GetallstudentWitinge(int idT)
            {
                return TeacherData.GetallstudentWitinge(idT);
            }
            public static void deliteStudent(int StudentID)
            {
                TeacherData.deliteStudent(StudentID);
            }
            public static void updteStudent(int StudentID)
            {
                TeacherData.updteStudent(StudentID);
            }
            public static DataTable GetallPaystudentByIdTeacher(int idT)
            {
                return TeacherData.GetallPaystudentByIdTeacher(idT);
            }
            public static DataTable GetallPayTeacertByIdTeacher(int idT)
            {
                return TeacherData.GetallPayTeacertByIdTeacher(idT);
            }
            public static DataTable GetallTastByIdTeacher(int idT)
            {
                return TeacherData.GetallTastByIdTeacher(idT);
            }
            public static DataTable patAllPayTeacherToAdminBtIdteacher(int idT)
            {
                return TeacherData.patAllPayTeacherToAdminBtIdteacher(idT);
            }
            public static void payStudentToTeachr(int idStu, float sum)
            {
                TeacherData.payStudentToTeachr(idStu, sum);
            }
            public static void enterTest(int idT, string testD)
            {
                TeacherData.enterTest(idT, testD);
            }
            public static DataTable getTeacherById(int idT)
            {
                return TeacherData.getTeacherById(idT);
            }
            public static DataTable getStudentByIdTeacher(int idT)
            {
                return TeacherData.getStudentByIdTeacher(idT);
            }
            public static void updOverDay(int idD, int status)
            {
                TeacherData.updOverDay(idD, status);
            }
        }

    }
}