<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditBooks.aspx.cs" Inherits="WebApp.Admin.EditBooks" %>
<asp:Content  ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
            <asp:Button ID="btn_filter" CausesValidation="false" class="btn btn-warning col-sm-1" style="margin:0px 20px" runat="server" Text="Filter" OnClick="btn_filter_Click"/>
            <asp:Button ID="btn_getAll" CausesValidation="false" class="btn btn-primary col-sm-2" runat="server" Text="Display All Books" OnClick="btn_getAll_Click"/>
             </div>
   <br />
   <br />
     <div class="row">
        <div class="col-sm-7">
                 <h4>Books</h4>
            <hr />
            <asp:GridView ID="gv_books" ShowHeaderWhenEmpty="true" class="table table-condensed table-hover text-center" runat="server" OnRowCreated="gv_books_RowCreated" AutoGenerateColumns="False" OnSelectedIndexChanged="gv_books_SelectedIndexChanged" OnRowDeleting="gv_books_RowDeleting">
                <Columns>
                    <asp:imagefield dataimageurlfield="image"
            dataimageurlformatstring="{0}"
            alternatetext="IMG"
            headertext="Cover"  
            readonly="true">
                        <ControlStyle CssClass="img-responsive" Width="100px" />
                        <HeaderStyle CssClass="text-center" />
                    </asp:imagefield>
                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" >
                    <HeaderStyle CssClass="text-center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Title" HeaderText="Title" >
                    <HeaderStyle CssClass="text-center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Author" HeaderText="Author" >
                    <HeaderStyle CssClass="text-center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Genre" HeaderText="Genre" >
                    <HeaderStyle CssClass="text-center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="date" DataFormatString="{0:dd-M-yyyy}" HeaderText="Publishing Date" >
                    <HeaderStyle CssClass="text-center" />
                    </asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" HeaderText="DeleteBook">
                    <ControlStyle CssClass="btn btn-danger" />
                    <HeaderStyle CssClass="text-center" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="EditBook" ShowSelectButton="True" >
                    <ControlStyle CssClass="btn btn-default" />
                    <HeaderStyle CssClass="text-center" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
       </div>
     <h4 class="text-center" >Edit/Add Book</h4>
        <hr />
         <div class="form-horizontal col-sm-4 col-sm-offset-1 ">
            <div class="form-group  ">
                <div class="col-sm-offset-3 ">
                  <asp:Image ID="img_cover" ImageUrl="~/imgs/cover.png" CssClass="img-responsive" Width="150px" runat="server" />
                    <asp:FileUpload ID="fileUpload" accept=".png,.jpg,.jpeg,.gif" runat="server" />
                    
            </div>
                <div class="form-group">
            <div class="col-md-12">
                <asp:TextBox   runat="server" ID="txt_ISBN" placeholder="ISBN" CssClass="form-control col-md-offset-2" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You Must Include The ISBN of The Book" ControlToValidate="txt_ISBN">*</asp:RequiredFieldValidator>
            </div>
        </div>
           <div class="form-group">
            <div class="col-md-12">
                <asp:TextBox   runat="server" ID="txt_title" placeholder="Title" CssClass="form-control col-md-offset-2" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You Must Include The Title of The Book" ControlToValidate="txt_title">*</asp:RequiredFieldValidator>
            </div>
        </div>

                 <div class="form-group">
            <div class="col-md-12">
                <asp:TextBox runat="server" ID="txt_description" TextMode="MultiLine"  placeholder="Desciption" Height="100px" CssClass="form-control" />
            </div>
        </div>

                    <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Author: </asp:Label>
            <div class="col-md-10">
                <asp:DropDownList CssClass="form-control" ID="ddl_authors" runat="server">
                    </asp:DropDownList>
            </div>
        </div>
                <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Genre: </asp:Label>
            <div class="col-md-10">
                <asp:DropDownList CssClass="form-control" ID="ddl_genres" runat="server">
                    </asp:DropDownList>
            </div>
        </div>
                 <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Date: </asp:Label>
            <div class="col-md-10">
                <asp:Calendar ID="calendar" AutoPostBack="false" runat="server"></asp:Calendar>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-4 col-md-8">
                <asp:Button runat="server" Id="addBook" Text="Add Book" CssClass="btn btn-primary" OnClick="addBook_Click" />
                <asp:Button runat="server"  ID="cancelEditing" Text="Cancel" Visible="false" CssClass="btn btn-secondary" OnClick="cancelEditing_Click"  />
                  <asp:ValidationSummary ID="ValidationSummary1" Display="Dynamic" ForeColor="Red" runat="server" />
            </div>
        </div>
        </div>
       </div>
        
    </div>
</asp:Content>
