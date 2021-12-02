<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditShells.aspx.cs" Inherits="Sport_Stat.Edit.EditShells" %>

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
            <!--Снаряд!-->
            <tr>
                <td>
                    <asp:Label 
                        ID="Label1" 
                        runat="server" 
                        Text="Снаряд"
                        CssClass="ui-label-text">
                    </asp:Label>
                </td>
            </tr>

            <!--Бокс со снарядом!-->            
            <tr>
                <td>
                    <asp:TextBox 
                        ID="txt_Shell" 
                        runat="server"
                        CssClass="ui-textbox-text">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator 
                         ID="RequiredFieldValidator1" 
                         runat="server"  
                         ControlToValidate="txt_Shell" 
                         Display="Static" 
                         Text="Введите данные" 
                         BackColor="#ff0000" 
                         ValidationGroup="Owner">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>

            <!--Кнопка Изменить!-->
            <tr>
                <td>
                    <asp:Button 
                        ID="but_add_shell" 
                        runat="server" Text="Изменить" 
                        ValidationGroup="Owner" 
                        OnClick="But_add_shell_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

