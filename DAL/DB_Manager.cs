using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public static class DB_Manager
    {
        public static List<BookView> getAllBooks()
        {
            List<BookView> books;
            using (BookClub_Entities db = new BookClub_Entities())
            {
                books = db.BookViews.ToList();
            }
            return books;
        }
        public static List<BookView> getAllLikedBooks(string userName)
        {
            List<BookView> booksV = new List<BookView>();
            using (BookClub_Entities db = new BookClub_Entities())
            {
                var books = db.AspNetUsers.Where(u => u.UserName == userName).FirstOrDefault().Books;
                foreach (var item in books)
                {
                    var m = db.BookViews.Where(b => b.ISBN == item.ISBN).FirstOrDefault();
                    if(m!=null)
                     booksV.Add(m);
                }
            }
            return booksV;
        }

        public static List<Genre> getAllGenres()
        {
            List<Genre> genre;
            using (BookClub_Entities db = new BookClub_Entities())
            {
                genre = db.Genres.ToList();
            }
            return genre;
        }

       

        public static List<Author> getAllAuthors()
        {
            List<Author> author;
            using (BookClub_Entities db = new BookClub_Entities())
            {
                author = db.Authors.ToList();
            }
            return author;
        }
        public static List<BookView> getBooksByGenre(int genreId)
        {
            List<BookView> books;
            using (BookClub_Entities db = new BookClub_Entities())
            {
                books = db.BookViews.Where(b=>b.genreId == genreId).ToList();
            }
            return books;
        }
        public static List<BookView> getBooksByAuthor(int authorId)
        {
            List<BookView> books;
            using (BookClub_Entities db = new BookClub_Entities())
            {
                books = db.BookViews.Where(b => b.authorId == authorId).ToList();
            }
            return books;
        }
        public static Book getBookByISBN(string ISBN)
        {
            Book book;
            using (BookClub_Entities db = new BookClub_Entities())
            {
                book = db.Books.Where(b => b.ISBN == ISBN).FirstOrDefault();
            }
            return book;
        }
        public static AspNetUser getUserByName(string userName)
        {
            AspNetUser user;
            using (BookClub_Entities db = new BookClub_Entities())
            {
                user = db.AspNetUsers.Where(b => b.UserName == userName).FirstOrDefault();
            }
           
            return user;
        }
        public static BookView getBookViewByISBN(string ISBN)
        {
            BookView book;
            using (BookClub_Entities db = new BookClub_Entities())
            {
                book = db.BookViews.Where(b => b.ISBN == ISBN).FirstOrDefault();
            }
            return book;
        }
        public static List<ReviewView> getReviews(string ISBN)
        {
            List<ReviewView> reviews;
            using (BookClub_Entities db = new BookClub_Entities())
            {
                reviews = db.ReviewViews.Where(b => b.bookId == ISBN).ToList();
            }
            return reviews;
        }
        public static void addReview(Review r)
        {
            using (BookClub_Entities db = new BookClub_Entities())
            {
                db.Reviews.Add(r);
                db.SaveChanges();
            }
        }
        public static void likeBook(string ISBN, string userName)
        {
            using (BookClub_Entities db = new BookClub_Entities())
            {
                db.Books.Where(b => b.ISBN == ISBN).FirstOrDefault().aspnet_UsersLikes.
                    Add(db.AspNetUsers.Where(u => u.UserName == userName).FirstOrDefault());
                db.SaveChanges();
            }
        }
        public static void dislikeBook(string ISBN, string userName)
        {
            using (BookClub_Entities db = new BookClub_Entities())
            {
                db.Books.Where(b => b.ISBN == ISBN).FirstOrDefault().aspnet_UsersLikes.
                    Remove(db.AspNetUsers.Where(u => u.UserName == userName).FirstOrDefault());
                db.SaveChanges();
            }
        }
        public static bool bookIsLiked(string ISBN, string userName)
        {
            bool liked = false;
            using (BookClub_Entities db = new BookClub_Entities())
            {
                if (db.Books.Where(b => b.ISBN == ISBN).FirstOrDefault().aspnet_UsersLikes
                      .FirstOrDefault(u => u.UserName == userName) != null)
                    liked = true;
                db.SaveChanges();
            }
            return liked;
        }
        public static void likeReview(int reviewId, string userName)
        {
            using (BookClub_Entities db = new BookClub_Entities())
            {
                db.Reviews.Where(b => b.id == reviewId).FirstOrDefault().UsersLikes.
                    Add(db.AspNetUsers.Where(u => u.UserName == userName).FirstOrDefault());
                db.SaveChanges();
            }
        }
        public static void dislikeReview(int reviewId, string userName)
        {
            using (BookClub_Entities db = new BookClub_Entities())
            {
                db.Reviews.Where(b => b.id == reviewId).FirstOrDefault().UsersLikes.
                    Remove(db.AspNetUsers.Where(u => u.UserName == userName).FirstOrDefault());
                db.SaveChanges();
            }
        }
        public static bool ReviewIsLiked(int reviewId, string userName)
        {
            bool liked = false;
            using (BookClub_Entities db = new BookClub_Entities())
            {
                if (db.Reviews.Where(b => b.id == reviewId).FirstOrDefault().UsersLikes
                      .FirstOrDefault(u => u.UserName == userName) != null)
                    liked = true;
                db.SaveChanges();
            }
            return liked;
        }

        public static void addBook(Book b)
        {
            using (BookClub_Entities db = new BookClub_Entities())
            {
                db.Books.Add(b);
                db.SaveChanges();
            }
        }
        public static void addAuthor(Author a)
        {
            using (BookClub_Entities db = new BookClub_Entities())
            {
                db.Authors.Add(a);
                db.SaveChanges();
            }
        }
        public static void addGenre(Genre g)
        {
            using (BookClub_Entities db = new BookClub_Entities())
            {
                db.Genres.Add(g);
                db.SaveChanges();
            }
        }
        public static void updateBook(Book book)
        {
            using (BookClub_Entities db = new BookClub_Entities())
            {
               var oldBook = db.Books.Where(b => b.ISBN == book.ISBN).FirstOrDefault();
                if(oldBook != null) { 
                oldBook.title = book.title;
                oldBook.image = book.image;
                oldBook.genreId = book.genreId;
                oldBook.authorId = book.authorId;
                oldBook.description = book.description;
                oldBook.date = book.date;
                db.SaveChanges();
                }
            }
        }
        public static void deleteBook(string ISBN)
        {
            using (BookClub_Entities db = new BookClub_Entities())
            {
                db.Books.Remove(db.Books.Where(b => b.ISBN == ISBN).FirstOrDefault());
                db.SaveChanges();
            }
        }
        public static void updateGenre(Genre genre)
        {
            using (BookClub_Entities db = new BookClub_Entities())
            {
                var oldGenre = db.Genres.Where(g => g.id == genre.id).FirstOrDefault();
                oldGenre.Name = genre.Name;
                oldGenre.description = genre.description;
                db.SaveChanges();
            }
        }
        public static void updateAuthor(Author author)
        {
            using (BookClub_Entities db = new BookClub_Entities())
            {
                var oldAuthor = db.Authors.Where(a => a.id == author.id).FirstOrDefault();
                oldAuthor.Name = author.Name;
                oldAuthor.description = author.description;
                db.SaveChanges();
            }
        }
        public static void deleteGenre(int id)
        {
            using (BookClub_Entities db = new BookClub_Entities())
            {
                db.Genres.Remove(db.Genres.Where(g => g.id == id).FirstOrDefault());
                db.SaveChanges();
            }
        }
        public static void deleteAuthor(int id)
        {
            using (BookClub_Entities db = new BookClub_Entities())
            {
                db.Authors.Remove(db.Authors.Where(g => g.id == id).FirstOrDefault());
                db.SaveChanges();
            }
        }

    }
}
