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

namespace Sport_Stat
{
    public partial class Participant : System.Web.UI.Page
    {
        public static string tablename = "Participants";
        //public static string TableUrl = Request["PK"];
        //public static string CompetitionsId = string.Empty;
        //string CompetitionsId = "SELECT * FROM [Participants] join [Peoples] on [Peoples].[PeopleId]=[Participants].[PeopleId] join [Cities] on [Peoples].[CityId]=[Cities].[CityId] WHERE ( [ParticipantId] LIKE '" + Request["PK"].ToString() + "');";

        protected void Page_Load(object sender, EventArgs e)
        {
             //Проверка доступа по роли
            Models.ApplicationDbContext context = new ApplicationDbContext();
            var roleStore = new RoleStore<IdentityRole>(context);
            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            string rolego = "User";
            if (Context.User.IsInRole(role: rolego))
            {
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx");
            }

            var ssilka = Request["PK"];
            //проверка на первичный ключ
            if ((Request["PK"] != null))
            {

            }
            else
            {
                Response.Redirect("Competition.aspx");
            }




        }

        protected void But_addper_Click(object sender, EventArgs e)
        {
            if (Request["PK"] != null)
            {
                Response.Redirect("/Add/AddParticipant.aspx" + "?PK=" + Request["PK"]);
            }
        }
    }
}