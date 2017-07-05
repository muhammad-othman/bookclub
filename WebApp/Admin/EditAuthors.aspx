<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditAuthors.aspx.cs" Inherits="WebApp.Admin.EditAuthors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <div class="row">
    <h4  class="col-sm-6">Authors</h4>
    <h4  class="col-sm-5 col-sm-offset-1">Add/Edit Authors</h4>
        </div>
    <hr />
    <div class="row">
        <div class="col-sm-6">
            <asp:GridView ID="gv_Authors" class="table table-condensed table-hover" runat="server" OnRowDeleting="gv_Authors_RowDeleting" OnSelectedIndexChanged="gv_Authors_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" HeaderText="DeleteAuthor">
                    <ControlStyle CssClass="btn btn-danger" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="EditAuthor" ShowSelectButton="True" >
                    <ControlStyle CssClass="btn btn-default" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
       </div>
        <div class="form-horizontal col-sm-5 col-sm-offset-1 ">
            <div class="form-group">
                <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">AuthorName: </asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="AuthorName" CssClass="form-control" />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You Must Include The Author's Name" ControlToValidate="AuthorName">*</asp:RequiredFieldValidator>
            </div>
        </div>
           <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Description: </asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="description" TextMode="MultiLine" Height="165px" CssClass="form-control" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" Id="addAuthor" Text="Add Author" CssClass="btn btn-primary" OnClick="addAuthor_Click" />
                <asp:Button runat="server"  ID="cancelEditing" Text="Cancel" Visible="false" CssClass="btn btn-secondary" OnClick="cancelEditing_Click" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </div>
        </div>
        </div>
       </div>

    </div>

</asp:Content>



