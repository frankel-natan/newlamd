using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using LamedNetLite.BLL;
using LamedNetLite.DAL;

namespace LamedNetLite.Controllers
{
    public class SearchTeachers
    {
        public string TeacherSearchVal { get; set; }
        public string CitySearcheVal { get; set; }
    }
    public class SearchTeachersController : ApiController
    {
        // GET: api/v1/SearchTeachers
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/v1/SearchTeachers/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/v1/SearchTeachers
        public string Post([FromBody]SearchTeachers value)
        {
            // Student user = (Student)System.Web.HttpContext.Current.Session["user"];
            Student user = StudentData.getById(1);
            return
                StudentData.GetTeachersSearchResult
                (value.TeacherSearchVal, value.CitySearcheVal,user.LicenseTypeID);
        }

        // PUT: api/v1/SearchTeachers/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/v1/SearchTeachers/5
        public void Delete(int id)
        {
        }
    }
}
