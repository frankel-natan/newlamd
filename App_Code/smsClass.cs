using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Net;
using System.Net.Mime;
using System.Collections.Specialized;
using System.Text;

namespace LamedNetLite
{
    namespace Messages
    {
        public class smsClass
        {
            public string key { get; set; }
            public string user { get; set; }
            public string pass { get; set; }
            public string sender { get; set; } 
            public string recipient { get; set; }
            public string msg { get; set; }
           
            
            public smsClass()
            {
                this.key = "V5RtwhQtV";
                this.user = "0509594646";
                this.pass = "69492678";
                this.sender = "LamedNet";
                
                
               // Response.Write(Encoding.UTF8.GetString(Data));
            }
            public string sendMsg(string to, string msg)
            {
                this.recipient = to;
                this.msg = msg;
                WebClient Wc = new WebClient();
                string Type = "POST";
                string Url = "https://www.sms4free.co.il/ApiSMS/SendSMS";
                NameValueCollection Parameters = new NameValueCollection();
                Parameters.Add("key", this.key);
                Parameters.Add("user", this.user);
                Parameters.Add("pass", this.pass);
                Parameters.Add("sender", this.sender);
                Parameters.Add("recipient", this.recipient);
                Parameters.Add("msg", this.msg);

                var Data = Wc.UploadValues(Url, Type, Parameters);
                return Encoding.UTF8.GetString(Data);
            }
           
        }
        
    }
    

}
