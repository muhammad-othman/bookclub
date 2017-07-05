using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.Admin
{
    public partial class EditGenres : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindGenres();
            }
        }

        void bindGenres()
        {
            gv_genres.DataSource = DB_Manager.getAllGenres();
            DataBind();
        }

        protected void gv_genres_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DB_Manager.deleteGenre(int.Parse(gv_genres.Rows[e.RowIndex].Cells[2].Text));
            bindGenres();
        }
        protected void addGenre_Click(object sender, EventArgs e)
        {
            if (!cancelEditing.Visible)
            {
                DB_Manager.addGenre(new Genre { Name = genreName.Text, description = description.Text });
            }
            else
            {
                DB_Manager.updateGenre(new Genre {id = int.Parse(gv_genres.SelectedRow.Cells[2].Text)  ,Name = genreName.Text, description = description.Text });

            }
            bindGenres();
            addGenre.Text = "Add Genre";
            cancelEditing.Visible = false;
            genreName.Text = "";
            description.Text = "";

        }

        protected void gv_genres_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!cancelEditing.Visible)
            {
                addGenre.Text = "Edit Genre";
                cancelEditing.Visible = true;
            }
            genreName.Text = gv_genres.SelectedRow.Cells[3].Text;
            description.Text = gv_genres.SelectedRow.Cells[4].Text;
        }

        protected void cancelEditing_Click(object sender, EventArgs e)
        {
            addGenre.Text = "Add Genre";
            cancelEditing.Visible = false;
            genreName.Text = "";
            description.Text = "";
        }
    }
}