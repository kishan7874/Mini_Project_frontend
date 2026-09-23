<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="QuickKart10Min._Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<section class="hero">
 <div class="container hero-inner">
  <div class="hero-copy">
   <span class="eyebrow">LIGHTNING FAST LOCAL DELIVERY</span>
   <h1>Everything you need.<br/><span>Delivered in 10 minutes.</span></h1>
   <p>Groceries, snacks, dairy and everyday essentials delivered quickly from your local store.</p>
   <a href="Products.aspx" class="primary-btn">Shop Now</a>
   <div class="hero-points">
     <span>10 minute promise</span>
     <span>Easy checkout</span>
     <span>Local essentials</span>
   </div>
  </div>
  <div class="hero-card">
    <div class="timer">10<span>MIN</span></div>
    <div class="hero-card-title">Average delivery promise</div>
    <div class="route">STORE TO YOU</div>
  </div>
 </div>
</section>

<section class="container section">
 <div class="section-head">
   <div><h2>Shop by Category</h2><p>Pick what you need and we will bring it fast.</p></div>
   <a href="Products.aspx">View all</a>
 </div>
 <div class="categories">
  <a href="Products.aspx?q=Fruits" class="cat"><span class="cat-icon">FR</span><b>Fruits</b><small>Fresh picks</small></a>
  <a href="Products.aspx?q=Vegetables" class="cat"><span class="cat-icon">VE</span><b>Vegetables</b><small>Farm fresh</small></a>
  <a href="Products.aspx?q=Dairy" class="cat"><span class="cat-icon">DA</span><b>Dairy</b><small>Daily needs</small></a>
  <a href="Products.aspx?q=Snacks" class="cat"><span class="cat-icon">SN</span><b>Snacks</b><small>Cravings</small></a>
  <a href="Products.aspx?q=Beverages" class="cat"><span class="cat-icon">BV</span><b>Beverages</b><small>Cool and fresh</small></a>
  <a href="Products.aspx?q=Home%20Care" class="cat"><span class="cat-icon">HC</span><b>Home Care</b><small>Essentials</small></a>
 </div>
</section>

<section class="container section">
 <div class="section-head">
   <div><h2>Popular Near You</h2><p>Our most ordered everyday essentials.</p></div>
   <a href="Products.aspx">See all</a>
 </div>
 <div class="product-grid">
  <asp:Repeater ID="rptPopular" runat="server">
   <ItemTemplate>
    <div class="product-card">
      <a class="product-image" href='Products.aspx?q=<%# Server.UrlEncode(Eval("Name").ToString()) %>'>
        <img src="Images/<%# Eval("Image") %>" alt="<%# Eval("Name") %>" />
        <span class="image-badge">10 MIN</span>
      </a>
      <div class="product-info">
        <span class="tag">IN STOCK</span>
        <h3><%# Eval("Name") %></h3>
        <small><%# Eval("Unit") %></small>
        <div class="price-row">
          <strong>&#8377;<%# Eval("Price","{0:0}") %></strong>
          <asp:Button runat="server" Text="+ ADD" CssClass="add-btn" CommandArgument='<%# Eval("Id") %>' OnCommand="AddToCart_Command" />
        </div>
      </div>
    </div>
   </ItemTemplate>
  </asp:Repeater>
 </div>
</section>

<section class="trust">
 <div class="container trust-grid">
   <div><span class="trust-icon">10</span><b>10 min</b><span>Fast delivery</span></div>
   <div><span class="trust-icon">01</span><b>1000+</b><span>Daily essentials</span></div>
   <div><span class="trust-icon">OK</span><b>Secure</b><span>Simple checkout</span></div>
   <div><span class="trust-icon">F</span><b>Fresh</b><span>Quality products</span></div>
 </div>
</section>
</asp:Content>
