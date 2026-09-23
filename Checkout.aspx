<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="QuickKart10Min.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="container page">
 <div class="page-title"><span class="eyebrow">ALMOST THERE</span><h1>Checkout</h1><p>Enter delivery details and place your order.</p></div>
 <div class="checkout-layout">
  <div class="form-card">
   <h2>Delivery Details</h2>
   <div class="field"><label>Full Name</label><asp:TextBox ID="txtName" runat="server" CssClass="input" placeholder="Enter your name" /></div>
   <div class="field"><label>Mobile Number</label><asp:TextBox ID="txtMobile" runat="server" CssClass="input" placeholder="10-digit mobile number" MaxLength="10" /></div>
   <div class="field"><label>Delivery Address</label><asp:TextBox ID="txtAddress" runat="server" CssClass="input" TextMode="MultiLine" Rows="3" placeholder="House / Flat, street, area" /></div>
   <div class="field"><label>Payment Method</label><asp:DropDownList ID="ddlPayment" runat="server" CssClass="input"><asp:ListItem>Cash on Delivery</asp:ListItem><asp:ListItem>UPI (Demo)</asp:ListItem><asp:ListItem>Card (Demo)</asp:ListItem></asp:DropDownList></div>
   <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label>
   <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order - 10 Min Delivery" CssClass="primary-btn wide" OnClick="btnPlaceOrder_Click" />
  </div>

  <div class="summary">
   <h2>Your Order</h2>
   <asp:Repeater ID="rptSummary" runat="server">
    <ItemTemplate>
      <div class="order-row"><span><%# Eval("Product.Name") %> x <%# Eval("Quantity") %></span><b>&#8377;<%# Eval("Total","{0:0}") %></b></div>
    </ItemTemplate>
   </asp:Repeater>
   <div class="summary-total"><span>Total</span><b>&#8377;<asp:Literal ID="litTotal" runat="server" /></b></div>
   <div class="promise"><b>10 minute delivery</b><br/><small>Available in your local service area.</small></div>
  </div>
 </div>
</div>
</asp:Content>
