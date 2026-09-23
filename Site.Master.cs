using System;
using System.Collections.Generic;
using System.Web.UI;
using QuickKart10Min.Models;

namespace QuickKart10Min
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateCartCount();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string q = txtSearch.Text.Trim();
            Response.Redirect("Products.aspx" + (q.Length > 0 ? "?q=" + Server.UrlEncode(q) : ""));
        }

        public void UpdateCartCount()
        {
            var cart = Session["Cart"] as List<CartItem>;
            int count = 0;

            if (cart != null)
            {
                foreach (var item in cart)
                {
                    if (item != null && item.Quantity > 0)
                        count += item.Quantity;
                }
            }

            litCartCount.Text = count.ToString();
        }
    }
}
