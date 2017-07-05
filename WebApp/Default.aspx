<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true"  enableEventValidation="false" CodeBehind="Default.aspx.cs" Inherits="WebApp._Default" %>

<%@ Register Src="~/UC_Book.ascx" TagPrefix="uc1" TagName="UC_Book" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
   <br />
<div class="row" style="display:flex;align-items:center;">
        <div class="col-sm-offset-1"></div>
            <label class="col-sm-1 control-label">Filter By:</label>
            <div class="col-sm-1">
                 <asp:RadioButtonList ID="rbl_category"  AutoPostBack="true"  runat="server" OnSelectedIndexChanged="rbl_category_SelectedIndexChanged">
                    <asp:ListItem>Authors</asp:ListItem>
                    <asp:ListItem>Genres</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="col-sm-3">
                  <asp:DropDownList CssClass="form-control" ID="ddl_category" runat="server">
                    </asp:DropDownList>
            </div>
            <asp:Button ID="btn_filter" class="btn btn-warning col-sm-1" style="margin:0px 20px" runat="server" Text="Filter" OnClick="btn_filter_Click"/>
            <asp:Button ID="btn_getAll" class="btn btn-primary col-sm-2" runat="server" Text="Display All Books" OnClick="btn_getAll_Click"/>
             </div>
       <br />
   <br />
    <asp:ListView ID="ListView1" runat="server"  GroupItemCount="4" EnableTheming="True">
        <AlternatingItemTemplate>
            <td runat="server" >
                <uc1:UC_Book runat="server" ID="UC_Book"  
                    isbn='<%# Eval("ISBN") %>'/>
                <br /></td>
        </AlternatingItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
       
        <ItemTemplate>
            <td runat="server">
               <uc1:UC_Book runat="server" ID="UC_Book"  
                    isbn='<%# Eval("ISBN") %>'
                
                />
                <br /></td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" class="table">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
       
            </table>
        </LayoutTemplate>
       
    </asp:ListView>
</asp:Content>
