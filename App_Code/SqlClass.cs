using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LamedNetLite
{
    namespace Data
    {
        public class SqlClass
        {
            public string ConnStr { get; set; }//מחרוזת התחברות
            public SqlConnection Conn { get; set; }// צינור התחברות
            public SqlCommand Cmd { get; set; }//אובייקט פקודה המריץ שאילתות דרך צינור

            public SqlClass()
            {
                ConnStr = ConfigurationManager.ConnectionStrings["Constr"].ConnectionString;
                Conn = new SqlConnection();
                Conn.ConnectionString = ConnStr;
                Conn.Open();
                Cmd = new SqlCommand();
                Cmd.Connection = Conn;

            }
            /* 
             Receives:Sql query.
             Return:DataReader.
             
             */
            //מקבלת שאילתה , מריצה ומחזירה את הנתונים שהתקבלו בדאטה רידר
            public SqlDataReader ExecuteReader(string Query)
            {
                Cmd.CommandText = Query;
                return Cmd.ExecuteReader();
            }
            //מקבלת שאילתה ללא החזרת ערך , מריצה
            public void ExecuteNonQuery(string Query)
            {
                Cmd.CommandText = Query;
                Cmd.ExecuteNonQuery();
            }

            //מחזיר נתונים בצורת טבלה
            public DataTable DataTable(string Query)
            {
                Cmd.CommandText = Query;
                SqlDataAdapter Da = new SqlDataAdapter(Cmd);
                DataTable Dt = new DataTable();// יצירת אובייקט טבלה
                Da.Fill(Dt);//מילוי הטבלה בנתונים 
                return Dt;//החזרה של הטבלה
            }

            
            public object ExecuteScalar(string Query)
            {
                Cmd.CommandText = Query;
                return Cmd.ExecuteScalar();
            }

            

        }
    }


}