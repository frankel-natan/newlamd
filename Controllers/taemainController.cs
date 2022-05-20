﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using LamedNetLite.BLL;
using Newtonsoft.Json;
using LamedNetLite.DAL;
using LamedNetLite.Data;

namespace LamedNetLite.Controllers
{
    public class taemainController : ApiController
    {
        // GET: api/v1/taemain
        //public IEnumerable<string> Get()
        public string Get()
        {
            return "{\"title\":\"event18\",\"start\":\"2022-06-12T19:20:00\",\"end\":\"2022-06-12T20:00:00\",\"allDay\":false,\"id\":1}";
        }

        // GET: api/taemain/5       
        public string Get(int id)
        {
            string tamp = JsonConvert.SerializeObject(TeacherData.getAllLessonesByIdTeather(id));
            return tamp;
        }

        // POST: api/taemain
        public string Post([FromBody] string value)
        {
            
            return null;
        }

        // PUT: api/taemain/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/taemain/5
        public void Delete(int id)
        {
        }
    }
}