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

namespace Sport_Stat.Delete
{
    public partial class Participant : System.Web.UI.Page
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
            //подгрузка данных
            if (!IsPostBack)
            {
                initData();
                preinitdata();
            }
            //проверка на первичный ключ
            if ((Request["PK"] != null))
            {

            }
            else
            {
                Response.Redirect("~/Competition.aspx");
            }
        }

        public static string tableName = "Participants";
        public static string[] fieldlist = new string[] {
                "N_participant",
                "CompetitionId",
                "PeopleId"
            };
        public void preinitdata()
        {
            if (Request["PK"] != null)
            {
                var id = Request["PK"].ToString();
                string whereValue = " ParticipantId = '" + Request["PK"].ToString() + "'";
            }
            
        }
        protected void initData()
        {
            if (Request["PK"] != null)
            {
                string whereValue = " ParticipantId = '" + Request["PK"].ToString() + "'";
                DataTable dt = Controllers.Combo.getDataFromTable(tableName, fieldlist, "", whereValue);
                for (var i = 0; i < dt.Rows.Count; i++)
                {
                    lbl_Nparticipant.Text = dt.Rows[i]["N_participant"].ToString();
                    //lbl_familiya.Text = dt.Rows[i]["second_name"].ToString();
                    //lbl_otchestvo.Text = dt.Rows[i]["middle_name"].ToString();

                    var PeopleId = dt.Rows[i]["PeopleId"].ToString();
                    var first_name = Controllers.Combo.getParentIdfromTable("Peoples", "first_name", "PeopleId = '" + PeopleId + "' ");
                    var second_name = Controllers.Combo.getParentIdfromTable("Peoples", "second_name", "PeopleId = '" + PeopleId + "' ");
                    var middle_name = Controllers.Combo.getParentIdfromTable("Peoples", "middle_name", "PeopleId = '" + PeopleId + "' ");

                    lbl_name.Text = first_name;
                    lbl_familiya.Text = second_name;
                    lbl_otchestvo.Text = middle_name;

                    var CompetitionId = dt.Rows[i]["CompetitionId"].ToString();
                    var competition_name = Controllers.Combo.getParentIdfromTable("Competitions", "competition_name", "CompetitionId = '" + CompetitionId + "' ");

                    
                    lbl_competition_name.Text = competition_name;

                    var CityId = Controllers.Combo.getParentIdfromTable("Peoples", "CityId", "PeopleId = '" + PeopleId + "' ");
                    var city_name = Controllers.Combo.getParentIdfromTable("Cities", "city_name", "CityId = '" + CityId + "' ");

                    lbl_cities.Text = city_name;

                }
            }
            else
            {
            }

        }

        protected void but_delete_participants_Click(object sender, EventArgs e)
        {
            string tableName = "Participants";
            string whereValue = " ParticipantId = '" + Request["PK"].ToString() + "'";
            DataTable dt = Controllers.Combo.getDataFromTable(tableName, fieldlist, "", whereValue);
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                var CompetitionID = dt.Rows[i]["CompetitionId"].ToString();
                Controllers.Combo.delRec(tableName, whereValue);
                Response.Redirect("~/Participant.aspx" + "?PK=" + CompetitionID);
            }
        }
    }
}