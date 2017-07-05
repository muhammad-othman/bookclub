<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Likes.aspx.cs" Inherits="WebApp.Likes" 
    EnableEventValidation="false"%>

<%@ Register Src="~/UC_Book.ascx" TagPrefix="uc1" TagName="UC_Book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


      <br />
    <asp:ListView ID="ListView1" runat="server"  EnableViewState="false" GroupItemCount="4" EnableTheming="True">
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
