using System;

namespace QuickKart10Min
{
    public partial class OrderSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string orderId = Convert.ToString(Session["LastOrderId"]);
            string name = Convert.ToString(Session["LastOrderName"]);

            if (string.IsNullOrWhiteSpace(orderId))
            {
                Response.Redirect("Products.aspx");
                return;
            }

            litOrder.Text = Server.HtmlEncode(orderId);
            litName.Text = Server.HtmlEncode(name);
        }
    }
}
