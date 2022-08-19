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
    public class studentLessondController : ApiController
    {
        // GET: api/studentLessond
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/studentLessond/v1/5
        public string Get(int id)
        {
            string tamp = JsonConvert.SerializeObject(Student.getstudentLessons(id));
            return tamp;
        }

        // POST: api/studentLessond
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/studentLessond/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/studentLessond/5
        public void Delete(int id)
        {
        }
    }
}
