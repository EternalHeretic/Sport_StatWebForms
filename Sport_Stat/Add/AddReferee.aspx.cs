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
using System.Threading;

namespace Sport_Stat.Add
{
    public partial class AddReferee : System.Web.UI.Page
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
                InitAllComboBox(4);
            }

        }

        protected void InitAllComboBox(Int32 idx)
        {
            if (idx >= 4)
                initCombo(
                            "Competition",
                            "",
                            "Competitions",
                            new string[] { "CompetitionId", "competition_name" },
                            new string[] { "competition_name" });
            if (idx >= 3)
                initCombo(
                            "Day",
                            "",
                            "Days",
                            new string[] { "DayId", "N_day" },
                            new string[] { "N_day" });
            if (idx >= 2)
                initCombo(
                            "Shell",
                            "",
                            "Shells",
                            new string[] { "ShellId", "shell_name" },
                            new string[] { "shell_name" });
            if (idx >= 1)
                initCombo(
                            "People",
                            "",
                            "Peoples",
                            new string[] { "PeopleId", "second_name", "first_name", "middle_name" },
                            new string[] {  "second_name", "first_name", "middle_name" });
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

        protected void RefereeAdd()
        {
            string tableName = "Referee";
            string[] fieldlist = new string[] {
                "PeopleId",
                "DayId",
                "CompetitionId",
            };

            string[] valuelist = new string[] {
                "'" + People.Text + "'",
                "'" + Day.Text + "'",
                "'" + Competition.Text + "'"
            };

            Combo.addNewRec(tableName, fieldlist, valuelist);
        }

        public class Person {
            public string RefereeId { get; set; }
        }
        protected void Ref_ShellAdd() {
            string tableName1 = "Referee_Shell";
            string[] fieldlist1 = new string[] {
            "RefereeId",
            "ShellId"
            };
            
           

            Person RefereeId = new Person();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings[Combo.conStr].ConnectionString))
            {
                string oString = "SELECT RefereeId FROM Referee WHERE ([PeopleId] LIKE '" + People.Text + "'AND [DayId] LIKE '" + Day.Text + "'AND [CompetitionId] LIKE + '" + Competition.Text + "');";
                SqlCommand oCmd = new SqlCommand(oString, con);
                con.Open();
                using (SqlDataReader oReader = oCmd.ExecuteReader())
                {
                    while (oReader.Read())
                    {
                        RefereeId.RefereeId = oReader["RefereeId"].ToString();
                    }
                    con.Close();
                }
            }

            string RefId = RefereeId.RefereeId;

            string[] valuelist1 = new string[] {
            "'" + RefId + "'",
            "'" + Shell.Text + "'"
            };
            
            Combo.addNewRec(tableName1, fieldlist1, valuelist1);
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            RefereeAdd();

            if (People != null)
            { 
                Thread.Sleep(100);
                Ref_ShellAdd();
            }
            //Response.Redirect("/People.aspx");
        }

        protected void Competition_SelectedIndexChanged(object sender, EventArgs e)
        {
            InitAllComboBox(3);
        }

        protected void Day_SelectedIndexChanged(object sender, EventArgs e)
        {
            InitAllComboBox(2);
        }

        protected void Shell_SelectedIndexChanged(object sender, EventArgs e)
        {
            InitAllComboBox(1);
        }

        protected void People_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}