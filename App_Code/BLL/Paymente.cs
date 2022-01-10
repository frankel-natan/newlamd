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
        }

    }
    
}