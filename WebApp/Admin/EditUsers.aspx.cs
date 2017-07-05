using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.Admin
{
    public partial class EditUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addRole_Click(object sender, EventArgs e)
        {
            Roles.CreateRole(roleName.Text);
            roleName.Text = "";
            Page.DataBind();
        }

        protected void roles_SelectedIndexChanged(object sender, EventArgs e)
        {
            Roles.DeleteRole(roles.SelectedRow.Cells[1].Text);
            Page.DataBind();

        }

        protected void gvUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try { 
            Roles.AddUserToRole(dropdownUsers.SelectedValue, dropdownRoles.SelectedValue);
            Page.DataBind();
            }
            catch (Exception x) { }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try { 
            Roles.RemoveUserFromRole(dropdownUsers.SelectedValue, dropdownRoles.SelectedValue);
            Page.DataBind();
            }
            catch (Exception x) { }
        }

        protected void Label1_PreRender(object sender, EventArgs e)
        {
            try { 
           var usersinrole =  Roles.GetUsersInRole((sender as Label).Text);
            (sender as Label).Text = "";
            if (usersinrole.Length > 0)
            {
                foreach (var item in usersinrole)
                (sender as Label).Text += item + " / ";
            (sender as Label).Text = (sender as Label).Text.Remove((sender as Label).Text.Length - 2);
            }
            }catch(Exception x) { }
        }
    }
}