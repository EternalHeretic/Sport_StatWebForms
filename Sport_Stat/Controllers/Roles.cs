using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Sport_Stat.Controllers
{
    public class Roles
    {
        public static string conStr = ConfigurationManager.AppSettings["DefaultConnection"];
        public static string NameDateBase = "aspnet-Sport_Stat-20180128084905";

        public static void EditRoles()
        {

        }

        public static void Admin()
        {

        }

        public static void Moderator()
        {

        }

        public static void Referee()
        {

        }

        public static void User()
        {

        }

    }
}