using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LamedNetLite.DAL;

namespace LamedNetLite
{
    namespace BLL
    {
        public class Admin
        {
            public int AdminId { get; set; }
            public string UserName { get; set; }
            public string Password { get; set; }
            public int PaymentsNum { get; set; }
            public int LessonLen { get; set; }
            public Admin(int AdminId,string UserName,string Password,int PaymentsNum,int LessonLen)
            {
                this.AdminId = AdminId;
                this.UserName = UserName;
                this.Password = Password;
                this.PaymentsNum = PaymentsNum;
                this.LessonLen = LessonLen;
            }
            public Admin validation()
            {
                return AdminData.validation(UserName, Password);
            }

        }
    }
    
}