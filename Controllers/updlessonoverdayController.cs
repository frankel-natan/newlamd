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
    public class updlessonoverdayController : ApiController
    {
        // GET: api/updlessonoverday
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/updlessonoverday/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/updlessonoverday
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/updlessonoverday/5
        public void Put(int id, [FromBody]string value)
        {
            Teacher.updOverDay(id, int.Parse(value));
            
        }

        // DELETE: api/updlessonoverday/5
        public void Delete(int id)
        {
        }
    }
}
