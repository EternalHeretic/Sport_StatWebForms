using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Sport_Stat.Models;
using System.Data.Entity;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using Sport_Stat.Controllers;

namespace Sport_Stat.Add
{
    public partial class AddShell : System.Web.UI.Page
    {
        public static string controlContent = "ctl00$FeaturedContent$"; //строка изменения имени с формы
        protected void Page_Load(object sender, EventArgs e)
        {
            //Проверка доступа по роли
            Models.ApplicationDbContext context = new ApplicationDbContext();
            var roleStore = new RoleStore<IdentityRole>(context);
            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            if (Context.User.IsInRole("User"))
            {
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }
        protected void but_add_shell_Click(object sender, EventArgs e)
        {
            string tableName = "Shells";
            string[] fieldlist = new string[] {
                "shell_name"
            };

            string[] valuelist = new string[] {
                "'" + txt_shell.Text + "'"
            };

            Controllers.Combo.addNewRec(tableName, fieldlist, valuelist);
            Response.Redirect("/Shell.aspx");
        }
    }
}