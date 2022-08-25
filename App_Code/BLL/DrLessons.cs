using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LamedNetLite.DAL;
using LamedNetLite.Data;

namespace LamedNetLite
{
    namespace BLL
    {
        public class DrLessons
        {
            public int DrivingLessonsId { get; set; }
            public string DateLesson { get; set; }
            public TimeSpan BeginningTime { get; set; }
            public int StudentId { get; set; }
            public int StatuseId { get; set; }
            public TimeSpan EndTime { get; set; }

            public DrLessons(string DateLesson, TimeSpan BeginningTime, int StudentId, int StatuseId, TimeSpan EndTime)
            {
                this.DrivingLessonsId = -1;
                this.DateLesson = DateLesson;
                this.BeginningTime = BeginningTime;
                this.StudentId = StudentId;
                this.StatuseId = StatuseId;
                this.EndTime = EndTime;
            }
            
            public DrLessons(string selectedLess, SelectedDay sd,int StudentId)
            {            //שיעור רגיל-40-08:00:00
                this.DrivingLessonsId = -1;
                this.DateLesson = sd.DateStr;
                this.StudentId = StudentId;
                 //   2         1           0
                //["שיעור רגיל","40","08:00:00"]
                string[] selectedLessArr = selectedLess.Split('-');
                string tmp = selectedLessArr[2];//08:00:00
                string hourStr=tmp.Split(':')[0];//08
                string minuteStr=tmp.Split(':')[1];//00
                TimeSpan Sts = new TimeSpan(int.Parse(hourStr), int.Parse(minuteStr), 0);
                TimeSpan Ets = Sts + TimeSpan.FromMinutes(int.Parse(selectedLessArr[1]));
                this.BeginningTime = Sts;
                this.EndTime = Ets;
                this.StatuseId = 1;

            }
            public void AddLesson()
            {
                DrLessonsData.AddLesson(this);
            }
            public static void AddLesson(DrLessons x)
            {
                DrLessonsData.AddLesson(x);
            }
        }
    }
    
}