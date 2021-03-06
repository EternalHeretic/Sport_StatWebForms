using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Sport_Stat.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sport_Stat
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
    }
}