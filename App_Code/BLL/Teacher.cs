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

            public Teacher(int TeacherId, int schoolId, string TeacherName, string ID, string Phone, string StudyAreaId, string UserName, string Password, string DateAdded,int LicenseTypesId,int  PaymentsNum, int StatusId)
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
                TeacherData.AddOrUpdate_Teather(TeacherId,schoolId, TeacherName, ID, Phone, StudyAreaId, UserName, Password,LicenseTypesId,PaymentsNum, StatusId);
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
            public DataTable getAllLessonesByIdTeather (int taecherId)
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
        }
    }
    


}