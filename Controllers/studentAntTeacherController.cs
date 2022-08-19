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
    public class studentAntTeacherController : ApiController
    {
        // GET: api/studentAntTeacher
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/studentAntTeacher/v1/5
        public string Get(int id)
        {
            string tamp = JsonConvert.SerializeObject(Student.getstudentandTeacher(id));
            return tamp;
        }

        // POST: api/studentAntTeacher
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/studentAntTeacher/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/studentAntTeacher/5
        public void Delete(int id)
        {
        }
    }
}
