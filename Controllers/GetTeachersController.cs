using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using LamedNetLite.BLL;
using LamedNetLite.DAL;
using Newtonsoft.Json;

namespace LamedNetLite.Controllers
{
    public class GetTeachersController : ApiController
    {
        // GET: api/v1/GetTeachers
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/v1/GetTeachers/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/v1/GetTeachers
        public string Post([FromBody] SelectedTeacher value)
        {
            string s=value.val;//"רפיכהן"
            string JSONresult;
            JSONresult = JsonConvert.SerializeObject(StudentData.getTeachersData(s));
            //StudentData.getTeachersData(s);
            //string[] str=s.Split(' שם בית ספר')
            return JSONresult;
        }

        // PUT: api/v1/GetTeachers/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/v1/GetTeachers/5
        public void Delete(int id)
        {
        }
    }
}
