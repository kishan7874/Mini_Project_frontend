<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="QuickKart10Min.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="container page">
 <div class="page-title">
   <div><span class="eyebrow">QUICKKART STORE</span><h1>All Products</h1><p>Choose from everyday essentials available for quick delivery.</p></div>
 </div>

 <div class="filterbar">
   <asp:DropDownList ID="ddlCategory" runat="server" CssClass="select" AutoPostBack="true" OnSelectedIndexChanged="FilterChanged">
     <asp:ListItem Text="All Categories" Value="" />
     <asp:ListItem Text="Fruits" Value="Fruits" />
     <asp:ListItem Text="Vegetables" Value="Vegetables" />
     <asp:ListItem Text="Dairy" Value="Dairy" />
     <asp:ListItem Text="Bakery" Value="Bakery" />
     <asp:ListItem Text="Snacks" Value="Snacks" />
     <asp:ListItem Text="Beverages" Value="Beverages" />
     <asp:ListItem Text="Staples" Value="Staples" />
     <asp:ListItem Text="Home Care" Value="Home Care" />
   </asp:DropDownList>
   <asp:Label ID="lblResults" runat="server" CssClass="results"></asp:Label>
 </div>

 <div class="product-grid">
  <asp:Repeater ID="rptProducts" runat="server">
   <ItemTemplate>
    <div class="product-card">
      <div class="product-image">
        <img src="Images/<%# Eval("Image") %>" alt="<%# Eval("Name") %>" />
        <span class="image-badge">10 MIN</span>
      </div>
      <div class="product-info">
        <span class="tag">IN STOCK</span>
        <h3><%# Eval("Name") %></h3>
        <small><%# Eval("Unit") %> - <%# Eval("Category") %></small>
        <div class="price-row">
          <strong>&#8377;<%# Eval("Price","{0:0}") %></strong>
          <asp:Button runat="server" Text="+ ADD" CssClass="add-btn" CommandArgument='<%# Eval("Id") %>' OnCommand="AddToCart_Command" />
        </div>
      </div>
    </div>
   </ItemTemplate>
  </asp:Repeater>
 </div>
</div>
</asp:Content>
