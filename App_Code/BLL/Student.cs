using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using LamedNetLite.DAL;

namespace LamedNetLite
{
    namespace BLL
    {
        public class Student
        {
           public int StudentId { get; set; }
           public int TeacherId { get; set; }
           public int StatuseId { get; set; }
           public string StudentName { get; set; }
           public string ID { get; set; }
           public string Phone { get; set; }
           public string UserName { get; set; }
           public string Password { get; set; }
           public int LicenseTypeID { get; set; }
           public string GatheringPlace { get; set; }
           public float PricePerLesson { get; set; }
           public string DateAdded { get; set; }
           public string ProfilePicName { get; set; }
           public Student(int StudentId, int TeacherId, string StudentName, string ID, string Phone, string UserName, string Password, int LicenseTypeID, string GatheringPlace, float PricePerLesson, string DateAdded, int StatuseId = 1,string ProfilePicName= "DefaultProfile.png")
           {
                this.StudentId = StudentId;
                this.TeacherId = TeacherId;
                this.StatuseId = StatuseId; 
                this.StudentName = StudentName;
                this.ID=ID;
                this.Phone = Phone;
                this.UserName = UserName;
                this.Password = Password;
                this.LicenseTypeID = LicenseTypeID;
                this.GatheringPlace = GatheringPlace;
                this.PricePerLesson = PricePerLesson;
                this.DateAdded = DateAdded;
                this.ProfilePicName = ProfilePicName;
           }
            public Student()
            { }
            public DataTable getLessTypes()
            {
                return StudentData.getLesstypes(this.TeacherId);
            }
            public List<TimeSpan> getLessList(int NumOfDay,string date,string LessLen)
            {//(1,2, "7/4/2021")
                return StudentData.getLessList(this.TeacherId,NumOfDay,date,LessLen);
            }

            public void AddOrUpdate_Student()
            {
                StudentData.AddOrUpdate_Student(StudentId,TeacherId, StatuseId, StudentName, ID, Phone, UserName, Password,LicenseTypeID,GatheringPlace,PricePerLesson,DateAdded,ProfilePicName);
            }
            public DataTable getAllData()
            {
                return StudentData.getAllData();
            }
            public Student getById(int id)
            {
                return StudentData.getById(id);
            }
            public void Delete()
            {
                StudentData.Delete(StudentId);
            }
            public bool IsExist(string UserName)
            {
                return StudentData.IsExist(UserName);
            }
            public static DataTable getAllLesonnesDay(int idT, string daystring)
            {
                return StudentData.getAllLesonnesDay(idT, daystring);
            }
            public static DataTable getAllTaypLesonnes(int idT)
            {
                return StudentData.getAllTaypLesonnes(idT);
            }
            public static DataTable getDayVacations(int idT, string day)
            {
                return StudentData.getDayVacations(idT, day);
            }
            public static DataTable getstudentandTeacher(int idS)
            {
                return StudentData.getstudentandTeacher(idS);
            }
            public static DataTable getstudentLessons(int ids)
            {
                return StudentData.getstudentLessons(ids);
            }
            public static DataTable getstudentPay(int idS)
            {
                return StudentData.getstudentPay(idS);
            }
        }
        
    }
    
}