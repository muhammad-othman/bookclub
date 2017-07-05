<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_Book.ascx.cs" Inherits="WebApp.UC_Book" %>
<div style="border: 2px solid #088fbb ;    max-width: 240px;
    padding: 1px;
    height: 485px; margin:10px">
     <div class="text-center" style="margin:5px">
           <asp:HyperLink ID="HyperLink1" runat="server">
              <asp:Label ID="lbl_Title" runat="server" Text="UnKnown" Font-Bold="true" Font-Size="Larger" ForeColor="#003366" ></asp:Label>
        </asp:HyperLink>
            </div>
<asp:Image ID="img_cover" runat="server" width="234px" Height="330px" CssClass="img-reponsive" />
<br />
    <div class="row">
     <div class="form-group">
            <asp:Label runat="server" CssClass=" col-sm-offset-1 col-sm-2 control-label">ISBN: </asp:Label>
            <div class="col-sm-9">
              <asp:Label ID="lbl_isbn" runat="server" Text="UnKnown" Font-Bold="true"></asp:Label>

            </div>
        </div>
     <div class="form-group">
            <asp:Label runat="server" CssClass=" col-sm-offset-1 col-sm-2 control-label">Author: </asp:Label>
            <div class="col-sm-9">
              <asp:Label ID="lbl_Author" runat="server" Text="UnKnown" Font-Bold="true"></asp:Label>

            </div>
        </div>
     <div class="form-group">
            <asp:Label runat="server" CssClass=" col-sm-offset-1 col-sm-2 control-label">Genre: </asp:Label>
            <div class="col-sm-9">
              <asp:Label ID="lbl_Genre" runat="server" Text="UnKnown" Font-Bold="true"></asp:Label>

            </div>
        </div>
    <div class="form-group">
            <asp:Label runat="server" CssClass=" col-sm-offset-1 col-sm-2 control-label">Date: </asp:Label>
            <div class="col-sm-9">
              <asp:Label ID="lbl_Date" runat="server" Text="UnKnown" Font-Bold="true"></asp:Label>
            </div>
        </div>
     <div class="form-group">
            <asp:Label runat="server" CssClass=" col-sm-offset-1 col-sm-2 control-label">Likes: </asp:Label>
            <div class="col-sm-4">
              <asp:Label ID="lbl_NumofLikes" runat="server" Text="UnKnown" Font-Bold="true"></asp:Label>

            </div>
            <div class="col-sm-5">

         <asp:ImageButton ID="img_Like" ImageUrl="~/imgs/like.png" runat="server" CausesValidation="false" CssClass="img-responsive" Height="30px" OnClick="ImageButton1_Click"  OnPreRender="img_Like_PreRender"/>
        </div>
        </div>
        </div>
    </div>
