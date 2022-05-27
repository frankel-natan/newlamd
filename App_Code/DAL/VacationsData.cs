using LamedNetLite.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LamedNetLite.BLL;
using LamedNetLite.DAL;
using Newtonsoft.Json;

namespace LamedNetLite
{
    namespace DAL
    {
        public class VacationsData
        {
            public static void AddOrUpdate_Vacation(int TeacherId,  string start, string end)
            {
                SqlClass s = new SqlClass();
                s.ExecuteNonQuery("update [Vacations] set BeginningOfVacation = "+ start +" 00:00 ," + "EndOfVacation= " +end +" 23:59");
                s.Conn.Close();
            }
            public static void AddOrUpdate_Vacation(Vacations x)
            {
                SqlClass s = new SqlClass();
                s.ExecuteNonQuery("INSERT INTO Vacations(Teacherid,BeginningOfVacation,EndOfVacation)VALUES( " + x.TeacherId + ", '" + x.BeginningOfVacation + "' , ' " + x.EndOfVacation + "')");
                s.Conn.Close();
            }

        }
    }
    
}