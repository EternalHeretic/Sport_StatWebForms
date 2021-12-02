<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDay.aspx.cs" Inherits="Sport_Stat.Add.AddDay" %>
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
            <!--День!-->
            <tr>
                <td>
                    <asp:Label 
                        ID="Label1" 
                        runat="server" 
                        Text="День"
                        CssClass="ui-label-text">
                    </asp:Label>
                </td>
            </tr>

            <!--Бокс со днём!-->            
            <tr>
                <td>
                    <asp:TextBox 
                        ID="txt_day" 
                        runat="server"
                        CssClass="ui-textbox-text">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator 
                         ID="RequiredFieldValidator1" 
                         runat="server"  
                         ControlToValidate="txt_day" 
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
                        ID="but_add_day" 
                        runat="server" Text="Занести" 
                        ValidationGroup="Owner" 
                        OnClick="but_add_day_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
