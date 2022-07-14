using LamedNetLite.BLL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace LamedNetLite.Controllers
{
    public class ListWaitinigQueueController : ApiController
    {
        // GET: api/ListWaitinigQueue
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/ListWaitinigQueue/5
        public string Get(int id)
        {
            string tamp = JsonConvert.SerializeObject(Teacher.GetallstudentWitinge(id));
            return tamp;
        }

        // POST: api/v1/ListWaitinigQueue
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/ListWaitinigQueue/5
        public void Put(int id, [FromBody]string value)
        {
            Teacher.updteStudent(id);
        }

        // DELETE: api/ListWaitinigQueue/5
        public void Delete(int id)
        {
            Teacher.deliteStudent(id);
        }
    }
}
