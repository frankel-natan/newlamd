using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using LamedNetLite.Data;
using LamedNetLite.BLL;
using System.Data;

namespace LamedNetLite
{
    namespace DAL
    {
        public class DrLessonsData
        {
            public static void changeLessStatus(int StatuseId,List<int> lessIdList)
            {
                SqlClass s = new SqlClass();
                string sql = "";
                int count = 0;
                    foreach (int i in lessIdList)
                    {
                        sql += "update[DrivingLessons] set StatuseId = " + StatuseId + "where DrivingLessonsId = " + i + ";";
                        count++;
                        if (count == 50)
                        {
                            s.ExecuteNonQuery(sql);
                            count = 0;
                            sql = "";
                        }
                    }
                    if (count > 0)
                        s.ExecuteNonQuery(sql);
                s.Conn.Close();
            }
            public static DataTable getWaitingLessons(int Tid)
            {
                string sql = "select DrivingLessons.DateLesson,DrivingLessons.DrivingLessonsId," +
                    "DrivingLessons.BeginningTime,DrivingLessons.EndTime," +
                    "Students.StudentId,Students.StudentName ," +
                    "DATEDIFF(MINUTE,DrivingLessons.BeginningTime,DrivingLessons.EndTime)" +
                    "as lesslen ," +//מחזיר הפרש בדקות בין תחילת השיעור לסופו
                    "LessonsTypes.TypeName from DrivingLessons inner join Students" +
                    " on DrivingLessons.StudentsId = Students.StudentId  " +
                    "inner join Teachers on Teachers.TeacherId = " +
                    "Students.TeacherId inner join LessonsTypes on " +
                    "DATEDIFF(MINUTE,DrivingLessons.BeginningTime,DrivingLessons.EndTime)" +//מחזיר הפרש בדקות בין תחילת השיעור לסופו
                    "=DATEDIFF(MINUTE,0,LessonsTypes.DurationOfTheLesson) " +// מחזיר הפרש בדקות בין משך זמן שיעור ל 0 - כלומר ממיר אובייקט שעה למספר הדקות
                    "where Teachers.TeacherId = "+Tid+ "and LessonsTypes.TeacherId ="+Tid;
                SqlClass s = new SqlClass();
                DataTable dt= s.DataTable(sql);
                s.Conn.Close();
                return dt;
            }
            public static List<string[]> GetAllLessonsByTid(int Tid)
            {
                //string sql = "select CONVERT( date,DrivingLessons.DateLesson,111)as DateLesson" +
                string sql = "select DrivingLessons.DateLesson" +
                    ",DrivingLessons.BeginningTime,DrivingLessons.EndTime,Students.StudentName " +
                    "from DrivingLessons inner join " +
                    "Students on DrivingLessons.StudentsId = Students.StudentId " +
                    "inner join Teachers on Teachers.TeacherId = Students.TeacherId" +
                    " where Teachers.TeacherId =" + Tid;
                return getLessons(sql);
            }
            public static List<string[]> GetAllLessonsByStudId(int Sid)
            {
                string sql = "select * from DrivingLessons where StudentsId="+Sid;
                return getLessons(sql);
            }
            private static List<string[]> getLessons(string sqlQ)
            {
                SqlClass s = new SqlClass();
                SqlDataReader Dr = s.ExecuteReader(sqlQ);
                List<string[]> eventList = new List<string[]>();
                while (Dr.Read())
                {
                    DateTime dt = (DateTime)Dr["DateLesson"];
                    int Minutes = int.Parse(((TimeSpan)Dr["BeginningTime"]).Minutes.ToString());
                    int Hours = int.Parse(((TimeSpan)Dr["BeginningTime"]).Hours.ToString());
                    dt = dt.AddMinutes(Minutes);
                    dt = dt.AddHours(Hours);
                    string start = String.Format("{0:s}", dt);
                    dt = (DateTime)Dr["DateLesson"];
                    Minutes = int.Parse(((TimeSpan)Dr["EndTime"]).Minutes.ToString());
                    Hours = int.Parse(((TimeSpan)Dr["EndTime"]).Hours.ToString());
                    dt = dt.AddMinutes(Minutes);
                    dt = dt.AddHours(Hours);
                    string end = String.Format("{0:s}", dt);
                    string[] item = { (string)Dr["StudentName"], start, end };
                    eventList.Add(item);
                }
                s.Conn.Close();
                return eventList;
            }

            public static DataTable getAll()
            {
                SqlClass s = new SqlClass();
                string sql = "select * from DrivingLessons";
                DataTable Dt= s.DataTable(sql);
                s.Conn.Close();
                return Dt;

            }
            public static void AddLesson(DrLessons drl)
            {
                SqlClass s = new SqlClass();
                string sql = "insert into DrivingLessons" +
                    " (DateLesson,BeginningTime,StudentsId,StatuseId,EndTime)" +
                    "values('"+drl.DateLesson+"','"+drl.BeginningTime+"',"+drl.StudentId+","+drl.StatuseId+",'"+drl.EndTime+"')";
                s.ExecuteNonQuery(sql);
                s.Conn.Close();
            }
            public static void Delete(List<int> DrivingLessonsIdList)
            {
                SqlClass s = new SqlClass();
                string sql = "";
                int count = 0;
                    foreach (int i in DrivingLessonsIdList)
                    {
                        sql += "DELETE FROM [DrivingLessons] WHERE DrivingLessonsId=" + i + ";";
                        count++;
                        if (count == 50)
                        {
                            s.ExecuteNonQuery(sql);
                            count = 0;
                            sql = "";
                        }
                    }
                    if (count > 0)
                        s.ExecuteNonQuery(sql);
                s.Conn.Close();
            }
        }
    }
    
}