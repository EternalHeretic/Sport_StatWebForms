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
    public partial class AddRegion : System.Web.UI.Page
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
                initAllComboBox(2);
            }
        }
        protected void cbo_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            initAllComboBox(1);
        }

        //"обработчик" пустых комбо боксов
        protected void initEmptyItemIntoCombo(string _curControlName)
        {
            var curControl = FindControl(controlContent + _curControlName) as DropDownList;
            ListItem item;

            curControl.Enabled = false;
            item = new ListItem("данные отутствуют", "");
            curControl.Items.Add(item);
        }

        //инициализация "наших" комбо боксов
        protected void initAllComboBox(Int32 idx)
        {
            if (idx >= 2)
                initCombo(
                            "cbo_Country",
                            "",
                            "Country",
                            new string[] { "CountryId", "country_name" },
                            new string[] { "country_name" });
            if (idx >= 1)
                initCombo(
                            "cbo_Countis",
                            "cbo_Country",
                            "Countis",
                            new string[] { "CountyId", "name_county" },
                            new string[] { "name_county" },
                            "CountryId");
        }

        //иневирсальный инициализатор комбо боксов
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

        protected void but_add_region_Click(object sender, EventArgs e)
        {
            string tableName = "Regions";
            string[] fieldlist = new string[] {
                "region_name",
                "CountyId"
            };

            string[] valuelist = new string[] {
                "'" + txt_region.Text + "'",
                "'" + cbo_Countis.Text + "'"
            };

            Controllers.Combo.addNewRec(tableName, fieldlist, valuelist);
            Response.Redirect("/Region.aspx");
        }
    }
}