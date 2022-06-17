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
    public class lassonstudentController : ApiController
    {
        // GET: api/v1/lassonstudent
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/lassonstudent/5
        public string Get(int id)
        {
            string tamp = JsonConvert.SerializeObject(Teacher.getAllStudentsByIdteacherAndCountLesonss(id));
            return tamp;
        }

        // POST: api/lassonstudent
        public void Post([FromBody] Student value)//עדכון כל פרטי התלמיד
        {
            Teacher.updteStudentTeacher(value);
        }

        // PUT: api/v1/lassonstudent/5
        public void Put(int id, [FromBody]Student value)
        {
            
        }

        // DELETE: api/lassonstudent/5
        public void Delete(int id)
        {
        }
    }
}
