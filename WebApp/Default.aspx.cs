using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["books"] = DB_Manager.getAllBooks();
                ListView1.DataSource = ViewState["books"];
                DataBind();
            }
            else { 
                ListView1.DataSource = ViewState["books"];
                DataBind();
            }
        }
        protected void btn_getAll_Click(object sender, EventArgs e)
        {
            ViewState["books"] = DB_Manager.getAllBooks();
            ListView1.DataSource = ViewState["books"];
            DataBind();
        }

        protected void rbl_category_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbl_category.SelectedValue == "Authors")
            {
                ddl_category.DataSource = DB_Manager.getAllAuthors();
                ddl_category.DataValueField = "id";
                ddl_category.DataTextField = "Name";
                DataBind();
            }
            else if (rbl_category.SelectedValue == "Genres")
            {
                ddl_category.DataSource = DB_Manager.getAllGenres();
                ddl_category.DataValueField = "id";
                ddl_category.DataTextField = "Name";
                DataBind();
            }
        }

        protected void btn_filter_Click(object sender, EventArgs e)
        {
            if (rbl_category.SelectedValue == "Authors")
            {
                ViewState["books"] = DB_Manager.getBooksByAuthor(int.Parse(ddl_category.SelectedValue));
                ListView1.DataSource = ViewState["books"];
                DataBind();
            }
            else if (rbl_category.SelectedValue == "Genres")
            {
                ViewState["books"] = DB_Manager.getBooksByGenre(int.Parse(ddl_category.SelectedValue));
                ListView1.DataSource = ViewState["books"];
                DataBind();
            }
        }
    }
}