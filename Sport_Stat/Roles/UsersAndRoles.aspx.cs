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

namespace Sport_Stat.Admin
{
    public partial class ControlRoles : System.Web.UI.Page
    {
        public static string controlContent = "ctl00$FeaturedContent$";
        protected void Page_Load(object sender, EventArgs e)
        {
            //Проверка доступа по роли
            Models.ApplicationDbContext context = new ApplicationDbContext();
            var roleStore = new RoleStore<IdentityRole>(context);
            var roleMgr = new RoleManager<IdentityRole>(roleStore);
            var userMgr = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            string userrole = "Admin";
            if (Context.User.IsInRole(userrole))
                {
            }
            else
            {
                Response.Redirect(url: "~/Default.aspx");
            }
            if (!IsPostBack)
            {
                InitAllComboBox();
            }
        }


        protected void InitAllComboBox()
        {

            initCombo(
                        "ddl_User",
                        "",
                        "AspNetUsers",
                        new string[] { "Id", "UserName" },
                        new string[] { "UserName" });
        }

        protected void initCombo(
            string _curControlName,
            string _ParentControlName,
            string _tableName,
            string[] _fieldList,
            string[] _orderbylist,
            string _pkFieldName = ""
        )
        {
            DropDownList curControl = (DropDownList)FindControl(controlContent + _curControlName);
            DropDownList parentControl = null;
            if (_ParentControlName != "")
                parentControl = FindControl(controlContent + _ParentControlName) as DropDownList;

            curControl.Items.Clear();
            ListItem item;
            if (parentControl == null || parentControl.Text != "")
            {
                string whereValue = string.Empty;
                if (parentControl != null && parentControl.Text != "")
                    whereValue = _pkFieldName + " = '" + parentControl.Text + "'";
                DataTable dt = Controllers.Combo.getDataFromTable(_tableName, _fieldList, "", whereValue, _orderbylist);
                if (dt.Rows.Count > 0)
                {
                    curControl.Enabled = true;
                    var idx = 0;
                    while (idx < dt.Rows.Count)
                    {
                        var name = dt.Rows[idx][1].ToString().Trim().Replace("\"", "");
                        var Id = dt.Rows[idx][0].ToString().Trim();
                        item = new ListItem(name, Id);
                        curControl.Items.Add(item);
                        idx++;
                    }
                }
                else
                    initEmptyItemIntoCombo(_curControlName);
            }
            else
                initEmptyItemIntoCombo(_curControlName);
        }

        protected void initEmptyItemIntoCombo(string _curControlName)
        {
            var curControl = FindControl(controlContent + _curControlName) as DropDownList;
            ListItem item;

            curControl.Enabled = false;
            item = new ListItem("данные отутствуют", "");
            curControl.Items.Add(item);
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            Models.ApplicationDbContext context = new ApplicationDbContext();
            var roleStore = new RoleStore<IdentityRole>(context);
            var roleMgr = new RoleManager<IdentityRole>(roleStore);
            var userMgr = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();

            userMgr.AddToRole(ddl_User.Text, ddl_role.Text);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void btn_rec_Click(object sender, EventArgs e)
        {
            Models.ApplicationDbContext context = new ApplicationDbContext();
            var roleStore = new RoleStore<IdentityRole>(context);
            var roleMgr = new RoleManager<IdentityRole>(roleStore);
            var userMgr = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();

            userMgr.RemoveFromRole(ddl_User.Text, ddl_role.Text);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}