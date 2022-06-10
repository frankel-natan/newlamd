using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using LamedNetLite.BLL;
using Newtonsoft.Json;
using LamedNetLite.DAL;
using LamedNetLite.Data;

namespace LamedNetLite.Controllers
{
    public class VacationsController : ApiController
    {
        // GET: api/Vacations
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Vacations/v1/5
        public string Get(int id)
        {
            string tamp = JsonConvert.SerializeObject(TeacherData.getAllVacationsIdTeather(id));
            return tamp;
        }

        // POST: api/Vacations
        public void Post([FromBody]Vacations value)
        {
            Vacations.AddOrUpdate_Vacation2(value);
        }

        // PUT: api/Vacations/5
        public void Put(int id, [FromBody]string value)
        {
         
        }

        // DELETE: api/v1/Vacations/5
        public void Delete(int id)
        {
            Teacher.deleteVacationById(id);
        }
    }
}
