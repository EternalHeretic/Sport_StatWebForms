using System;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using Sport_Stat.Models;

namespace Sport_Stat
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Код, выполняемый при запуске приложения
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            //RoleActions roleActions = new RoleActions();
            //roleActions.AddUserAndRole();
        }
    }
}