using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.Admin
{
    public partial class EditBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            Page.MaintainScrollPositionOnPostBack = true;
            if (!IsPostBack)
            {
                ViewState["books"] = DB_Manager.getAllBooks();
                gv_books.DataSource = ViewState["books"];
                ddl_authors.DataSource = DB_Manager.getAllAuthors();
                ddl_authors.DataValueField = "id";
                ddl_authors.DataTextField = "Name";
                ddl_genres.DataSource = DB_Manager.getAllGenres();
                ddl_genres.DataValueField = "id";
                ddl_genres.DataTextField = "Name";
                DataBind();
            }
            else
                gv_books.DataSource = ViewState["books"];
        }
        protected void gv_books_RowCreated(object sender, GridViewRowEventArgs e)
        {
            /*    e.Row.Cells[5].Visible = false;
                e.Row.Cells[6].Visible = false;
                e.Row.Cells[7].Visible = false;*/
        }

        protected void btn_getAll_Click(object sender, EventArgs e)
        {
            ViewState["books"] = DB_Manager.getAllBooks();
            gv_books.DataSource = ViewState["books"];
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
                gv_books.DataSource = ViewState["books"];
                DataBind();
            }
            else if (rbl_category.SelectedValue == "Genres")
            {
                ViewState["books"] = DB_Manager.getBooksByGenre(int.Parse(ddl_category.SelectedValue));
                gv_books.DataSource = ViewState["books"];
                DataBind();
            }
        }

        protected void gv_books_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!cancelEditing.Visible)
            {
                addBook.Text = "Edit Book";
                cancelEditing.Visible = true;
            }
           var bk = ( ViewState["books"] as List<BookView>)[gv_books.SelectedRow.RowIndex];

            img_cover.ImageUrl = bk.image;

            txt_ISBN.Text = bk.ISBN;
            txt_title.Text = bk.title;
            txt_description.Text = bk.description;
            ddl_authors.SelectedValue = bk.authorId.ToString();
            ddl_genres.SelectedValue = bk.genreId.ToString();
            calendar.SelectedDate = bk.date.Value;

        }

        protected void cancelEditing_Click(object sender, EventArgs e)
        {
            addBook.Text = "Add Book";
            cancelEditing.Visible = false;
            img_cover.ImageUrl = "~/imgs/cover.png";

            txt_ISBN.Text = "";
            txt_title.Text = "";
            txt_description.Text = "";
            calendar.SelectedDate = DateTime.Now;
        }

        protected void addBook_Click(object sender, EventArgs e)
        {

            Book bk = new Book
            {
                ISBN = txt_ISBN.Text,
                title = txt_title.Text,
                authorId = int.Parse(ddl_authors.SelectedValue),
                genreId = int.Parse(ddl_genres.SelectedValue),
                date = calendar.SelectedDate,
                description = txt_description.Text
            };

            if (fileUpload.HasFile)
            {
                string img = "~/imgs/" + bk.ISBN + ".png";
                fileUpload.SaveAs(Server.MapPath(img));
                bk.image = img;
            }

                if (!cancelEditing.Visible)

                DB_Manager.addBook(bk);
            else
                DB_Manager.updateBook(bk);
            ViewState["books"] = DB_Manager.getAllBooks();
            gv_books.DataSource = ViewState["books"];
            DataBind();
            addBook.Text = "Add Book";
            cancelEditing.Visible = false;
            img_cover.ImageUrl = "~/imgs/cover.png";
            txt_ISBN.Text = "";
            txt_title.Text = "";
            txt_description.Text = "";
            calendar.SelectedDate = DateTime.Now;
        }

        protected void gv_books_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DB_Manager.deleteBook(gv_books.Rows[e.RowIndex].Cells[1].Text);
            ViewState["books"] = DB_Manager.getAllBooks();
            gv_books.DataSource = ViewState["books"];
            DataBind();
        }
    }
}