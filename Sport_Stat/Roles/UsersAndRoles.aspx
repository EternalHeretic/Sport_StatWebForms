<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="~/Roles/UsersAndRoles.aspx.cs" Inherits="Sport_Stat.Admin.ControlRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <script src="../Scripts/sidemenu.js"></script>

    <div class="tableContent">
        <asp:GridView ID="RolesInUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceUserAndRoles" BorderStyle="None" BorderWidth="1px" CellPadding="4" AllowPaging="True" CssClass="ui-grid" DataKeyNames="UserId,RoleId">
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="Логин" ReadOnly="True" SortExpression="UserId" />
                <asp:BoundField DataField="Name" HeaderText="Роли" ReadOnly="True" SortExpression="RoleId" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceUserAndRoles" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [AspNetUserRoles] join [AspNetRoles] on [AspNetRoles].[Id]=[AspNetUserRoles].[RoleId] join [AspNetUsers] on [AspNetUsers].[Id]=[AspNetUserRoles].[UserId] "></asp:SqlDataSource>
    </div>

    <div id="bodyRec">
        <table class="tableAddPeople">
            <tr>
                <td>
                    <asp:Label ID="lbl_User" runat="server" Text="Логин"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="ddl_User" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_role" runat="server" Text="Роль"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="ddl_role" runat="server" DataSourceID="SqlDataSourceDDLRoles" DataTextField="Name" DataValueField="Name"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceDDLRoles" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Name] FROM [AspNetRoles] ORDER BY [Name]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btn_add" runat="server" Text="Добавить выбранную роль" OnClick="btn_add_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btn_rec" runat="server" Text="Удалить выбранную роль" OnClick="btn_rec_Click"/>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
