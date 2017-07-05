<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditGenres.aspx.cs" Inherits="WebApp.Admin.EditGenres" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <div class="row">
        <h4 class="col-sm-6">Genres</h4>
        <h4 class="col-sm-5 col-sm-offset-1">Add/Edit Genres</h4>
    </div>
    <hr />
    <div class="row">
        <div class="col-sm-6">
            <asp:GridView ID="gv_genres" class="table table-condensed table-hover" runat="server" OnRowDeleting="gv_genres_RowDeleting" OnSelectedIndexChanged="gv_genres_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" HeaderText="DeleteGenre">
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="EditGenre" ShowSelectButton="True">
                        <ControlStyle CssClass="btn btn-default" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="form-horizontal col-sm-5 col-sm-offset-1 ">
            <div class="form-group">
                <div class="form-group">
                    <asp:Label runat="server" CssClass="col-md-2 control-label">GenreName: </asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="genreName" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You Must Include The Genre's Name" ControlToValidate="genreName">*</asp:RequiredFieldValidator>
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
                        <asp:Button runat="server" ID="addGenre" Text="Add Genre" CssClass="btn btn-primary" OnClick="addGenre_Click" />
                        <asp:Button runat="server" ID="cancelEditing" Text="Cancel" Visible="false" CssClass="btn btn-secondary" OnClick="cancelEditing_Click" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>



