using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using Microsoft.VisualBasic.FileIO;//לבדוק למה לא עובד בקלאס וכן עובד בוובפרום
namespace LamedNetLite
{
    namespace General
    {
        public class General
        {
        //    public static DataTable GetDataTabletFromCSVFile(string csv_file_path)
        //    {
        //        DataTable csvData = new DataTable();
        //        try
        //        {
        //            using (Microsoft.VisualBasic.FileIO.TextFieldParser csvReader = new Microsoft.VisualBasic.FileIO.TextFieldParser(csv_file_path))
        //            {
        //                csvReader.SetDelimiters(new string[] { "," });
        //                csvReader.HasFieldsEnclosedInQuotes = true;
        //                string[] colFields = csvReader.ReadFields();
        //                foreach (string column in colFields)
        //                {
        //                    DataColumn datecolumn = new DataColumn(column);
        //                    datecolumn.AllowDBNull = true;
        //                    csvData.Columns.Add(datecolumn);
        //                }
        //                while (!csvReader.EndOfData)
        //                {
        //                    string[] fieldData = csvReader.ReadFields();
        //                    //Making empty value as null
        //                    for (int i = 0; i < fieldData.Length; i++)
        //                    {
        //                        if (fieldData[i] == "")
        //                        {
        //                            fieldData[i] = null;
        //                        }
        //                    }
        //                    csvData.Rows.Add(fieldData);
        //                }
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            return null;
        //        }
        //        return csvData;
        //    }
        //    public static void InsertDataIntoSQLServerUsingSQLBulkCopy(DataTable csvFileData)
        //    {
        //        string ConnStr = ConfigurationManager.ConnectionStrings["Constr"].ConnectionString;

        //        using (SqlConnection dbConnection = new SqlConnection(ConnStr))
        //        {
        //            dbConnection.Open();
        //            using (SqlBulkCopy s = new SqlBulkCopy(dbConnection))
        //            {
        //                s.DestinationTableName = "StudyAreas";
        //                foreach (var column in csvFileData.Columns)
        //                    s.ColumnMappings.Add(column.ToString(), column.ToString());
        //                s.WriteToServer(csvFileData);
        //            }
        //            dbConnection.Close();
        //        }
        //    }
        }
    }
    
}