<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCounty.aspx.cs" Inherits="Sport_Stat.Add.AddCounty" %>
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
               <!--Страна Округ Область Город!-->
            <tr>
                <td>
                    <asp:DropDownList 
                        ID="cbo_Country" 
                        runat="server"
                        AutoPostBack="true" 
                        CssClass="ui-dropdownlist-text">
                    </asp:DropDownList>
                </td>
            </tr>
            
             <!--Округ!-->
            <tr>
                <td>
                    <asp:Label 
                        ID="Label1" 
                        runat="server" 
                        Text="Округ"
                        CssClass="ui-label-text">
                    </asp:Label>
                </td>
            </tr>

            <!--Бокс с округом!-->            
            <tr>
                <td>
                    <asp:TextBox 
                        ID="txt_county" 
                        runat="server"
                        CssClass="ui-textbox-text">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator 
                         ID="RequiredFieldValidator1" 
                         runat="server"  
                         ControlToValidate="txt_county" 
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
                        ID="but_add_county" 
                        runat="server" Text="Занести" 
                        ValidationGroup="Owner" 
                        OnClick="but_add_county_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
