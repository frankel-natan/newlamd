using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LamedNetLite.BLL;
using LamedNetLite.DAL;

namespace LamedNetLite
{
    /// <summary>
    /// Summary description for StudEventsHandl
    /// </summary>
    public class StudEventsHandl : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            // int id =int.Parse(context.Request["id"]);
            //Student user = (Student)context.Session["user"];
            //int Tid = user.TeacherId;//לשלוח את זה
            List<string[]> eventList = DrLessonsData.GetAllLessonsByTid(1);//לשנות
            //context.Response.ContentType = "application/plain";//לבדוק איזה אחד צריך
            string js = "var TeacherEvent=[";
            js += "{title: 'Meeting',start: '2020-09-12T10:30:00',end: '2020-09-12T12:30:00'},";
            foreach (string[] st in eventList)
            {
                js += "{title: '" + st[0] + ":',start:'" + st[1] + "',end: '" + st[2] + "'},";
            }
            js += "];";
            js += "var StudentEvent=[";
            eventList = DrLessonsData.GetAllLessonsByStudId(1);
            foreach (string[] st in eventList)
            {
                js += "{title: '" + st[0] + ":שיעור נהיגה',display: 'background',start:'" + st[1] + "',end: '" + st[2] + "'},";
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