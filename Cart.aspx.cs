using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using QuickKart10Min.Models;

namespace QuickKart10Min
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindCart();
        }

        private void BindCart()
        {
            var cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();
            pnlEmpty.Visible = cart.Count == 0;
            pnlCart.Visible = cart.Count > 0;
            rptCart.DataSource = cart;
            rptCart.DataBind();

            decimal total = cart.Sum(x => x.Total);
            litSubtotal.Text = total.ToString("0");
            litTotal.Text = total.ToString("0");

            var master = Master as SiteMaster;
            if (master != null) master.UpdateCartCount();
        }

        protected void Quantity_Command(object sender, CommandEventArgs e)
        {
            var cart = Session["Cart"] as List<CartItem>;
            if (cart == null) return;

            int id = Convert.ToInt32(e.CommandArgument);
            var item = cart.FirstOrDefault(x => x.Product != null && x.Product.Id == id);
            if (item == null) return;

            if (e.CommandName == "plus")
                item.Quantity++;
            else
                item.Quantity--;

            if (item.Quantity <= 0)
                cart.Remove(item);

            Session["Cart"] = cart;
            BindCart();
        }
    }
}
