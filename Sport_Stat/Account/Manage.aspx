<%@ Page Title="Управление учетной записью" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="Sport_Stat.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <script src="../Scripts/dataGridContextManage.js" ></script>
    <script src="../Scripts/sidemenu.js"></script>

    
    <div id="<%=tablename%>_tablemenu" class="sidemenu">
            
            <ul class="panel" role="navigation">             
                <li>
                    <button id="first-link">Судейство</button>
                    <ul class="panel" role="navigation">
                        <li><a id="<%=tablename%>">Начать судейство</a></li>
                    </ul>
                </li>

            </ul>
        </div>
        <div id="<%=tablename%>_tablemenu2" class="sidemenu2" onclick="hideSideMenu('sidemenu')"></div>



    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h4>Изменение параметров учетной записи</h4>
                <hr />
                <dl class="dl-horizontal">
                    <dt>Пароль:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Изменить]" Visible="false" ID="ChangePassword" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Создать]" Visible="false" ID="CreatePassword" runat="server" />
                    </dd>
                    <dt>Внешние имена входа:</dt>
                    <dd><%: LoginsCount %>
                        <asp:HyperLink NavigateUrl="/Account/ManageLogins" Text="[Управление]" runat="server" />

                    </dd>
                    <%--
                        Номера телефонов можно использовать в качестве второго проверочного фактора для системы двухфакторной аутентификации.
                        В <a href="https://go.microsoft.com/fwlink/?LinkId=403804">этой статье</a>
                        можно узнать, как для этого приложения ASP.NET настроить двухфакторную аутентификацию с использованием SMS.
                        Настроив двухфакторную аутентификацию, раскомментируйте следующие блоки.
                    --%>
                    <%--
                    <dt>Номер телефона:</dt>
                    <% if (HasPhoneNumber)
                       { %>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Добавить]" />
                    </dd>
                    <% }
                       else
                       { %>
                    <dd>
                        <asp:Label Text="" ID="PhoneNumber" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Изменить]" /> &nbsp;|&nbsp;
                        <asp:LinkButton Text="[Удалить]" OnClick="RemovePhone_Click" runat="server" />
                    </dd>
                    <% } %>
                    --%>

                    <dt>Двухфакторная проверка подлинности:</dt>
                    <dd>
                        <p>
                            Поставщики двухфакторной аутентификации не настроены. В <a href="https://go.microsoft.com/fwlink/?LinkId=403804">этой статье</a>
                можно узнать, как настроить двухфакторную аутентификацию для этого приложения ASP.NET.
                        </p>
                        <% if (TwoFactorEnabled)
                          { %> 
                        <%--
                        Enabled
                        <asp:LinkButton Text="[Отключить]" runat="server" CommandArgument="false" OnClick="TwoFactorDisable_Click" />
                        --%>
                        <% }
                          else
                          { %> 
                        <%--
                        Disabled
                        <asp:LinkButton Text="[Включить]" CommandArgument="true" OnClick="TwoFactorEnable_Click" runat="server" />
                        --%>
                        <% } %>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
    <div class="tableContent">
    <asp:GridView ID="Judging" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourcelk2" BorderStyle="None" BorderWidth="1px" CellPadding="4" AllowPaging="True" CssClass="ui-grid" PageSize="4" >
        <Columns>
            <asp:BoundField DataField="CompetitionId" HeaderText="CompetitionId" SortExpression="CompetitionId" ReadOnly="True" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" />
            <asp:BoundField DataField="competition_name" HeaderText="Название" SortExpression="competition_name" />
            <asp:BoundField DataField="CityId" HeaderText="CityId" SortExpression="CityId" ReadOnly="True" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" />
            <asp:BoundField DataField="data_start" HeaderText="Дата начала" SortExpression="data_start" />
            <asp:BoundField DataField="data_end" HeaderText="Дата окончания" SortExpression="data_end" />
           <asp:BoundField DataField="city_name" HeaderText="Город" SortExpression="city_name" />
            <asp:BoundField DataField="PeopleId" HeaderText="PeopleId" SortExpression="PeopleId" ReadOnly="True" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" />
            <asp:BoundField DataField="DayId" HeaderText="DayId" SortExpression="DayId" ReadOnly="True" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" />
            <asp:BoundField DataField="shell_name" HeaderText="Снаряд" SortExpression="shell_name" />
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
       <asp:SqlDataSource 
            ID="SqlDataSourcelk2" 
            runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM [Competitions] WHERE [CompetitionId] = @original_CompetitionId AND [competition_name] = @original_competition_name AND [CityId] = @original_CityId AND [data_start] = @original_data_start AND [data_end] = @original_data_end" 
            InsertCommand="INSERT INTO [Competitions] ([CompetitionId], [competition_name], [CityId], [data_start], [data_end]) VALUES (@CompetitionId, @competition_name, @CityId, @data_start, @data_end)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Competitions] join [Cities] on [Cities].[CityId]=[Competitions].[CityId] left join [Referee] on [Referee].[CompetitionId]=[Competitions].[CompetitionId] left join [Referee_Shell] on [Referee_Shell].[RefereeId]=[Referee].[RefereeId] left join [Shells] on [Referee_Shell].[ShellId]=[Shells].[ShellId]" 
            UpdateCommand="UPDATE [Competitions] SET [competition_name] = @competition_name, [CityId] = @CityId, [data_start] = @data_start, [data_end] = @data_end WHERE [CompetitionId] = @original_CompetitionId AND [competition_name] = @original_competition_name AND [CityId] = @original_CityId AND [data_start] = @original_data_start AND [data_end] = @original_data_end">
            <DeleteParameters>
                <asp:Parameter Name="original_CompetitionId" Type="Object" />
                <asp:Parameter Name="original_competition_name" Type="String" />
                <asp:Parameter Name="original_CityId" Type="Object" />
                <asp:Parameter DbType="Date" Name="original_data_start" />
                <asp:Parameter DbType="Date" Name="original_data_end" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CompetitionId" Type="Object" />
                <asp:Parameter Name="competition_name" Type="String" />
                <asp:Parameter Name="CityId" Type="Object" />
                <asp:Parameter DbType="Date" Name="data_start" />
                <asp:Parameter DbType="Date" Name="data_end" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="competition_name" Type="String" />
                <asp:Parameter Name="CityId" Type="Object" />
                <asp:Parameter DbType="Date" Name="data_start" />
                <asp:Parameter DbType="Date" Name="data_end" />
                <asp:Parameter Name="original_CompetitionId" Type="Object" />
                <asp:Parameter Name="original_competition_name" Type="String" />
                <asp:Parameter Name="original_CityId" Type="Object" />
                <asp:Parameter DbType="Date" Name="original_data_start" />
                <asp:Parameter DbType="Date" Name="original_data_end" />
            </UpdateParameters>
        </asp:SqlDataSource> 
</asp:Content>
