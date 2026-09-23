using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using QuickKart10Min.Models;

namespace QuickKart10Min
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptPopular.DataSource = ProductRepository.All.Where(p => p.Popular).ToList();
                rptPopular.DataBind();
            }
        }

        protected void AddToCart_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            var product = ProductRepository.Get(id);
            if (product == null) return;

            var cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();
            var item = cart.FirstOrDefault(x => x.Product != null && x.Product.Id == id);
            if (item == null)
                cart.Add(new CartItem { Product = product, Quantity = 1 });
            else
                item.Quantity++;

            Session["Cart"] = cart;
            var master = Master as SiteMaster;
            if (master != null) master.UpdateCartCount();
        }
    }
}
