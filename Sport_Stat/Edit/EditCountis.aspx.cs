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


namespace Sport_Stat.Edit
{
    public partial class EditCountis : System.Web.UI.Page
    {
        public static string tableName = "Countis";
        public static string[] fieldlist = new string[] {
                "name_county",
                "CountryId"
            };
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
                InitAllComboBox(1);
                InitData();
            }
            //проверка на первичный ключ
            if ((Request["id"] != null))
            {

            }
            else
            {
                Response.Redirect("~/County.aspx");
            }
        }
        protected void InitData()
        {
            if (Request["ID"] != null)
            {
                var id = Request["ID"].ToString();
                string whereValue = " CountyId = '" + Request["ID"].ToString() + "'";
                DataTable dt = Controllers.Combo.getDataFromTable(tableName, fieldlist, "", whereValue);
                for (var i = 0; i < dt.Rows.Count; i++)
                {
                    txt_county.Text = dt.Rows[i]["name_county"].ToString();

                    var countryid = dt.Rows[i]["countryid"].ToString();
                    cbo_Country.Text = countryid;
                }
            }
            else
            {
            }

        }


        protected void Cbo_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            InitAllComboBox(1);
        }

        protected void InitCombo(
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
                    InitEmptyItemIntoCombo(_curControlName);
            }
            else
                InitEmptyItemIntoCombo(_curControlName);
        }

        protected void InitEmptyItemIntoCombo(string _curControlName)
        {
            var curControl = FindControl(controlContent + _curControlName) as DropDownList;
            ListItem item;

            curControl.Enabled = false;
            item = new ListItem("данные отутствуют", "");
            curControl.Items.Add(item);
        }

        protected void InitAllComboBox(Int32 idx)
        {
            if (idx >= 1)
                InitCombo(
                            "cbo_Country",
                            "",
                            "Country",
                            new string[] { "CountryId", "country_name" },
                            new string[] { "country_name" });

        }

        //Кнопка изменнеия Людей в бд
        protected void But_add_county_Click(object sender, EventArgs e)
        {
            string[] valuelist = new string[] {
                "'" + txt_county.Text + "'",
                "'" + cbo_Country.Text + "'",
            };

            string whereValue = " CountyId = '" + Request["ID"].ToString() + "'";

            Controllers.Combo.editRec(tableName, fieldlist, valuelist, whereValue);
            Response.Redirect("/County.aspx");
        }
    }
}