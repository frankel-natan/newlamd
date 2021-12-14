using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using LamedNetLite.BLL;
using LamedNetLite.DAL;

namespace LamedNetLite.Controllers
{
    public class thchersController : ApiController
    {
        // GET: api/v1/thchers
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/v1/thchers/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/v1/thchers 
        public int Post([FromBody] ajaxxxxx aa)
        {
            int ahhs = TeacherData.GetCostByIdTaecher(aa.thcher);
            string asd = "{bjj:"+ ahhs +" }";
            return ahhs;
        }

        // PUT: api/v1/thchers/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/v1/thchers/5
        public void Delete(int id)
        {
        }
    }
}
