using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using LamedNetLite.DAL;

namespace LamedNetLite.Controllers
{
    public class SearchSchoolController : ApiController
    {
        // GET: api/v1/SearchSchool
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/v1/SearchSchool/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/v1/SearchSchool
        public string Post([FromBody]string value)
        {
            string s=TeacherData.GetSchoolsSearchResult(value);
            return s;
        }

        // PUT: api/v1/SearchSchool/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/v1/SearchSchool/5
        public void Delete(int id)
        {
        }
    }
}
