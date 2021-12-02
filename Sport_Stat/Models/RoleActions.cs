using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Sport_Stat.Models
{
    internal class RoleActions
    {
        internal void AddUserAndRole()
        {
            // Откройте контекст приложения и создайте переменные результата.
            Models.ApplicationDbContext context = new ApplicationDbContext();
            IdentityResult IdRoleResult;
            IdentityResult IdUserResult;

            // Создаем объект RoleStore с помощью объекта ApplicationDbContext.
            // В RoleStore разрешено содержать объекты IdentityRole.
            var roleStore = new RoleStore<IdentityRole>(context);

            // Создаем объект RoleManager, которому разрешено содержать объекты IdentityRole.
            // При создании объекта RoleManager вы передаете (в качестве параметра) новый объект RoleStore.
            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            // Затем вы создаете роль «canEdit», если она еще не существует.
            if (!roleMgr.RoleExists("Test"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "Test" });
            }

            // Создаем объект UserManager на основе объекта UserStore и ApplicationDbContext
            // объект. Обратите внимание, что вы можете создавать новые объекты и использовать их в качестве параметров в
            // одна строка кода, а не использование нескольких строк кода, как вы это делали
            // для объекта RoleManager.
            var userMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            var appUser = new ApplicationUser
            {
                UserName = "test@test.ru",
                Email = "test@test.ru"
            };
            IdUserResult = userMgr.Create(appUser, "Pa$$word1");

            // Если новый пользователь «canEdit» был успешно создан,
            // добавим пользователя canEdit к роли «canEdit».
            if (!userMgr.IsInRole(userMgr.FindByEmail("test@test.ru").Id, "Test"))
            {
                IdUserResult = userMgr.AddToRole(userMgr.FindByEmail("test@test.ru").Id, "Test");
            }
        }
    }
}