using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LamedNetLite.App_Code.BLL
{
    public class tast
    {
        public int Id { get; set; }
        public int TeacherId { get; set; }
        public string TestRequestDate { get; set; }
        public int statusTast { get; set; }
        public string TestOrderDate { get; set; }
        public float priceTast { get; set; }

        public tast() { }
        public tast( int id , int TeacherId , string TestRequestDate, int statusTast, string TestOrderDate, float priceTast)
        {
            this.Id = id;
            this.TeacherId = TeacherId;
            this.TestRequestDate = TestRequestDate;
            this.statusTast = statusTast;
            this.TestOrderDate = TestOrderDate;
            this.priceTast = priceTast;
        }
        public tast( int TeacherId, string TestRequestDate)
        {
            this.Id = -1;
            this.TeacherId = TeacherId;
            this.TestRequestDate = TestRequestDate;
            this.statusTast = 1;
            this.TestOrderDate = "";
            this.priceTast = 100;
        }

    }
}