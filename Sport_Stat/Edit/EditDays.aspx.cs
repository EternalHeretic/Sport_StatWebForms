﻿using System;
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
    public partial class EditDays : System.Web.UI.Page
    {
        public static string tableName = "Days";
        public static string[] fieldlist = new string[] {
                "N_day"
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
                initData();
            }
            //проверка на первичный ключ
            if ((Request["id"] != null))
            {

            }
            else
            {
                Response.Redirect("~/Day.aspx");
            }
        }
        protected void initData()
        {
            if (Request["ID"] != null)
            {
                var id = Request["ID"].ToString();
                string whereValue = " DayId = '" + Request["ID"].ToString() + "'";
                DataTable dt = Controllers.Combo.getDataFromTable(tableName, fieldlist, "", whereValue);
                for (var i = 0; i < dt.Rows.Count; i++)
                {
                    txt_day.Text = dt.Rows[i]["N_day"].ToString();
                }
            }
            else
            {
            }

        }
        //Кнопка изменнеия Людей в бд
        protected void but_add_day_Click(object sender, EventArgs e)
        {
            string[] valuelist = new string[] {
                "'" + txt_day.Text + "'"
            };

            string whereValue = " DayId = '" + Request["ID"].ToString() + "'";

            Controllers.Combo.editRec(tableName, fieldlist, valuelist, whereValue);
            Response.Redirect("/Day.aspx");
        }
    }
}