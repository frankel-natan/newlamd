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
    public class str
    {
        public string srrd { get; set; }
        public string srrt { get; set; }
        public string srrla { get; set; }
    }
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
        public void Put(int id, [FromBody] str value)
        
        {
            string hourStr = value.srrt.Split(':')[0];
            string minutStr = value.srrt.Split(':')[1];
            int lang = int.Parse(value.srrla);
            TimeSpan s = new TimeSpan(int.Parse(hourStr), int.Parse(minutStr), 0);
            TimeSpan e = new TimeSpan(0, lang, 0);
            var adds = s.Add(e);
            DrLessons tamp = new DrLessons(value.srrd,s,id, 1, adds);
            DrLessons.AddLesson(tamp);
        }

        // DELETE: api/lassonstudent/5
        public void Delete(int id)
        {
        }
    }
}
