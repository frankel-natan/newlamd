using LamedNetLite.App_Code.BLL;
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
    public class GetallTastByIdTeacherController : ApiController
    {
        // GET: api/GetallTastByIdTeacher
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/v1/GetallTastByIdTeacher/5
        public string Get(int id)
        {
            string tamp = JsonConvert.SerializeObject(Teacher.GetallTastByIdTeacher(id));
            return tamp;
        }

        // POST: api/GetallTastByIdTeacher
        public void Post([FromBody]tast value)
        {
            Teacher.enterTest(value.TeacherId, value.TestRequestDate);
        }

        // PUT: api/GetallTastByIdTeacher/5
        public void Put(int id, [FromBody]string value)
        {
            
        }

        // DELETE: api/GetallTastByIdTeacher/5
        public void Delete(int id)
        {
        }
    }
}
