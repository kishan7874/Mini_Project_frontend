using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using QuickKart10Min.Models;

namespace QuickKart10Min
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProducts();
            }
        }

        protected void FilterChanged(object sender, EventArgs e)
        {
            BindProducts();
        }

        private void BindProducts()
        {
            string q = Request.QueryString["q"];
            var list = ProductRepository.All.AsEnumerable();

            if (!string.IsNullOrWhiteSpace(q))
            {
                var category = ProductRepository.All
                    .Select(p => p.Category)
                    .FirstOrDefault(c => string.Equals(c, q, StringComparison.OrdinalIgnoreCase));

                if (!string.IsNullOrEmpty(category))
                    list = list.Where(p => p.Category == category);
                else
                    list = list.Where(p =>
                        p.Name.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0 ||
                        p.Category.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0);
            }

            if (!string.IsNullOrEmpty(ddlCategory.SelectedValue))
                list = list.Where(p => p.Category == ddlCategory.SelectedValue);

            var data = list.ToList();
            rptProducts.DataSource = data;
            rptProducts.DataBind();
            lblResults.Text = data.Count + " products";

            var requestedCategory = data.Select(p => p.Category).Distinct().SingleOrDefault();
            if (!string.IsNullOrEmpty(requestedCategory) && ddlCategory.Items.FindByValue(requestedCategory) != null && string.IsNullOrWhiteSpace(q))
                ddlCategory.SelectedValue = requestedCategory;
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
