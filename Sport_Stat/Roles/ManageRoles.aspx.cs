using System;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Sport_Stat.Models;
using System.Data;
using Sport_Stat.Controllers;

namespace Sport_Stat.Roles
{
    public partial class ManageRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userrole = "Admin";
            if (Context.User.IsInRole(userrole))
            {

            }
            else
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }

        protected void CreateRoleButton_Click(object sender, EventArgs e)
        {
            ApplicationDbContext context = new ApplicationDbContext();
            IdentityResult IdRoleResult;
            var roleStore = new RoleStore<IdentityRole>(context);
            var roleMgr = new RoleManager<IdentityRole>(roleStore);
            string RoleRegister = RoleName.Text.Trim();
            if (!roleMgr.RoleExists(roleName: RoleRegister))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = RoleRegister });
            }

            RoleName.Text = string.Empty;
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void DeleteRoleButton_Click(object sender, EventArgs e)
        {
            if (RoleName.Text != null)
            {
                string tableName = "AspNetRoles";
                string idl = RoleName.Text;
                string whereValue = " Name = '" + idl.ToString() + "'";
                string[] fieldlist = new string[] {
                    "Id"
                };
                DataTable dt = Combo.getDataFromTable(tableName, fieldlist, "", whereValue);
                for (var i = 0; i < dt.Rows.Count; i++)
                {
                    string Id = dt.Rows[i]["Id"].ToString();
                }
                Combo.delRec(tableName, whereValue);
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            else
            {
            }
            
        }
    }
}