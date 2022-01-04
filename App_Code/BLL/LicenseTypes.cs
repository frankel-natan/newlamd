using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LamedNetLite
{
    namespace BLL
    {
        public class LicenseTypes
        {
            public int LicenseTypeID { get; set; }
            public string LicenseType { get; set; }

            public LicenseTypes(int id, string type)
            {
                this.LicenseTypeID = id;
                this.LicenseType = type;
            }
            public LicenseTypes(string type)
            {
                this.LicenseType = type;
            }

        }
    }
    
}