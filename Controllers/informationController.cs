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
    public class informationController : ApiController
    {
        // GET: api/information
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/information/v1/5
        public object Get(string id)
        {
            string tamp = JsonConvert.SerializeObject(Admin.getinformation(id));
            //return Convert.ToInt32(tamp);
            return int.Parse(tamp);
        }

        // POST: api/information
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/information/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/information/5
        public void Delete(int id)
        {
        }
    }
}
