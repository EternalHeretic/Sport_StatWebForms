<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditCompetitions.aspx.cs" Inherits="Sport_Stat.Edit.EditCompetition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content 
    ID="Content2" 
    ContentPlaceHolderID="MainContent" 
    runat="server">
</asp:Content>

<asp:Content 
    ID="Content3" 
    runat="server" 
    contentplaceholderid="FeaturedContent">

    <link rel="stylesheet" href="/Content/themes/base/jquery-ui-datepicker.css">
    <link rel="stylesheet" href="/Content/style.css">
    <script src="/Scripts/Datepicker/jquery-1.12.4.js" type="text/javascript"></script>
    <script src="/Scripts/Datepicker/jquery-ui.js" type="text/javascript"></script>
    
    <script>
        $(function () {
            $("#<%=txt_date_start.ClientID%>").datepicker({
                dateFormat: "mm-dd-yy",
                changeMonth: true,
                changeYear: true
            });
            $("#<%=txt_date_end.ClientID%>").datepicker({
                dateFormat: "mm-dd-yy",
                changeMonth: true,
                changeYear: true
            });
            $.datepicker.regional['ru'] = {
                prevText: 'Пред',
                nextText: 'След',
                monthNames: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь',
                'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
                monthNamesShort: ['Янв', 'Фев', 'Мар', 'Апр', 'Май', 'Июн',
                'Июл', 'Авг', 'Сен', 'Окт', 'Ноя', 'Дек'],
                dayNames: ['воскресенье', 'понедельник', 'вторник', 'среда', 'четверг', 'пятница', 'суббота'],
                dayNamesShort: ['вск', 'пнд', 'втр', 'срд', 'чтв', 'птн', 'сбт'],
                dayNamesMin: ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
                weekHeader: 'Не',
                dateFormat: 'mm-dd-yy',
                yearRange: '1940:c+1',
                firstDay: 1,
                isRTL: false,
                showMonthAfterYear: false,
                yearSuffix: ''
            };
            $.datepicker.setDefaults($.datepicker.regional['ru']);
        });
    </script>

    <div ID="bodyRec">
        <table class="tableAddPeople">
            <!--Название соревнования!-->
            <tr>
                <td>
                    <asp:Label 
                        ID="Label1" 
                        runat="server" 
                        Text="Название соревнования"
                        CssClass="ui-label-text">
                    </asp:Label>
                </td>
            </tr>

            <!--Бокс с названием соревнования!-->            
            <tr>
                <td>
                    <asp:TextBox 
                        ID="txt_competition_name" 
                        runat="server"
                        CssClass="ui-textbox-text">
                    </asp:TextBox>                         
                </td>
            </tr>
            
            <!--Страна Округ Область Город!-->
            <tr>
                <td>
                    <asp:DropDownList 
                        ID="cbo_Country" 
                        runat="server" 
                        OnSelectedIndexChanged="cbo_Country_SelectedIndexChanged" 
                        AutoPostBack="true" 
                        CssClass="ui-dropdownlist-text">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList 
                        ID="cbo_Countis" 
                        runat="server" 
                        OnSelectedIndexChanged="cbo_Countis_SelectedIndexChanged" 
                        AutoPostBack="true"
                        CssClass="ui-dropdownlist-text">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList 
                        ID="cbo_Regions" 
                        runat="server" 
                        OnSelectedIndexChanged="cbo_Regions_SelectedIndexChanged" 
                        AutoPostBack="true"
                        CssClass="ui-dropdownlist-text">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList 
                        ID="cbo_Cities" 
                        runat="server"
                        CssClass="ui-dropdownlist-text">
                    </asp:DropDownList>
                </td>
            </tr>

            <!--Дата начала соревнований!-->
            <tr>
                <td>
                    <asp:Label 
                        ID="Label_birthday" 
                        runat="server" 
                        Text="Дата начала"
                        CssClass="ui-label-text"> 
                    </asp:Label>
                </td>
            </tr>

            <!--Дата начала соревнований!-->
            <tr>
                <td>
                    <asp:TextBox runat="server" ID="txt_date_start" CssClass="ui-textbox-text"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                         ID="RequiredFieldValidator3" 
                         runat="server"  
                         ControlToValidate="txt_date_start" 
                         Display="Static" 
                         Text="Введите данные" 
                         BackColor="#ff0000" 
                         ValidationGroup="Owner">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>

            <!--Дата окончания соревнований!-->
            <tr>
                <td>
                    <asp:Label 
                        ID="Label4" 
                        runat="server" 
                        Text="Дата окончания"
                        CssClass="ui-label-text"> 
                    </asp:Label>
                </td>
            </tr>

            <!--Дата окончания соревнований!-->
            <tr>
                <td>
                    <asp:TextBox runat="server" ID="txt_date_end" CssClass="ui-textbox-text"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                         ID="RequiredFieldValidator1" 
                         runat="server"  
                         ControlToValidate="txt_date_end" 
                         Display="Static" 
                         Text="Введите данные" 
                         BackColor="#ff0000" 
                         ValidationGroup="Owner">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>

            <!--Кнопка изменения !-->
            <tr>
                <td>
                    <asp:Button 
                        ID="but_add_peoples" 
                        runat="server" 
                        Text="Изменить" 
                        ValidationGroup="Owner" 
                        OnClick="but_add_peoples_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
