using LamedNetLite.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LamedNetLite
{
    namespace BLL
    {
        public class idName
        {
            public int Id { get; set; }
            public string name { get; set; }

            public idName(int id, string name)
            {
                this.Id = id;
                this.name = name;
            }
            public idName() { this.Id = -1; this.name = ""; }//קןנסטקטור ריק

            public static List<idName> getlistgenericTeacher(int scoolId)
            {
                return idNameData.getlistgenericTeacher(scoolId);
            }
            public static List<idName> getlistgenericScools()
            {
                return idNameData.getlistgenericScools();
            }
            public static List<idName> getlistgenericStatusTast()
            {
                return idNameData.getlistgenericStatusTast();
            }
            public static List<idName> getlistgenericStatusStudent()
            {
                return idNameData.getlistgenericStatusStudent();
            }
            public static List<idName> getlistgenericLiceneTypeIdAndName()
            {
                return idNameData.getlistgenericLiceneTypeIdAndName();
            }
        }
       
    }
    
}