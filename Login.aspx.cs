using System;

namespace QuickKart10Min
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string user = txtUser.Text.Trim();
            string password = txtPassword.Text;

            if (user.Length == 0 || password.Length == 0)
            {
                lblMessage.Text = "Please enter username and password.";
                return;
            }

            Session["User"] = user;
            Response.Redirect("Default.aspx");
        }
    }
}
