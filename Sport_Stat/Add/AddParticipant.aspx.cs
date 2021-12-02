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
    public partial class AddParticipant : System.Web.UI.Page
    {
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
            //проверка на первичный ключ
            if ((Request["PK"] != null))
            {

            }
            else
            {
                Response.Redirect("~/Competition.aspx");
            }
        }

        protected void But_add_participant_Click(object sender, EventArgs e)
        {

        }

        protected void Btn_searh_participant_Click(object sender, EventArgs e)
        {

        }
        protected void Btn_ok_Click(object sender, EventArgs e)
        {
            string tableName = "Participants";
            string[] fieldlist = new string[] {
                "N_participant",
                "CompetitionId",
                "PeopleId"
            };

            

            //Random npartificant = new Random();

            //for (int ctr = 1; ctr <= 20; ctr++)
            //{
            //    npartificant.Next(1, 1000);
            //    if (ctr % 5 == 0);
            //}


            //for (int i = 0; i < 11; i++)
            //{
            //    string PeopleId = gv_add_participant.Rows[0].Cells[i].ToString();

            //}

            string data = "";
            foreach (GridViewRow row in gv_add_participant.Rows)
            {
                Random random = new Random();
                int a;
                a = random.Next(1000);
                int npartificant = a;

                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[1].FindControl("chkCtrl") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string PeopleId = row.Cells[0].Text;
                        int NPartificants = npartificant;
                        string[] valuelist = new string[]
                            {
                                "'" + NPartificants + "'",
                                "'" + Request["PK"] + "'",
                                "'" + PeopleId + "'"
                            };
                        Controllers.Combo.addNewRec(tableName, fieldlist, valuelist);
                        data = "";
                        
                    }
                }
            }
            

                
            
            Response.Redirect("~/Participant.aspx" + "?PK=" + Request["PK"]);


        }

        protected void Btn_cancle_Click(object sender, EventArgs e)
        {

        }

        protected void ChkCtrl_CheckedChanged(object sender, EventArgs e)
        {
            //string data = "";
            //foreach (GridViewRow row in gv_add_participant.Rows)
            //{
            //    if (row.RowType == DataControlRowType.DataRow)
            //    {
            //        CheckBox chkRow = (row.Cells[0].FindControl("chkCtrl") as CheckBox);
            //        if (chkRow.Checked)
            //        {
            //            string first_name = row.Cells[1].Text;
            //            string second_name = row.Cells[2].Text;
            //            string middle_name = row.Cells[3].Text;
            //            string brithday = row.Cells[4].Text;
            //            data = data + first_name + " ,  " + second_name + " , " + middle_name + " , " + brithday + "<br>";
            //        }
            //    }
            //}
            //lblmsg.Text = data;
        }

        protected void Search(object sender, EventArgs e)
        {
            this.BindGrid();
        }

        private void BindGrid()
        {
            //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            //SqlDataAdapter adapter = new SqlDataAdapter();
            //DataSet dt = new DataSet();
            //string DefaultConnection;
            //string tableName = "Peoples";
            //string[] fieldlist = new string[] {
            //        "first_name",
            //        "second_name",
            //        "middle_name",
            //        "birthday"
            //    };
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //using (SqlCommand cmd = new SqlCommand())
            //{
            // cmd.CommandText = "SELECT ContactName, City, Country FROM Customers WHERE ContactName LIKE '%' + @ContactName + '%'";
            // cmd.Connection = con;
            // cmd.Parameters.AddWithValue("@ContactName", txtSearch.Text.Trim());
            //DataTable dt = new DataTable();
            //using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            //{
            //adapter.Fill(dt);
            //gv_add_participant.DataSource = dt.Tables[tableName];
            //gv_add_participant.DataBind();
            //}
            //}
            //}
        }

        protected void Gv_add_participant_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    e.Row.Cells[0].Text = Regex.Replace(e.Row.Cells[0].Text, txtSearch.Text.Trim(), delegate(Match match)
            //    {
            //        return string.Format("<span style = 'background-color:#D9EDF7'>{0}</span>", match.Value);
            //    }, RegexOptions.IgnoreCase);
            //}
        }

        protected void Gv_add_participant_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //gvCustomers.PageIndex = e.NewPageIndex;
            //this.BindGrid();
        }
    }
}