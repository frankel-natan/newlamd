using LamedNetLite.DAL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace LamedNetLite.Controllers
{
    public class selectStatusStudentController : ApiController
    {
        // GET: api/v1/selectStatusStudent
        public string Get()
        {
            string tamp = JsonConvert.SerializeObject(idNameData.getlistgenericStatusStudent());
            return tamp;

        }

        // GET: api/selectStatusStudent/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/selectStatusStudent
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/selectStatusStudent/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/selectStatusStudent/5
        public void Delete(int id)
        {
        }
    }
}
