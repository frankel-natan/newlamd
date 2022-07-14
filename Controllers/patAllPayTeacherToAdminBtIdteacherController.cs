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
    public class patAllPayTeacherToAdminBtIdteacherController : ApiController
    {
        // GET: api/v1/patAllPayTeacherToAdminBtIdteacher
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/patAllPayTeacherToAdminBtIdteacher/5
        public string Get(int id)
        {
            string tamp = JsonConvert.SerializeObject(Teacher.patAllPayTeacherToAdminBtIdteacher(id));
            return tamp;
        }

        // POST: api/patAllPayTeacherToAdminBtIdteacher
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/patAllPayTeacherToAdminBtIdteacher/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/patAllPayTeacherToAdminBtIdteacher/5
        public void Delete(int id)
        {
        }
    }
}
