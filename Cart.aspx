<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="QuickKart10Min.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="container page">
 <div class="page-title"><span class="eyebrow">YOUR ORDER</span><h1>Shopping Cart</h1><p>Review your items before checkout.</p></div>

 <asp:Panel ID="pnlEmpty" runat="server" CssClass="empty-box">
   <div class="empty-icon">CART</div>
   <h2>Your cart is empty</h2>
   <p>Add some essentials to get started.</p>
   <a class="primary-btn" href="Products.aspx">Browse Products</a>
 </asp:Panel>

 <asp:Panel ID="pnlCart" runat="server">
  <div class="cart-layout">
   <div class="cart-list">
    <asp:Repeater ID="rptCart" runat="server">
     <ItemTemplate>
      <div class="cart-item">
       <img src="Images/<%# Eval("Product.Image") %>" alt="<%# Eval("Product.Name") %>" />
       <div class="cart-product">
         <h3><%# Eval("Product.Name") %></h3>
         <small><%# Eval("Product.Unit") %></small>
         <strong>&#8377;<%# Eval("Product.Price","{0:0}") %></strong>
       </div>
       <div class="qty">
         <asp:Button runat="server" Text="-" CssClass="qty-btn" CommandName="minus" CommandArgument='<%# Eval("Product.Id") %>' OnCommand="Quantity_Command" />
         <span><%# Eval("Quantity") %></span>
         <asp:Button runat="server" Text="+" CssClass="qty-btn" CommandName="plus" CommandArgument='<%# Eval("Product.Id") %>' OnCommand="Quantity_Command" />
       </div>
       <strong class="line-total">&#8377;<%# Eval("Total","{0:0}") %></strong>
      </div>
     </ItemTemplate>
    </asp:Repeater>
   </div>

   <div class="summary">
    <h2>Order Summary</h2>
    <div><span>Subtotal</span><b>&#8377;<asp:Literal ID="litSubtotal" runat="server" /></b></div>
    <div><span>Delivery</span><b class="free">FREE</b></div>
    <div class="summary-total"><span>Total</span><b>&#8377;<asp:Literal ID="litTotal" runat="server" /></b></div>
    <a href="Checkout.aspx" class="primary-btn wide">Proceed to Checkout</a>
    <p class="mini-note">Estimated delivery: <b>10 minutes</b></p>
   </div>
  </div>
 </asp:Panel>
</div>
</asp:Content>
