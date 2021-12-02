using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Services;
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
using AjaxControlToolkit;

namespace Sport_Stat
{
        public partial class Judging : System.Web.UI.Page
        {
            public static string tableName = "AspNetUsers";
            public static string[] fieldlist = new string[] {
                    "Email",
                    "EmailConfirmed",
                    "PasswordHash",
                    "SecurityStamp",
                    "PhoneNumber",
                    "PhoneNumberConfirmed",
                    "TwoFactorEnabled",
                    "LockoutEndDateUtc",
                    "LockoutEnabled",
                    "AccessFailedCount",
                    "UserName",
                    "PeopleId"
                };
            public static string controlContent = "ctl00$FeaturedContent$";

            protected void Page_Load(object sender, EventArgs e)
            {

                InitData();
                Models.ApplicationDbContext context = new ApplicationDbContext();
                var roleStore = new RoleStore<IdentityRole>(context);
                var roleMgr = new RoleManager<IdentityRole>(roleStore);

                string strCurrentUserId = User.Identity.GetUserId();
                string whereValue = " Id = '" + strCurrentUserId + "'";
                
                DataTable dt = Controllers.Combo.getDataFromTable(tableName, fieldlist, "", whereValue);

                //var ParticipantID = 1;
                var PeopleId = Controllers.Combo.getParentIdfromTable("AspNetUsers", "PeopleId", "Id = '" + strCurrentUserId + "' ");
                var RefereeId = Controllers.Combo.getParentIdfromTable("Referee", "RefereeId", "PeopleId = '" + PeopleId + "' ");
                txt_refereeid.Text = RefereeId;
                if (Context.User.IsInRole("User"))

                {
                }
                else
                {
                    Response.Redirect("~/Account/Login.aspx");
                }
            }

            protected void InitData()
            {
                string strCurrentUserId = User.Identity.GetUserId();
                string whereValue = " Id = '" + strCurrentUserId + "'";
                DataTable dt = Controllers.Combo.getDataFromTable(tableName, fieldlist, "", whereValue);

                

                //var ParticipantID = 1;
                var PeopleId = Controllers.Combo.getParentIdfromTable("AspNetUsers", "PeopleId", "Id = '" + strCurrentUserId + "' ");
                var RefereeId = Controllers.Combo.getParentIdfromTable("Referee", "RefereeId", "PeopleId = '" + PeopleId + "' ");
                //lbl_userid.Text = "PeopleID: " + PeopleId + "RefereeID: " + RefereeId; 

            }

            protected void btn_ok_Click(object sender, EventArgs e)
            {

            }

            protected void gv_Referee_Judging_SelectedIndexChanged(object sender, EventArgs e)
            {
          
            }

            protected void gv_Referee_Judging_RowDataBound(object sender, GridViewRowEventArgs e)
            {
            
            }

            protected void btnusertest_Click(object sender, EventArgs e)
            {

            }

            protected void btn_end_judging_Click(object sender, EventArgs e)
            {

            }
        }
}