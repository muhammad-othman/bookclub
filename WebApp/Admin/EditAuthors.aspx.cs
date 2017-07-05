using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.Admin
{
    public partial class EditAuthors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindAuthors();
            }
        }

        void bindAuthors()
        {
            gv_Authors.DataSource = DB_Manager.getAllAuthors();
            DataBind();
        }

        protected void gv_Authors_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DB_Manager.deleteAuthor(int.Parse(gv_Authors.Rows[e.RowIndex].Cells[2].Text));
            bindAuthors();
        }
        protected void addAuthor_Click(object sender, EventArgs e)
        {
            if (!cancelEditing.Visible)
            {
                DB_Manager.addAuthor(new Author { Name = AuthorName.Text, description = description.Text });
            }
            else
            {
                DB_Manager.updateAuthor(new Author { id = int.Parse(gv_Authors.SelectedRow.Cells[2].Text), Name = AuthorName.Text, description = description.Text });

            }
            bindAuthors();
            addAuthor.Text = "Add Author";
            cancelEditing.Visible = false;
            AuthorName.Text = "";
            description.Text = "";

        }

        protected void gv_Authors_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!cancelEditing.Visible)
            {
                addAuthor.Text = "Edit Author";
                cancelEditing.Visible = true;
            }
            AuthorName.Text = gv_Authors.SelectedRow.Cells[3].Text;
            description.Text = gv_Authors.SelectedRow.Cells[4].Text;
        }

        protected void cancelEditing_Click(object sender, EventArgs e)
        {
            addAuthor.Text = "Add Author";
            cancelEditing.Visible = false;
            AuthorName.Text = "";
            description.Text = "";
        }

    }
}