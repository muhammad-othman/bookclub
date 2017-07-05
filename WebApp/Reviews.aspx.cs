using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Reviews : System.Web.UI.Page
    {
        Book book = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            var q = (string)Request.QueryString["ISBN"];
            if (q != null) { 
                UC_Book.isbn = q;
                book=DB_Manager.getBookByISBN(q);
                lbl_description.Text = book.description;
                var r = DB_Manager.getReviews((string)Request.QueryString["ISBN"]);
                r.Reverse();
                ListView1.DataSource = r;
                DataBind();
            }
        }

        protected void submitReview_Click(object sender, EventArgs e)
        {

            var txt_Review = loginView1.FindControl("txt_Review") as TextBox;
            var txt_HeadLine = loginView1.FindControl("txt_HeadLine") as TextBox;

            DB_Manager.addReview(
          new Review
          {
              bookId = (string)Request.QueryString["ISBN"],
              details = txt_Review.Text,
              headLine = txt_HeadLine.Text,
              userId = DB_Manager.getUserByName(HttpContext.Current.User.Identity.Name).Id
          });
            txt_HeadLine.Text = txt_Review.Text = "";
            var r = DB_Manager.getReviews((string)Request.QueryString["ISBN"]);
            r.Reverse();
            ListView1.DataSource =r ;
            DataBind();
        }
    }
}