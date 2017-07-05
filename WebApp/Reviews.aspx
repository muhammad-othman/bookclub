<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="WebApp.Reviews" %>

<%@ Register Src="~/UC_Book.ascx" TagPrefix="uc1" TagName="UC_Book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-3 text-center">
            <div>
                <uc1:UC_Book runat="server" ID="UC_Book" />
            </div>
            <div class="col-md-12">
                <asp:TextBox runat="server" ID="lbl_description" TextMode="MultiLine" placeholder="Description"
                    CssClass="form-control" Enabled="false" Height="250px" />
            </div>
        </div>
        <div class="col-sm-9">
            <br />
            <h4>Reviews</h4>
            
           <asp:LoginView ID="loginView1" EnableViewState="false" runat="server">
               <LoggedInTemplate>
                   <hr />
                    <br />
                   <div class="form-group">
                <div class="form-group">
                    <div class="col-md-12">
                        <asp:TextBox runat="server" ID="txt_HeadLine" placeholder="HeadLine" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You Must Include The HeadLine of The Review" ControlToValidate="txt_HeadLine">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-12">
                    <asp:TextBox runat="server" ID="txt_Review" TextMode="MultiLine" placeholder="Review" Height="100px" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You Must Include The Review of The Book" ControlToValidate="txt_Review">*</asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-5 col-md-2">
                        <asp:Button runat="server" ID="submitReview" Text="Submit Review" CssClass="btn btn-primary" OnClick="submitReview_Click" />

                    </div>
                    <div class="col-sm-12">
                        <asp:ValidationSummary ID="ValidationSummary1" Display="Dynamic" ForeColor="Red" runat="server" />
                    </div>
                </div>
            </div>
               </LoggedInTemplate>
           </asp:LoginView>
            
            <br />
            <br />

            <asp:ListView ID="ListView1" runat="server">
                <AlternatingItemTemplate>
                  <div class="col-sm-12">
                        <hr />
                        <br />
                        <br />
                        <br />
                        <blockquote class="blockquote">
                            <p>
                                <%# Eval("headLine") %>
                            </p>
                        </blockquote>
                        <p>
                            <%# Eval("details") %>
                        </p>
                        <div style="text-align: right">
                            <strong>By:  <%# Eval("Email") %></strong>
                        </div>
                        
                    </div>
                </AlternatingItemTemplate>


                <ItemSeparatorTemplate>
                    <hr />
                    <br />
                    <br />
                </ItemSeparatorTemplate>
                <ItemTemplate>
                    <div class="col-sm-12">
                        <hr />
                        <br />
                        <br />
                        <br />
                        <blockquote class="blockquote">
                            <p>
                                <%# Eval("headLine") %>
                            </p>
                        </blockquote>
                        <p>
                            <%# Eval("details") %>
                        </p>
                        <div style="text-align: right">
                            <strong>By:  <%# Eval("Email") %></strong>
                        </div>
                        
                    </div>

                </ItemTemplate>
                <LayoutTemplate>
                    <ul id="itemPlaceholderContainer" runat="server" style="">
                        <li runat="server" id="itemPlaceholder" />
                    </ul>
                    <div style="">
                    </div>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
