using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Likes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListView1.DataSource = DB_Manager.getAllLikedBooks(HttpContext.Current.User.Identity.Name);
            DataBind();
        }
    }
}