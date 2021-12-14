using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LamedNetLite.Data;
using System.Data;
using System.Data.SqlClient;
using LamedNetLite.BLL;
using Newtonsoft.Json;

namespace LamedNetLite
{
    namespace DAL
    {
        public class StudentData
        {
            private static DataTable getDt(string sql)
            {
                SqlClass s = new SqlClass();
                DataTable dt = s.DataTable(sql);
                s.Conn.Close();
                return dt;
           }
            private static DataTable SearchByTeacher(string SearchVal,int LicenseTypeID) 
            {
                //מחפש את המורים ע"פ השם וסוג הרישיון שמלמדים

                string sql = "SELECT StudyAreaId, TeacherName as val,TeacherId as id FROM " +
                    "Teachers inner join LicenseTypes on " +
                    "Teachers.LicenseTypesId=LicenseTypes.LicenseTypeID WHERE TeacherName LIKE " +
                    "N'%"+SearchVal+"%' and (LicenseTypes.LicenseType)like " +
                    "(N'%'+ (select LicenseType from  LicenseTypes  where LicenseTypeID="+LicenseTypeID+")+'%' )";
                return getDt(sql);
            }
            private static DataTable SearchByCity(string SearchVal)
            {
                string sql = "SELECT *, StudyAreaName as val," +
                    "StudyAreaId as id FROM StudyAreas WHERE StudyAreaName" +
                    " LIKE N'%" + SearchVal+"%'";
                return getDt(sql);
            }
            private static List<DataTable> SearchByTeacherAndCity(string TeacherSearchVal,string CitySearchVal,int LicenseTypeID)
            {
                DataTable TeachersDt = SearchByTeacher(TeacherSearchVal,LicenseTypeID);
                DataTable CityesDt = SearchByCity(CitySearchVal);
                //מערך עבור סימון אינדקסים בהם יש התאמה עם אחד המורים
                bool[] CityesValidation = new bool[CityesDt.Rows.Count];
                
                //מעבר על כל המורים 
                for (int i=0;i<TeachersDt.Rows.Count;i++)
                {
                    //אם הדגל יהיה שקר בסוף הריצה על המורה -  
                    //אין התאמה לאחד הערים ולכן נמחק את המורה
                    bool flage = false;
                    //שליפה של השדה מחרוזת אצל המורה המכיל רשימה של מזהיי ערים בהם מלמד
                    string[] CityesArr=(TeachersDt.Rows[i]["StudyAreaId"].ToString()).Split(',');//1,5,8
                    //מעבר על הרשימה של הערים שבהם מלמד המורה
                    foreach (string TeachersCityId in CityesArr)
                    {
                        //מעבר על רשימת הערים שחזרו בתוצאות החיפוש
                        for (int j = 0; j < CityesDt.Rows.Count; j++)
                        {
                            //שליפה של מזהה העיר
                            string cityId = CityesDt.Rows[j]["StudyAreaId"].ToString();
                            if (TeachersCityId == cityId)//יש התאמה בין המורה לעיר 
                            {
                                flage = true;//את המורה הנוכחי לא נמחק
                                CityesValidation[j] = true;//את העיר באינדקס הנוכחי לא נמחק
                            }
                        }
                    }
                    if (!flage)//אין שום עיר שתואמת לערים בהם מלמד המורה
                    {
                        TeachersDt.Rows[i].Delete();//מחיקת המורה 
                        //i--;//כדי שלא נדלג על המורה הבא
                    }
                }
                //מעבר על הערים
                for(int i=0;i<CityesDt.Rows.Count;i++)
                {
                    //אין התאמה בין העיר באינדקס הנוכחי לשום מורה
                    if(!CityesValidation[i])
                    {
                        CityesDt.Rows[i].Delete();//מחיקת העיר
                        //i--;//כדי שלא נדלג על עיר
                    }
                }
                int a = 1;
                CityesDt.AcceptChanges();//מוחק לגמרי את השורה ולא רק את התוכן
                TeachersDt.AcceptChanges();//מוחק לגמרי את השורה ולא רק את התוכן
                a = 2;
                return new List<DataTable>() { TeachersDt, CityesDt };

            }
            public static string GetTeachersSearchResult(string TeacherSearchVal,string CitySearcheVal,int LicenseTypeID)
            {
                if(TeacherSearchVal==null)
                {
                    
                    return JsonConvert.SerializeObject(SearchByCity(CitySearcheVal));
                }
                else if(CitySearcheVal==null)
                {
                    return JsonConvert.SerializeObject( SearchByTeacher(TeacherSearchVal,LicenseTypeID));
                }
                else
                {
                    List<DataTable> dataTables= SearchByTeacherAndCity(TeacherSearchVal, CitySearcheVal, LicenseTypeID);
                    string result = "[" 
                        + JsonConvert.SerializeObject(dataTables[0]) + "," 
                        + JsonConvert.SerializeObject(dataTables[1]) 
                        + "]";
                    return result;
                }
            }
            public static DataTable getLicenseTypes()
            {
                SqlClass s = new SqlClass();
                DataTable dt = s.DataTable
                    ("select * from LicenseTypes where CHARINDEX('/',LicenseType)=0");
                s.Conn.Close();
                return dt;

            }
            public static string[] getStudentInformation(int StudentId,int TeacherId,int LicenseTypeID,float LessPrice)
            {
                string sql = "select* from Teachers where TeacherId = "+TeacherId;
                SqlClass s = new SqlClass();
                SqlDataReader Dr = s.ExecuteReader(sql);
                string TeacherName = "";
                int SchoolId=0;
                if (Dr.Read())
                {
                    TeacherName = (string)Dr["TeacherName"];
                    SchoolId = (int)Dr["schoolId"];
                }
                else
                {
                    s.Conn.Close();
                    return null;
                }
                s.Conn.Close();
                s = new SqlClass();
                sql = "select * from schools where schoolId=" + SchoolId;
                Dr = s.ExecuteReader(sql);
                string SchoolName = "";
                if (Dr.Read())
                {
                    SchoolName = (string)Dr["SchoolName"];
                }
                else
                {
                    s.Conn.Close();
                    return null;
                }
                s.Conn.Close();
                s = new SqlClass();
                sql = "select SUM(DATEDIFF" +
                    "(MINUTE, DrivingLessons.BeginningTime,DrivingLessons.EndTime))/" +
                    "(select top 1 LessonLen from Admin)" +
                    " from DrivingLessons where StatuseId=3 and DrivingLessons.StudentsId=" + StudentId+" and  " +
                    "CONVERT(DATETIME, CONVERT(VARCHAR, DateLesson) + ' '+ " +
                    "CONVERT(VARCHAR, EndTime))<GETDATE()";
                int NumOfLessons;
                try
                {
                    object rsult = s.ExecuteScalar(sql);
                    if (rsult.ToString() == "")
                        NumOfLessons = 0;
                    else
                        NumOfLessons = (int)rsult ;
                }
                catch
                {
                    s.Conn.Close();
                    return null;
                }
                s.Conn.Close();
                s = new SqlClass();
                sql = "select sum(Sum) from Payments where" +
                    " PaymentTypeId=1" +//תשלום מסוג: תלמיד-מורה-שיעור
                    " and PayerId="+StudentId;
                float AmountPaid;
                try
                {
                    object rsult = s.ExecuteScalar(sql);
                    if (rsult.ToString()=="")
                        AmountPaid = 0;
                    else
                        AmountPaid =float.Parse(rsult.ToString());
                }
                catch(Exception e)
                {
                    s.Conn.Close();
                    return null;
                }
                s.Conn.Close();
                s = new SqlClass();
                sql ="select SUM(DATEDIFF" +
                    "(MINUTE, DrivingLessons.BeginningTime,DrivingLessons.EndTime))/40 " +
                    "from DrivingLessons where DrivingLessons.StudentsId=" + StudentId+" and  " +
                    "CONVERT(DATETIME, CONVERT(VARCHAR, DateLesson) + ' '+ " +
                    "CONVERT(VARCHAR, EndTime))<GETDATE() and StatuseId=2";
                float debt;
                try
                {
                    object rsult = s.ExecuteScalar(sql);
                    if (rsult.ToString() == "")
                        debt = 0;
                    else
                        debt =AmountPaid-( (int)rsult * LessPrice);
                }
                catch
                {
                    s.Conn.Close();
                    return null;
                }
                s.Conn.Close();
                s = new SqlClass();
                sql = "select LicenseType from LicenseTypes where LicenseTypeID=" + LicenseTypeID;
                string LicenseType;
                try
                {
                    LicenseType=(string)s.ExecuteScalar(sql);
                }
                catch
                {
                    s.Conn.Close();
                    return null;
                }
                s.Conn.Close();
                return new string[]
                { 
                    TeacherName,
                    SchoolName,
                    NumOfLessons.ToString(), 
                    AmountPaid.ToString(), 
                    debt.ToString(), 
                    LicenseType 
                };
                
            }
            public static DataTable getTeachersData(int LicenseTypseId)
            {
                string sql = "select * from Teachers inner join " +
                    "schools on Teachers.schoolId = schools.schoolId " +
                    "inner join LicenseTypes on Teachers.LicenseTypesId " +
                    "= LicenseTypes.LicenseTypeID where " +
                    "(LicenseTypes.LicenseType)like" +
                    "(N'%'+ (select LicenseType from " +//השאילתה הפנימית שולפת את שם סוג הרישיון שהתלמיד בחר
                    "LicenseTypes where LicenseTypeID="+LicenseTypseId+
                    ")+'%' )";
                // בחלק של התנאי אנחנו בודקים האם שם סוג הרישיון
                //ששלפנו מוכל בתוך שמ/ות הרישיונ/ות שהמורה מלמד
                SqlClass s = new SqlClass();
                DataTable dt = s.DataTable(sql);
                s.Conn.Close();
                return dt;
            }
            public static DataTable getTeacherData(int TeacherId)
            {
                string sql = "select *, Teachers.TeacherName,schools.schoolName from Teachers" +
                    " inner join" +
                   " schools on Teachers.schoolId=schools.schoolId " +
                   "inner join " +
                   "LicenseTypes on " +
                   "Teachers.LicenseTypesId = LicenseTypes.LicenseTypeID" +
                   " where Teachers.TeacherId =" + TeacherId;
                return getDt(sql);
                   
            }
            public static DataTable getTeachersData(int StudyAreaId,int LicenseTypeID)
            {
                string sql = "select * from Teachers inner join schools on " +
                    "Teachers.schoolId=schools.schoolId inner join LicenseTypes on " +
                    "Teachers.LicenseTypesId=LicenseTypes.LicenseTypeID where  " +
                    "StudyAreaId like '%"+StudyAreaId+"%' and (LicenseTypes.LicenseType)like " +
                    "(N'%'+ (select LicenseType from  LicenseTypes where " +
                    "LicenseTypeID="+LicenseTypeID+" )+'%' )";
                return getDt(sql);
            }
            public static DataTable getTeachersData(string TeacherName)//יכול להיות כמה מורים עם אותו שם ואז תחזור יותר משורה אחת
            {
                string sql = "select *, Teachers.TeacherName,schools.schoolName from Teachers inner join" +
                    " schools on Teachers.schoolId=schools.schoolId " +
                    "inner join LicenseTypes on " +
                    "Teachers.LicenseTypesId = LicenseTypes.LicenseTypeID"+
                    " where REPLACE(Teachers.TeacherName, ' ', '') =" +//הפונקציה מצמצמת רווחים
                    "N'"+ TeacherName + "'" ;
                return getDt(sql);
            }

            public static DataTable getLesstypes(int TeacherId)
            {
                string sql = "select * from LessonsTypes where TeacherId="+ TeacherId;
                return getDt(sql);
            }
            
            
            public static List<TimeSpan> getLessList(int Tid, int NumOfDay, string date, string LessLen)
            {
                string sql = "select * from Students inner join " +
                    "DrivingLessons on Students.StudentId =" +
                    " DrivingLessons.StatuseId where Students.TeacherId " +
                    "= " + Tid + " and DrivingLessons.DateLesson='" + date+"'";
                DataTable LessDt = getDt(sql);
                sql = "select min(DurationOfTheLesson) from LessonsTypes where TeacherId=" + Tid;
                SqlClass s = new SqlClass();
                TimeSpan MinLess = (TimeSpan)s.ExecuteScalar(sql);
                s.Conn.Close();
                sql = "select * from BusinessDays where TeacherId=" + Tid + " and NumberOfDay=" + NumOfDay;
                DataTable BuDyDt = getDt(sql);
                sql = "select * from Vacations where " +
                    "'" + date + " 00:00:00' between Convert" +
                    "(DATETIME, Convert(INT, BeginningOfVacation - 0.5)) " +
                    "and Convert(DATETIME, Convert(INT, EndOfVacation - 0.5)) " +
                    "and TeacherId=" + Tid;
                DataTable VDt = getDt(sql);

                TimeSpan tmp = (TimeSpan)BuDyDt.Rows[0]["BeginningTime"];
                List<TimeSpan> LessList = new List<TimeSpan>();
                int flag = 0;
                int lessLenInt = int.Parse(LessLen);
                TimeSpan Etmp = new TimeSpan(tmp.Hours, tmp.Minutes + lessLenInt, tmp.Seconds);
                //int c = 0;
                while (Etmp <= (TimeSpan)BuDyDt.Rows[0]["EndTime"])//רץ על שעה
                {
                    //TimeSpan tempTs = (TimeSpan)BuDyDt.Rows[0]["EndTime"];
                    flag = 0;

                    //while (LessDR.Read() && flag == 0)//רץ על שיעור תפוס
                    foreach(DataRow less in LessDt.Rows)
                    {
                        if (flag == 0)
                        {
                            TimeSpan SLess = (TimeSpan)less["BeginningTime"];
                            TimeSpan Eless = (TimeSpan)less["EndTime"];
                            Etmp = new TimeSpan(tmp.Hours, tmp.Minutes + lessLenInt, tmp.Seconds);
                            if ((tmp >= SLess && tmp < Eless) || (Etmp > SLess && Etmp <= Eless))
                            {
                                tmp = Eless;
                                Etmp = new TimeSpan(tmp.Hours, tmp.Minutes + lessLenInt, tmp.Seconds);
                                flag = 1;
                                //c++;
                            }
                        }
                        else
                            break;
                       
                    }
                    //while (VDr.Read() && flag == 0)//&& (((DateTime)VDr["BeginningOfVacation"]).TimeOfDay==tmp) || (((DateTime)VDr["EndOfVacation"]).TimeOfDay == tmp
                    foreach(DataRow Vac in VDt.Rows)
                    {
                        if (flag == 0)
                        {
                            DateTime bv = (DateTime)Vac["BeginningOfVacation"];
                            DateTime ev = (DateTime)Vac["EndOfVacation"];
                            string[] dayArr= date.Split('/');
                            DateTime lessT = new DateTime(int.Parse(dayArr[2]), int.Parse(dayArr[0]), int.Parse(dayArr[1]), tmp.Hours, tmp.Minutes, tmp.Seconds);
                            if (lessT > bv && lessT < ev)
                            {
                                TimeSpan ts1 = ev.TimeOfDay;
                                tmp = ev.TimeOfDay;
                                Etmp = new TimeSpan(tmp.Hours, tmp.Minutes + lessLenInt, tmp.Seconds);
                                flag = 1;
                                //האם החופשה מסתיימת ביום אחר - אין עוד שיעורים פנויים 
                                if (ev.Date != bv.Date)
                                {
                                    tmp = (TimeSpan)BuDyDt.Rows[0]["EndTime"];
                                    Etmp = new TimeSpan(tmp.Hours, tmp.Minutes + lessLenInt, tmp.Seconds);
                                }
                            }
                        }
                        else
                            break;
                    }
                    if (flag == 0)
                    {
                        LessList.Add(tmp);
                        tmp = tmp.Add(MinLess);
                        Etmp = new TimeSpan(tmp.Hours, tmp.Minutes + lessLenInt, tmp.Seconds);
                    }
                }
                return LessList;
            }
            public static void AddOrUpdate_Student(int StudentId, int TeacherId,int StatuseId, string StudentName, string ID, string Phone, string UserName, string Password, int LicenseTypeID, string GatheringPlace, float PricePerLesson, string DateAdded,string ProfilePicName)
            {

                SqlClass s = new SqlClass();
                if (StudentId == -1)
                    s.ExecuteNonQuery("Insert into [Students] ( TeacherId,StatuseId, StudentName, ID, Phone, userName, Password, LicenseTypeID,GatheringPlace,PricePerLesson,DateAdded,ProfilePicName)values(" + TeacherId + ","+StatuseId+",N'" + StudentName + "'," + ID + ",'" + Phone + "'," + UserName + ",'" + Password + "'," + LicenseTypeID +",N'"+ GatheringPlace+"',"+ PricePerLesson + ",GETDATE(),'"+ ProfilePicName + "')");
                else
                    s.ExecuteNonQuery("update [Students] set TeacherId=" + TeacherId + ",StatuseId=" + StatuseId+ ",StudentName=N'" + StudentName + "', ID='" + ID + "', Phone='" + Phone + "', UserName='" + UserName + "', Password='" + Password + "', LicenseTypeID=" + LicenseTypeID + ", GatheringPlace=N'"+ GatheringPlace + "', PricePerLesson="+ PricePerLesson + ", DateAdded='"+DateAdded+ "',ProfilePicName='"+ ProfilePicName + "'where StudentId=" + StudentId);
                s.Conn.Close();
            }
            public static DataTable getAllData()
            {
                return getDt("Select * From Students");
            }
            public static DataTable getAllData(int TeacherId)
            {
                return getDt("select * from Students where TeacherId="+TeacherId);
            }
            public static Student getById(int id)
            {
                SqlClass s = new SqlClass();
                SqlDataReader Dr = s.ExecuteReader("Select * From Students where StudentId=" + id);
                //           public Student(int StudentId, int TeacherId, string StudentName, string ID, string Phone, string UserName, string Password, int LicenseTypeID, string GatheringPlace, float PricePerLesson, string DateAdded)
                Student tmp=null;
                if (Dr.Read())
                {
                    //double a = (double)Dr["PricePerLesson"];
                    //DateTime  dt = (DateTime)Dr["DateAdded"];
                    //string str = dt.ToString();
                    tmp = new Student((int)Dr["StudentId"], (int)Dr["TeacherId"], (string)Dr["StudentName"], (string)Dr["ID"], (string)Dr["Phone"], (string)Dr["userName"], (string)Dr["Password"], (int)Dr["LicenseTypeID"], (string)Dr["GatheringPlace"], (float)(double)Dr["PricePerLesson"], ((DateTime)Dr["DateAdded"]).ToString(), (int)Dr["StatuseId"],(string)Dr["ProfilePicName"]);// "" + (string)Dr["DateAdded"]);
                }
                    s.Conn.Close();
                return tmp;
            }
            public static void Delete(int StudentId)
            {
                SqlClass s = new SqlClass();
                s.ExecuteNonQuery("DELETE FROM [Students] WHERE StudentId=" + StudentId);
                s.Conn.Close();
            }
            //מחזירה - אמת! במידה וכבר קיים 
            public static bool IsExist(string UserName)
            {
                SqlClass s = new SqlClass();
                SqlDataReader Dr = s.ExecuteReader("Select * From Students where UserName='" + UserName + "'");
                bool tmp = Dr.Read();
                s.Conn.Close();
                return tmp;
            }

            public static Student validation(string Email, string Password)
            {
                string sql = "select* from Students where UserName ='" + Email + "' and Password='" + Password + "'";
                SqlClass s = new SqlClass();
                SqlDataReader Dr = s.ExecuteReader(sql);
                if (Dr.Read())
                {
                    Student tmp = new Student((int)Dr["StudentId"], (int)Dr["TeacherId"], (string)Dr["StudentName"], (string)Dr["ID"], (string)Dr["Phone"], (string)Dr["UserName"], (string)Dr["Password"], (int)Dr["LicenseTypeID"], (string)Dr["GatheringPlace"], (float)Dr["PricePerLesson"],((DateTime)Dr["DateAdded"]).ToString(),(int)Dr["StatuseId"],(string)Dr["ProfilePicName"]);
                    s.Conn.Close();
                    return tmp;
                }
                s.Conn.Close();
                return null;
            }
        }
    }
    
}