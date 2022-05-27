using LamedNetLite.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LamedNetLite
{
    namespace BLL
    {
        public class Vacations
        {
            public int VacationId { get; set; }
            public int TeacherId { get; set; }
            public string BeginningOfVacation { get; set; }
            public string EndOfVacation { get; set; }


            public Vacations()
            { }
            public Vacations(int TeacherId, string BeginningOfVacation,string EndOfVacation)
            {
                this.VacationId = -1;
                this.TeacherId = TeacherId;
                this.BeginningOfVacation = BeginningOfVacation;
                this.EndOfVacation = EndOfVacation;
            }
            public static void AddOrUpdate_Vacation(int TeacherId, string start, string end)
            {
                VacationsData.AddOrUpdate_Vacation(TeacherId, start, end);
            }
            public static void AddOrUpdate_Vacation2(Vacations x)
            {
                VacationsData.AddOrUpdate_Vacation(x);
            }

        }
    }
     
        
    
    
    
}