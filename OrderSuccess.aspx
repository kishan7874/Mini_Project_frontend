<%@ Page Title="Order Confirmed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="OrderSuccess.aspx.cs" Inherits="QuickKart10Min.OrderSuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="success-wrap">
 <div class="success-card">
  <div class="success-icon">OK</div>
  <span class="eyebrow">ORDER CONFIRMED</span>
  <h1>Your order is on the way!</h1>
  <p>Thanks, <asp:Literal ID="litName" runat="server" />. Your QuickKart order has been placed successfully.</p>
  <div class="order-number">Order ID: <b><asp:Literal ID="litOrder" runat="server" /></b></div>
  <div class="delivery-big"><strong>10 MIN</strong><span>Estimated delivery time</span></div>
  <a href="Products.aspx" class="primary-btn">Continue Shopping</a>
 </div>
</div>
</asp:Content>
