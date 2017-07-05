<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditUsers.aspx.cs" Inherits="WebApp.Admin.EditUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h4>Roles</h4>
    <hr />
    <div class="row">
        <div class="col-sm-6">
             <asp:GridView ID="roles" class="table table-condensed table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="roles_SelectedIndexChanged">
                 <Columns>
                     <asp:BoundField DataField="RoleId" HeaderText="RoleId" SortExpression="RoleId" />
                     <asp:BoundField DataField="RoleName" HeaderText="RoleName" SortExpression="RoleName" />
                     <asp:CommandField HeaderText="DeleteRole" SelectText="Delete" ShowSelectButton="True" />
                 </Columns>
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookClubConnectionString %>" SelectCommand="SELECT [RoleId], [RoleName] FROM [vw_aspnet_Roles]"></asp:SqlDataSource>
       </div>
        <div class="form-horizontal col-sm-5 col-sm-offset-1 ">
            <div class="form-group">
                    <h4>Add New Role</h4>
                <hr />
                        <div class="form-group">
                        <asp:Label runat="server" CssClass="col-sm-2 control-label">RoleName: </asp:Label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="roleName"  CssClass="form-control" />
                           <%-- <asp:RequiredFieldValidator runat="server" ControlToValidate="roleName"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="The Role Name field is required." />--%>
                        </div>
                    </div>
                        <div class="col-sm-offset-4 col-sm-8">
                            <asp:Button runat="server" ID="addRole" Text="Add Role" CssClass="btn btn-default" OnClick="addRole_Click" />
                        </div>
                    </div>
       </div>

    </div>
    <br />
    <br />
    <br />
     <h4>Assign User to Role</h4>
    <hr />
     <div class="row">
        <div class="col-sm-6">
             <asp:GridView ID="GridView1" class="table table-condensed table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                 <Columns>
                     <asp:BoundField DataField="RoleName" HeaderText="RoleName" SortExpression="RoleName" />
                     <asp:TemplateField HeaderText="Users">
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" OnPreRender="Label1_PreRender" Text='<%# Bind("RoleName") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             </asp:GridView>
       </div>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookClubConnectionString %>" SelectCommand="SELECT [Email], [Id] FROM [AspNetUsers]"></asp:SqlDataSource>

        <div class="form-horizontal col-sm-5 col-sm-offset-1 row">
            <div class="form-group">
                        <div class="form-group">
                             <asp:Label runat="server" CssClass="col-sm-2 control-label">UserMail: </asp:Label>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="dropdownUsers" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="Email" DataValueField="Email"></asp:DropDownList>
                            
                        </div>
                            <br />
                              <br />
                        <asp:Label runat="server" CssClass="col-sm-2 control-label">RoleName: </asp:Label>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="dropdownRoles" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="RoleName" DataValueField="RoleName"></asp:DropDownList>
                            
                        </div>
                       
                            </div>
                          

                        <div class="col-sm-offset-3 col-sm-4">
                            <asp:Button runat="server" ID="Button1" Text="Assign Role" CssClass="btn btn-success" OnClick="Button1_Click" />
                        </div>
                            <div class=" col-sm-4">
                            <asp:Button runat="server" ID="Button2" Text="Remove Role" CssClass="btn btn-danger" OnClick="Button2_Click" />
                        </div>
                    
       </div>

    </div>
    </div>
</asp:Content>
