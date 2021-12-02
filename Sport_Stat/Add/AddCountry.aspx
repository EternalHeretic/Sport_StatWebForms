<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCountry.aspx.cs" Inherits="Sport_Stat.Add.AddCountry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content 
    ID="Content2"
    runat="server" 
    contentplaceholderid="FeaturedContent">

    <link rel="stylesheet" href="/Content/themes/base/jquery-ui-datepicker.css">
    <link rel="stylesheet" href="/Content/style.css">
    <script src="~/Scripts/Datepicker/jquery-ui.js" ></script>
    <script src="~/Scripts/Datepicker/jquery-1.12.4.js"></script>
    

    <div ID="bodyRec">
        <table class="tableAddPeople">

             <!--Страна!-->
            <tr>
                <td>
                    <asp:Label 
                        ID="Label1" 
                        runat="server" 
                        Text="Страна"
                        CssClass="ui-label-text">
                    </asp:Label>
                </td>
            </tr>

            <!--Бокс со страной!-->            
            <tr>
                <td>
                    <asp:TextBox 
                        ID="txt_country" 
                        runat="server"
                        CssClass="ui-textbox-text">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator 
                         ID="RequiredFieldValidator1" 
                         runat="server"  
                         ControlToValidate="txt_country" 
                         Display="Static" 
                         Text="Введите данные" 
                         BackColor="#ff0000" 
                         ValidationGroup="Owner">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>


        
 
            <!--Кнопка Занести!-->
            <tr>
                <td>
                    <asp:Button 
                        ID="but_add_country" 
                        runat="server" Text="Занести" 
                        ValidationGroup="Owner" 
                        OnClick="but_add_country_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>