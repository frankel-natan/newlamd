using LamedNetLite.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


namespace LamedNetLite
{
    namespace BLL
    {
        public class Paymente
        {
            public static DataTable gatAllPayTeaterByIdScool(int id)
            {
                return PaymenteData.gatAllPayTeaterByIdScool(id);
            }
            public static DataTable gatAllPayTeaterByIdScoolAndIdTaecher(int idScool , int idTeacher)
            {
                return PaymenteData.gatAllPayTeaterByIdScoolAndIdTaecher(idScool, idTeacher);
            }
            public static void receivingPaymentTaecherToScool(int idTaecher, int sum)
            {
                PaymenteData.receivingPaymentTaecherToScool(idTaecher, sum);
            }
            public static void receivingPaymentScoolToAdmin(int idScool, int sum)
            {
                PaymenteData.receivingPaymentScoolToAdmin(idScool, sum);
            }

        }

    }
    
}