<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserPeople.aspx.cs" Inherits="Sport_Stat.UserPeople" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">

    <script src="../Scripts/sidemenu.js"></script>
    <div class="tableContent">
        <asp:GridView ID="AspNetUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAspNetUsers" BorderStyle="None" BorderWidth="1px" CellPadding="4" AllowPaging="True" CssClass="ui-grid" DataKeyNames="Id">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" />
                <asp:BoundField DataField="UserName" HeaderText="Логин" SortExpression="UserName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="Номер телефона(Users)" SortExpression="PhoneNumber" />
                <asp:BoundField DataField="first_name" HeaderText="Имя" SortExpression="first_name" />
                <asp:BoundField DataField="second_name" HeaderText="Фамилия" SortExpression="second_name" />
                <asp:BoundField DataField="middle_name" HeaderText="Отчество" SortExpression="middle_name" />
                <asp:BoundField DataField="birthday" HeaderText="Дата Рождения" SortExpression="birthday" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="N_phone" HeaderText="Номер телефона(Peoples)" SortExpression="N_phone" />
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
    </div>
    <asp:SqlDataSource ID="SqlDataSourceAspNetUsers" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [AspNetUsers] join [Peoples] on [Peoples].[PeopleId] = [AspNetUsers].[PeopleId]  ORDER BY [UserName]"></asp:SqlDataSource>
    
    <div id="bodyRec">
        <table class="tableAddPeople">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Логин" CssClass="ui-label-text"> </asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="ddl_Login" runat="server" AutoPostBack="true" CssClass="ui-dropdownlist-text" OnSelectedIndexChanged="ddl_Login_SelectedIndexChanged"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Email" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_Email" runat="server" Text="" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Номер телефона(User)" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_phone_number_user" runat="server" Text="" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Фамилия" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="ddl_name" runat="server" AutoPostBack="true" CssClass="ui-dropdownlist-text" OnSelectedIndexChanged="ddl_name_SelectedIndexChanged"></asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Имя" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                   <asp:Label ID="lbl_second_name" runat="server" Text="" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Отчество" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_middle_name" runat="server" Text="" CssClass="ui-label-text"></asp:Label>   
                </td>
            </tr>


            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Дата рождения" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_birthday" runat="server" Text="" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Номер телефона(People)" CssClass="ui-label-text"> </asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_phone_number_people" runat="server" Text="" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Button ID="btn_add_userpeople" runat="server" Text="Добавить" OnClick="btn_add_userpeople_Click"/>
                </td>
            </tr>

        </table>
    </div>

    <asp:Label ID="EmailConfirmed" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="PasswordHash" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="SecurityStamp" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="PhoneNumberConfirmed" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="TwoFactorEnabled" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="LockoutEndDateUtc" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="LockoutEnabled" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="AccessFailedCount" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="UserName" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="PeopleId" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="PeopleID_User" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>







<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent1" runat="server">
</asp:Content>
