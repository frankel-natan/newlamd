using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using LamedNetLite.BLL;
using LamedNetLite.DAL;

namespace LamedNetLite
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            // int id =int.Parse(context.Request["id"]);
            //Teacher user = (Teacher)context.Session["user"];
            //int Tid = user.TeacherId;//לשלוח את זה
            List<string[]> eventList = DrLessonsData.GetAllLessonsByTid(1);//לשנות
            //context.Response.ContentType = "application/plain";//לבדוק איזה אחד צריך
            string js = "var arrEvent=[";
            js += "{title: 'Meeting',start: '2020-09-12T10:30:00',end: '2020-09-12T12:30:00'},";
            foreach (string[] st in eventList)
            {
                js += "{title: '" + st[0] + ":שיעור נהיגה',start:'" 
                    + st[1] + "',end: '" + st[2] + "'},";
            }
            js += "];";
            
            context.Response.ContentType = "text/plain";
            context.Response.Write(js);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}