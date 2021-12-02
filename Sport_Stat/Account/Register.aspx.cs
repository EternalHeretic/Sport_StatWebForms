using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Sport_Stat.Models;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Sport_Stat.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var userMgr = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            ApplicationDbContext context = new ApplicationDbContext();

            IdentityResult IdRoleResult;
            var roleStore = new RoleStore<IdentityRole>(context: context);
            var roleMgr = new RoleManager<IdentityRole>(store: roleStore);
            string RoleRegister = "User";
            if (!roleMgr.RoleExists(roleName: RoleRegister))
            {
                IdRoleResult = roleMgr.Create(role: new IdentityRole { Name = RoleRegister });
            }

            var appUser = new ApplicationUser()
            {
                UserName = UserName.Text,
                Email = Email.Text,
                PhoneNumber = PhoneNumber.Text
            };
            IdentityResult IdUserResult = userMgr.Create(user: appUser, password: Password.Text);

            var apUsr = userMgr.FindByEmail(email: appUser.Email);
            if (IdUserResult.Succeeded != false)
            { 
                if (!userMgr.IsInRole(userId: apUsr.Id, role: RoleRegister))
                {
                    // Дополнительные сведения о включении подтверждения учетной записи и сброса пароля см. на странице https://go.microsoft.com/fwlink/?LinkID=320771.
                    //string code = manager.GenerateEmailConfirmationToken(user.Id);
                    //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                    //manager.SendEmail(user.Id, "Подтверждение учетной записи", "Подтвердите вашу учетную запись, щелкнув <a href=\"" + callbackUrl + "\">здесь</a>.");
                    IdUserResult = userMgr.AddToRole(userId: userMgr.FindByEmail(appUser.Email).Id, role: RoleRegister);

                    signInManager.SignIn(user: appUser, isPersistent: false, rememberBrowser: false);
                    IdentityHelper.RedirectToReturnUrl(returnUrl: Request.QueryString["ReturnUrl"], response: Response);
                }
                else 
                {
                    ErrorMessage.Text = IdUserResult.Errors.FirstOrDefault();
                }
            }
        }
    }
}