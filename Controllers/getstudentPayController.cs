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
    public class getstudentPayController : ApiController
    {
        // GET: api/getstudentPay
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/getstudentPay/v1/5
        public string Get(int id)
        {
            string tamp = JsonConvert.SerializeObject(Student.getstudentPay(id));
            return tamp;
        }

        // POST: api/getstudentPay
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/getstudentPay/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/getstudentPay/5
        public void Delete(int id)
        {
        }
    }
}
