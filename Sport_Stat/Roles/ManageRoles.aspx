<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageRoles.aspx.cs" Inherits="Sport_Stat.Roles.ManageRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    
    <script src="../Scripts/sidemenu.js"></script>
    <div class="tableContent">
        <asp:GridView ID="Roles" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceRoles" BorderStyle="None" BorderWidth="1px" CellPadding="4" AllowPaging="True" CssClass="ui-grid" DataKeyNames="Id">
            <Columns>
                
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound"/>
                <asp:BoundField DataField="Name" HeaderText="Имя роли" SortExpression="Name" />
                
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
        <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [AspNetRoles] ORDER BY [Name] DESC"></asp:SqlDataSource>
    </div>
  
    
    <div id="bodyRec">
        <table class="tableAddPeople">
            <tr>
                <td>
                    <asp:Label ID="lbl_RoleName" runat="server" Text="Название роли"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:TextBox ID="RoleName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="CreateRoleButton" runat="server" Text="Создать роль" OnClick="CreateRoleButton_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="DeleteRoleButton" runat="server" Text="Удалить роль" OnClick="DeleteRoleButton_Click" />
                </td>
            </tr>
        </table>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent1" runat="server">
</asp:Content>
