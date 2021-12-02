<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddParticipant.aspx.cs" Inherits="Sport_Stat.Add.AddParticipant" %>
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="HeadContent" 
    runat="server">
</asp:Content>


<asp:Content 
    ID="Content2"
    runat="server" 
    contentplaceholderid="FeaturedContent">

    <link rel="stylesheet" href="/Content/style.css">
    
    <script src="../Scripts/sidemenu.js"></script>
        

    <div>
        <br />
        <asp:TextBox runat="server" ID="txt_searh_participant" Height="19px"></asp:TextBox>    
        <asp:Button runat="server" ID="btn_searh_participant" Text="Поиск" Height="31px"/>
        
        <div class="tableContent">
        <asp:GridView 
             ID="gv_add_participant"
             runat="server"
             AutoGenerateColumns="False"
             DataSourceID="SqlDSParticipant"
             AllowPaging="True"
             AllowSorting="True"
             CssClass="ui-grid"
             >
            <%--ShowFooter="True"--%>
            <Columns>
                <asp:BoundField DataField="PeopleId" HeaderText="ID" SortExpression="PeopleId" ReadOnly="True" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" />

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkCtrl" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="second_name" HeaderText="Фамилия" SortExpression="second_name" />
                <asp:BoundField DataField="first_name" HeaderText="Имя" SortExpression="first_name" />
                <asp:BoundField DataField="middle_name" HeaderText="Отчество" SortExpression="middle_name" />
                <asp:BoundField DataField="birthday" HeaderText="Дата рождения" SortExpression="birthday" />
                <asp:BoundField DataField="city_name" HeaderText="Город" SortExpression="CityId" />

            </Columns>
            <HeaderStyle ForeColor="#CCCCFF" />
        </asp:GridView>
        </div>
        

        <asp:SqlDataSource ID="SqlDSParticipant" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Peoples] join [Cities] on [Cities].[CityId]=[Peoples].[CityId] ORDER BY [second_name], [first_name], [middle_name]"></asp:SqlDataSource>
        

        
        <div id="searh_participant" class="divContentSerchParticipant">
            <asp:Button runat="server" id="Button1" Text="Добавить" OnClick="Btn_ok_Click"/>
            <asp:Button runat="server" id="Button2" Text="Отмена"/>
            <asp:Label ID="lblmsg" runat="server"></asp:Label>
        </div>
           
    </div>
</asp:Content>

<asp:Content 
    ID="Content3" 
    ContentPlaceHolderID="MainContent" 
    runat="server">
</asp:Content>