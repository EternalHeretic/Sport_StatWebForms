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

namespace Sport_Stat
{
    public partial class UserPeople : System.Web.UI.Page
    {
        public static string controlContent = "ctl00$FeaturedContent$";
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
            //подгрузка данных
            if (!IsPostBack)
            {
                InitAllComboBox(2);
                initData();
                initData1();
            }
        }


        protected void InitAllComboBox(Int32 idx)
        {
            if (idx >= 2)
                initCombo(
                            "ddl_Login",
                            "",
                            "AspNetUsers",
                            new string[] { "Id", "UserName" },
                            new string[] { "UserName" });
            if (idx >= 1)
                initCombo(
                            "ddl_name",
                            "",
                            "Peoples",
                            new string[] { "PeopleId", "second_name"},
                            new string[] { "second_name" });
        }

        protected void initData()
        {
            if (ddl_Login != null)
            {
                string tableName = "AspNetUsers";
                string idl = ddl_Login.Text;
                string whereValue = " Id = '" + idl.ToString() + "'";
                string[] fieldlist = new string[] {
                    "Id",
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
                DataTable dt = Controllers.Combo.getDataFromTable(tableName, fieldlist, "", whereValue);
                for (var i = 0; i < dt.Rows.Count; i++)
                {
                    lbl_Email.Text = dt.Rows[i]["Email"].ToString();
                    lbl_phone_number_user.Text = dt.Rows[i]["PhoneNumber"].ToString();
                    EmailConfirmed.Text = dt.Rows[i]["EmailConfirmed"].ToString();
                    PasswordHash.Text = dt.Rows[i]["PasswordHash"].ToString();
                    SecurityStamp.Text = dt.Rows[i]["SecurityStamp"].ToString();
                    PhoneNumberConfirmed.Text = dt.Rows[i]["PhoneNumberConfirmed"].ToString();
                    TwoFactorEnabled.Text = dt.Rows[i]["TwoFactorEnabled"].ToString();
                    LockoutEndDateUtc.Text = dt.Rows[i]["LockoutEndDateUtc"].ToString();
                    LockoutEnabled.Text = dt.Rows[i]["LockoutEnabled"].ToString();
                    AccessFailedCount.Text = dt.Rows[i]["AccessFailedCount"].ToString();
                    UserName.Text = dt.Rows[i]["UserName"].ToString();
                    PeopleId.Text = dt.Rows[i]["PeopleId"].ToString();
                }
            }
            else
            {
            }

        }

        protected void initData1()
        {
            if (ddl_name != null)
            {
                string tableName = "Peoples";
                string id = ddl_name.Text;
                string whereValue = " PeopleId = '" + id.ToString() + "'";
                string[] fieldlist = new string[] {
                    "first_name",
                    "second_name",
                    "middle_name",
                    "N_phone",
                    "birthday"
                };
                DataTable dt = Controllers.Combo.getDataFromTable(tableName, fieldlist, "", whereValue);
                for (var i = 0; i < dt.Rows.Count; i++)
                {
                    lbl_second_name.Text = dt.Rows[i]["first_name"].ToString();
                    lbl_middle_name.Text = dt.Rows[i]["middle_name"].ToString();
                    lbl_phone_number_people.Text = dt.Rows[i]["N_phone"].ToString();
                    lbl_birthday.Text = dt.Rows[i]["birthday"].ToString();
                    PeopleID_User.Text = id;
                }
            }
            else
            {
            }

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

        protected void btn_add_userpeople_Click(object sender, EventArgs e)
        {
            string tableName = "AspNetUsers";
            string[] fieldlist = new string[] {
                "Id",
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
            string whereValue = " Id = '" + ddl_Login.Text + "'";
            string[] valuelist = new string[] {
                "'" + ddl_Login.Text + "'",
                "'" + lbl_Email.Text + "'",
                "'" + EmailConfirmed.Text + "'",
                "'" + PasswordHash.Text + "'",
                "'" + SecurityStamp.Text + "'",
                "'" + lbl_phone_number_user.Text + "'",
                "'" + PhoneNumberConfirmed.Text + "'",
                "'" + TwoFactorEnabled.Text + "'",
                "'" + LockoutEndDateUtc.Text + "'",
                "'" + LockoutEnabled.Text + "'",
                "'" + AccessFailedCount.Text + "'",
                "'" + UserName.Text + "'",
                "'" + PeopleID_User.Text + "'"
            };

            Combo.editRec(tableName, fieldlist, valuelist, whereValue);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void ddl_name_SelectedIndexChanged(object sender, EventArgs e)
        {
            initData1();
            
            
        }

        protected void ddl_Login_SelectedIndexChanged(object sender, EventArgs e)
        {
            initData();
        }
    }
}