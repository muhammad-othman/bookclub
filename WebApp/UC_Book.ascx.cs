using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class UC_Book : System.Web.UI.UserControl
    {
        private string _isbn;
        private string user = HttpContext.Current.User.Identity.Name;

        public string isbn
        {
            get { return _isbn; }
            set
            {
                _isbn = value;
                lbl_isbn.Text = value;
                BookView b = DB_Manager.getBookViewByISBN(value);
                img_cover.ImageUrl = b.image;
                lbl_NumofLikes.Text = b.NumOfLikes.ToString();
                lbl_Genre.Text = b.Genre;
                lbl_Date.Text = b.date.Value.ToString("d MMMM yyyy");
                lbl_Author.Text = b.Author;
                lbl_Title.Text = b.title;
                HyperLink1.NavigateUrl = "~/Reviews?ISBN=" + isbn;
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            if (DB_Manager.bookIsLiked(lbl_isbn.Text, user))
                DB_Manager.dislikeBook(lbl_isbn.Text, user);
            else
                DB_Manager.likeBook(lbl_isbn.Text, user);
     
        }

        protected void img_Like_PreRender(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated && _isbn != null)
            {
                if (DB_Manager.bookIsLiked(_isbn, user))
                    img_Like.ImageUrl = "~/imgs/liked.png";
                else
                    img_Like.ImageUrl = "~/imgs/like.png";
                lbl_NumofLikes.Text = DB_Manager.getBookViewByISBN(_isbn).NumOfLikes.ToString();
            }
            else
                img_Like.Visible = false;
        }
    }
}