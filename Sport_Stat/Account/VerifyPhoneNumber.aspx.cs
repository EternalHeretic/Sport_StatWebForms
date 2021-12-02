using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Sport_Stat.Models;

namespace Sport_Stat.Account
{
    public partial class VerifyPhoneNumber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            Models.ApplicationDbContext context = new ApplicationDbContext();
            var roleStore = new RoleStore<IdentityRole>(context);
            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            if (Context.User.IsInRole("User"))
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var phonenumber = Request.QueryString["PhoneNumber"];
                var code = manager.GenerateChangePhoneNumberToken(User.Identity.GetUserId(), phonenumber);           
                PhoneNumber.Value = phonenumber;
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx");
            }

        }


        protected void Code_Click(object sender, EventArgs e)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "Неправильный код");
                return;
            }

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();

            var result = manager.ChangePhoneNumber(User.Identity.GetUserId(), PhoneNumber.Value, Code.Text);

            if (result.Succeeded)
            {
                var user = manager.FindById(User.Identity.GetUserId());

                if (user != null)
                {
                    signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                    Response.Redirect("/Account/Manage?m=AddPhoneNumberSuccess");
                }
            }

            // Это сообщение означает наличие ошибки; повторное отображение формы
            ModelState.AddModelError("", "Не удалось проверить телефон");
        }
    }
}