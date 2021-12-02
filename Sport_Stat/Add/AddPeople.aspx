<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPeople.aspx.cs" Inherits="Sport_Stat.Add.AddPeople" %>
    

<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="HeadContent" 
    runat="server">
</asp:Content>

<asp:Content 
    ID="Content3" 
    ContentPlaceHolderID="MainContent" 
    runat="server">
</asp:Content>

<asp:Content 
    ID="Content2"
    runat="server" 
    contentplaceholderid="FeaturedContent">

    <link rel="stylesheet" href="../Content/themes/base/jquery-ui-datepicker.css">
    <link rel="stylesheet" href="../Content/style.css">
   
    <script src="../Scripts/Datepicker/jquery-1.12.4.js" type="text/javascript"></script>
    <script src="../Scripts/Datepicker/jquery-ui.js" type="text/javascript"></script>
    <%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
   --%> 
    <script>
        $(function () {
            $("#<%=txt_birthday.ClientID%>").datepicker({
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
            <!--Имя!-->
            <tr>
                <td>
                    <asp:Label 
                        ID="Label1" 
                        runat="server" 
                        Text="Имя"
                        CssClass="ui-label-text">
                    </asp:Label>
                </td>
            </tr>

            <!--Бокс с именем!-->            
            <tr>
                <td>
                    <asp:TextBox 
                        ID="txt_name" 
                        runat="server"
                        CssClass="ui-textbox-text">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator 
                         ID="RequiredFieldValidator1" 
                         runat="server"  
                         ControlToValidate="txt_name" 
                         Display="Static" 
                         Text="Введите данные" 
                         BackColor="#ff0000" 
                         ValidationGroup="Owner">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>

            <!--Фамилия!-->
            <tr>
                <td>
                    <asp:Label 
                        ID="Label2" 
                        runat="server" 
                        Text="Фамилия"
                        CssClass="ui-label-text">
                    </asp:Label>
                </td>
            </tr>

            <!--Бокс с фамилией!-->
            <tr>
                <td>
                    <asp:TextBox 
                        ID="txt_familiya" 
                        runat="server"
                        CssClass="ui-textbox-text">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator 
                         ID="RequiredFieldValidator2" 
                         runat="server"  
                         ControlToValidate="txt_familiya" 
                         Display="Static" 
                         Text="Введите данные" 
                         BackColor="#ff0000" 
                         ValidationGroup="Owner">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>

            <!--Отчество!-->
            <tr>
                <td>
                    <asp:Label 
                        ID="Label3" 
                        runat="server" 
                        Text="Отчество"
                        CssClass="ui-label-text">
                    </asp:Label>
                </td>
            </tr>

            <!--Бокс с отчеством!-->
            <tr>
                <td>
                    <asp:TextBox 
                        ID="txt_otchestvo" 
                        runat="server"
                        CssClass="ui-textbox-text">
                    </asp:TextBox>
                </td>
            </tr>

            <!--Пол!-->
            <tr>
                <td>
                        <asp:Label 
                            ID="Label11" 
                            runat="server" 
                            Text="Пол"
                            CssClass="ui-label-text">
                        </asp:Label>
                </td>
            </tr>
            <!--Пол М!-->
            <tr>
                <td>
                    <input type="radio" name="rdo_gender" value="М" runat="server" id="rdo_gender_m" style="display:inline-block"/>
                    <asp:Label Text="Мужчина" runat="server" ID="labelM" CssClass="ui-label-text"></asp:Label>               
                </td>
            </tr>
            <!--Пол Ж!-->
            <tr>
                <td>
                    <input type="radio" name="rdo_gender" value="Ж" runat="server" id="rdo_gender_w" style="display:inline-block"/>
                    <asp:Label Text="Женщина" runat="server" ID="labelW" CssClass="ui-label-text"></asp:Label>
                </td>
            </tr>
           
            <!--День рождения!-->
            <tr>
                <td>
                    <asp:Label 
                        ID="Label_birthday" 
                        runat="server" 
                        Text="День рождения"
                        CssClass="ui-label-text"> 
                    </asp:Label>
                </td>
            </tr>

            <!--День рождения TextBox!-->
            <tr>
                <td>
                    <asp:TextBox runat="server" ID="txt_birthday" CssClass="ui-textbox-text"></asp:TextBox>
                </td>
            </tr>

            <!--Страна Округ Область Город!-->
            <tr>
                <td>
                    <asp:DropDownList 
                        ID="cbo_Country" 
                        runat="server" 
                        OnSelectedIndexChanged="Cbo_Country_SelectedIndexChanged" 
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
                        OnSelectedIndexChanged="Cbo_Countis_SelectedIndexChanged" 
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
                        OnSelectedIndexChanged="Cbo_Regions_SelectedIndexChanged" 
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

            <!--Номер телефона!-->
            <tr>
                <td>
                    <asp:Label 
                        ID="Label8"
                        runat="server" 
                        Text="Номер телефона"
                        CssClass="ui-label-text">
                    </asp:Label>
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:TextBox 
                        ID="txt_n_phone" 
                        runat="server"
                        CssClass="ui-textbox-text">
                    </asp:TextBox> 
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator4"
                        runat="server"  
                        ControlToValidate="txt_n_phone" 
                        Display="Static" 
                        Text="Введите данные" 
                        BackColor="#ff0000" 
                        ValidationGroup="Owner">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
           
            <!--Фото !-->
            <tr>
                <td>
                    <asp:Label 
                        ID="Label4" 
                        runat="server" 
                        Text="Фото"
                        CssClass="ui-label-text">
                    </asp:Label>
                </td>
            </tr>
            
            <!--Форма загрузки фото!-->
            <tr>
                <td>
                    <asp:FileUpload 
                    runat ="server" 
                    ID="fu_photo"
                        CssClass="ui-loadFile-text"/>
                </td>
            </tr>

            <!--Кнопка Занести!-->
            <tr>
                <td>
                    <asp:Button 
                        ID="but_add_peoples" 
                        runat="server" Text="Занести" 
                        ValidationGroup="Owner" 
                        OnClick="But_add_peoples_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
