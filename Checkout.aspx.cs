using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using QuickKart10Min.Models;

namespace QuickKart10Min
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindSummary();
        }

        private void BindSummary()
        {
            var cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();
            if (cart.Count == 0)
            {
                Response.Redirect("Products.aspx");
                return;
            }

            rptSummary.DataSource = cart;
            rptSummary.DataBind();
            litTotal.Text = cart.Sum(x => x.Total).ToString("0");
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            lblError.Text = "";

            string name = txtName.Text.Trim();
            string mobile = txtMobile.Text.Trim();
            string address = txtAddress.Text.Trim();

            if (name.Length < 2 || mobile.Length == 0 || address.Length < 8)
            {
                lblError.Text = "Please enter your name, a valid mobile number and a complete address.";
                return;
            }

            if (!Regex.IsMatch(mobile, @"^[0-9]{10}$"))
            {
                lblError.Text = "Please enter a valid 10-digit mobile number.";
                return;
            }

            var cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();
            if (cart.Count == 0)
            {
                Response.Redirect("Products.aspx");
                return;
            }

            string orderId = "QK" + DateTime.Now.ToString("yyyyMMddHHmmss");
            Session["LastOrderId"] = orderId;
            Session["LastOrderName"] = name;
            Session["LastPayment"] = ddlPayment.SelectedValue;
            Session["Cart"] = new List<CartItem>();

            Response.Redirect("OrderSuccess.aspx");
        }
    }
}
