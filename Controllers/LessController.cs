using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using LamedNetLite.BLL;
using LamedNetLite.DAL;
using Newtonsoft.Json;

namespace LamedNetLite
{
    public class LessController : ApiController
    {
        // GET: api/v1/Less
        public string Get()
        {
            return "";
        }
        // GET: api/v1/Less/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/v1/Less
        public string Post([FromBody]SelectedDay value)
        {
            System.Web.HttpContext.Current.Session["less"] = value;
            //להפעיל על האובייקט שבסשן
            // Student user = (Student)System.Web.HttpContext.Current.Session["user"];
            DataTable TypesDt = StudentData.getLesstypes(1);
            string str = "{";


             str = "[";
            foreach (DataRow row in TypesDt.Rows)
            {
                TimeSpan time = (TimeSpan)row["DurationOfTheLesson"];
                int minut = (time.Hours * 60) + time.Minutes;
                string lessLen = minut.ToString();
                List<TimeSpan> LessList = StudentData.getLessList(1, 2, value.DateStr, lessLen);//לשנות לערכים רלוונטים
                //str += "{\"typy\":\"" + (string)row["TypeName"] + "\",";
                //str += "\"lessArr\":[";
                str += "[\""+ (string)row["TypeName"]+"\",[";
                //string a = "1";
                //str += "[" + a+ ",[";
                foreach (TimeSpan ts in LessList)
                {
                    str +="\""+ts.ToString()+"\"";
                    str += ",";
                }
                if(LessList.Count>0)
                    str = str.Remove(str.Length - 1, 1);
                str += "]],";
            }
            str = str.Remove(str.Length - 1, 1);
            str += "]";
            //return value;
            return str;
            //return JsonConvert.SerializeObject(str);
        }//[{"typy":"שיעור רגיל","lessArr":[08:00:00,08:40:00,09:20:00,10:00:00,10:40:00,11:20:00,12:00:00,12:40:00,13:20:00,14:00:00,14:40:00,15:20:00,16:00:00,16:40:00,17:20:00,18:00:00,18:40:00,19:20:00]}_{"typy":"שיעור כפול","lessArr":[08:00:00,08:40:00,09:20:00,10:00:00,10:40:00,11:20:00,12:00:00,12:40:00,13:20:00,14:00:00,14:40:00,15:20:00,16:00:00,16:40:00,17:20:00,18:00:00,18:40:00,19:20:00]}]

        // PUT: api/v1/Less/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/v1/Less/5
        public void Delete(int id)
        {
        }
    }
}
