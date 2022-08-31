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
    
    public class addlesoonTeacherController : ApiController
    {
        // GET: api/addlesoonTeacher
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/addlesoonTeacher/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/addlesoonTeacher
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/addlesoonTeacher/5
        public void Put(int id, [FromBody] str value)
        {
            string hourStr = value.srrt.Split(':')[0];
            string minutStr = value.srrt.Split(':')[1];
            int lang = int.Parse(value.srrla);
            TimeSpan s = new TimeSpan(int.Parse(hourStr), int.Parse(minutStr), 0);
            TimeSpan e = new TimeSpan(0, lang, 0);
            var adds = s.Add(e);
            DrLessons tamp = new DrLessons(value.srrd, s, id, 2, adds);
            DrLessons.AddLesson(tamp);
        }

        // DELETE: api/addlesoonTeacher/5
        public void Delete(int id)
        {
        }
    }
}
