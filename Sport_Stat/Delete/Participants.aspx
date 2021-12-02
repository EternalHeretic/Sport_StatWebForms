<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Participants.aspx.cs" Inherits="Sport_Stat.Delete.Participant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server"></asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server"></asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="FeaturedContent">

    <link rel="stylesheet" href="../Content/themes/base/jquery-ui-datepicker.css">
    <link rel="stylesheet" href="../Content/style.css">


    <div ID="bodyRec">
        <table class="tableAddPeople">
            
            <!--Фамилия!-->
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Фамилия" CssClass="ui-label-text"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lbl_familiya" runat="server" Text="" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>

            <!--Имя!-->
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Имя" CssClass="ui-label-text"></asp:Label>
                </td>
                <td>
                        <asp:Label ID="lbl_name" runat="server" Text="" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>

            <!--Отчество!-->
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Отчество" CssClass="ui-label-text"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lbl_otchestvo" runat="server" Text="" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>

            <!--Город!-->
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Город" CssClass="ui-label-text"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lbl_cities" runat="server" Text="" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>
            
            <!--Название соревнования !-->
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Название соревнования" CssClass="ui-label-text"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lbl_competition_name" runat="server" Text="" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>

            <!--Номер участника !-->
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Номер участника" CssClass="ui-label-text"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lbl_Nparticipant" runat="server" Text="" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>

            

            <!--Кнопка Delete!-->
            <tr>
                <td>
                    <asp:Button ID="but_delete_participants" runat="server" Text="Удалить" ValidationGroup="Owner" OnClick="but_delete_participants_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
