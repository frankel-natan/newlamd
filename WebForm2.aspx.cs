using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LamedNetLite.DAL;
using LamedNetLite.BLL;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Collections.Specialized;
using System.Text;

namespace LamedNetLite
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //WebClient Wc = new WebClient();
            //string Type = "POST";
            //string Url = "https://www.sms4free.co.il/ApiSMS/SendSMS";
            //NameValueCollection Parameters = new NameValueCollection();
            //Parameters.Add("key", "V5RtwhQtV");
            //Parameters.Add("user", "0509594646");
            //Parameters.Add("pass", "69492678");
            //Parameters.Add("sender", "LamedNet");
            //Parameters.Add("recipient", "0585502299");
            //Parameters.Add("msg", "נרשמת בהצלחה למערכת למדנט");

            //var Data = Wc.UploadValues(Url, Type, Parameters);
            //Response.Write(Encoding.UTF8.GetString(Data)); 
            
            

            //// Student t = StudentData.getById(1);
            ////DataTable dt = StudentData.getAllData();
            //SqlDataReader Dr = DrLessonsData.GetAllLessons(1);
            //string start="";
            //string end="";
            //string str = "";
            //DateTime dt;
            //while(Dr.Read())
            //{
            //   // start = Dr["DateLesson"]+"";//תאריך השיעור
            //    dt = (DateTime)Dr["DateLesson"];
            //    //DateTime t = new DateTime();
            //    //DateTime.
            //    int Minutes=int.Parse(((TimeSpan)Dr["BeginningTime"]).Minutes.ToString());
            //    int Hours=int.Parse(((TimeSpan)Dr["BeginningTime"]).Hours.ToString());
            //    dt =dt.AddMinutes(Minutes);
            //    dt = dt.AddHours(Hours);
            //    //dt = dt.AddHours(1);
            //    //dt.TimeOfDay.Add(new TimeSpan(11, 20, 0));

            //    //dt.GetDateTimeFormats()
            //     str =((TimeSpan) Dr["BeginningTime"]).Minutes.ToString();//שעת התחלה
            //     end = Dr["DateLesson"] + "T" + Dr["EndTime"];
            //    //ltr1.Text += dt.ToString();
            //    ltr1.Text+= String.Format("{0:s}", dt);
            //    ltr1.Text += "<br />";
            //    //ltr1.Text += str;
            //    ltr1.Text += "<br />";
           
        }
        //js += "{title: 'Meeting',start: '2020-09-12T10:30:00',end: '2020-09-12T12:30:00'},";



    }
    }
