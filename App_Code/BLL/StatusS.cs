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
        public class StatusS
        {
            public int Id { get; set; }
            public string statusName { get; set; }

            public StatusS (int id , string nameStatus)
            {
                this.Id = id;
                this.statusName = nameStatus;
            }
            public StatusS()
            { }
            public DataTable getAllData()
            {
                return StatusSData.getAllData();
            }
            public List<StatusS> getListStatus()
            {
                return StatusSData.getListStatus();
            }
        }
         
    }
    
}