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
        public class School
        {
            public int schoolId { get; set; }
            public string SchoolName { get; set; }
            public string Password { get; set; }
            public string AdministratorUserName { get; set; }
            public string Phone { get; set; }
            public string DateAdded { get; set; }
            public int PaymentsNum { get; set; }


            public School(int schoolId, string SchoolName, string Password, string AdministratorUserName, string Phone, string DateAdded,int PaymentsNum)
            {
                this.schoolId = schoolId;
                this.SchoolName = SchoolName;
                this.Password = Password;
                this.AdministratorUserName = AdministratorUserName;
                this.Phone = Phone;
                this.DateAdded = DateAdded;
                this.PaymentsNum = PaymentsNum;
            }
            public void AddOrUpdate_School()//לשקול החלפה לשימוש באובייקט במקום שדות
            {
                SchoolData.AddOrUpdate_School( schoolId,  SchoolName, Password, AdministratorUserName,  Phone, DateAdded, PaymentsNum);
            }
            public DataTable getAllData()
            {
                return SchoolData.getAllData();
            }
            public DataTable getAllData(int id)
            {
                return SchoolData.getAllData(id);
            }
            public School getById(int id)
            {
                return SchoolData.getById(id);
            }
            public void Delete()
            {
                SchoolData.Delete(schoolId);
            }
            public bool IsExist(string UserName)
            {
                return SchoolData.IsExist(UserName);
            }
            public int getMaxId()
            {
                return SchoolData.getMaxId();
            }
            public DataTable GetWaitingTeachers()
            {
                return SchoolData.GetWaitingTeachers(schoolId);
            }


        }

    }
    
}