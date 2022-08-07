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

    public class payStudentController : ApiController
    {
        public class idsum{
            public int id { get; set; }
            public int sum { get; set; }
        }
        // GET: api/v1/payStudent
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/payStudent/5
        public string Get(int id)
        {
            string tamp = JsonConvert.SerializeObject(Teacher.GetallPaystudentByIdTeacher(id));
            return tamp;
        }

        // POST: api/payStudent
        public void Post([FromBody]idsum value)
        {
            Teacher.payStudentToTeachr(value.id, value.sum);
        }

        // PUT: api/payStudent/5
        public void Put(int id, [FromBody]Tuple<int,int> value)
        {
            var t = 5;
        }

        // DELETE: api/payStudent/5
        public void Delete(int id)
        {
        }
    }
}
