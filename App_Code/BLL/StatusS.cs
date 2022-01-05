using LamedNetLite.DAL;
using LamedNetLite.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LamedNetLite
{
    namespace BLL
    {
        public class StatusS
        {
            public int Id { get; set; }
            public string statusName { get; set; }

            public StatusS(int id, string namest)
            {
                this.Id = id;
                this.statusName = namest;
            }
            public StatusS()
            {

            }
            public static List<StatusS> getListStatus()
            {
                return StatusSData.getListStatus();
            }
        }
         
    }
    
}