<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="QuickKart10Min.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="auth-wrap">
 <div class="auth-card">
  <div class="auth-logo">Q</div>
  <span class="eyebrow">WELCOME BACK</span>
  <h1>Sign in to QuickKart</h1>
  <p>Access your account and manage your orders.</p>
  <div class="field"><label>Email or Mobile</label><asp:TextBox ID="txtUser" runat="server" CssClass="input" placeholder="you@example.com" /></div>
  <div class="field"><label>Password</label><asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password" placeholder="Enter password" /></div>
  <asp:Label ID="lblMessage" runat="server" CssClass="error"></asp:Label>
  <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="primary-btn wide" OnClick="btnLogin_Click" />
  <p class="demo">Demo login: use any non-empty username and password.</p>
 </div>
</div>
</asp:Content>
