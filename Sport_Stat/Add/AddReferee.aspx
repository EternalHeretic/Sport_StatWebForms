<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddReferee.aspx.cs" Inherits="Sport_Stat.Add.AddReferee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <link rel="stylesheet" href="../Content/style.css">
    <div id="bodyRec">
        <table class="tableAddPeople">

            <tr>
                <td>
                    <asp:Label 
                        ID="Label1" 
                        runat="server" 
                        Text="Соревнование"
                        CssClass="ui-label-text">
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="Competition" runat="server" AutoPostBack="true" CssClass="ui-dropdownlist-text" OnSelectedIndexChanged="Competition_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator4"
                        runat="server"  
                        ControlToValidate="Competition" 
                        Display="Static" 
                        Text="Введите данные" 
                        BackColor="#ff0000" 
                        ValidationGroup="Owner">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label 
                        ID="Label2" 
                        runat="server" 
                        Text="День"
                        CssClass="ui-label-text">
                    </asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:DropDownList ID="Day" runat="server" AutoPostBack="true" CssClass="ui-dropdownlist-text" OnSelectedIndexChanged="Day_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator1"
                        runat="server"  
                        ControlToValidate="Day" 
                        Display="Static" 
                        Text="Введите данные" 
                        BackColor="#ff0000" 
                        ValidationGroup="Owner">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label 
                        ID="Label3" 
                        runat="server" 
                        Text="Снаряд"
                        CssClass="ui-label-text">
                    </asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:DropDownList ID="Shell" runat="server" AutoPostBack="true" CssClass="ui-dropdownlist-text" OnSelectedIndexChanged="Shell_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator2"
                        runat="server"  
                        ControlToValidate="Shell" 
                        Display="Static" 
                        Text="Введите данные" 
                        BackColor="#ff0000" 
                        ValidationGroup="Owner">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label 
                        ID="Label4" 
                        runat="server" 
                        Text="Человек/Судья"
                        CssClass="ui-label-text">
                    </asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:DropDownList ID="People" runat="server" AutoPostBack="true" CssClass="ui-dropdownlist-text" OnSelectedIndexChanged="People_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator3"
                        runat="server"  
                        ControlToValidate="People" 
                        Display="Static" 
                        Text="Введите данные" 
                        BackColor="#ff0000" 
                        ValidationGroup="Owner">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btn_add" runat="server" Text="Добавить" OnClick="btn_add_Click" />
                </td>
            </tr>
        </table>
    </div>





</asp:Content>





<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent1" runat="server">
</asp:Content>
