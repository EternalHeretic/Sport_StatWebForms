using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Sport_Stat.Startup))]
namespace Sport_Stat
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
