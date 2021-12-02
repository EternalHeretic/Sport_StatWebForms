<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Competition.aspx.cs" Inherits="Sport_Stat.Competition" %>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
 
        <script src="../Scripts/dataGridContext.js" ></script>
        <script src="../Scripts/sidemenu.js"></script>

        <div id="<%=tablename%>_tablemenu" class="sidemenu">
            
            <ul class="panel" role="navigation">             
                <li>
                    <button id="first-link">Редактирование</button>
                    <ul class="panel" role="navigation">
                        <li><a id="Edit<%=tablename%>">Редактировать</a></li>
                    </ul>
                </li>

                <li>
                    <button id="second-link">Добавление</button>
                    <ul class="panel" role="navigation">
                        <li><a class="dynalink" id="<%=tablename1%>">Добавить участников</a></li>
                    </ul>
                </li>
                <asp:Button ID="btn_exle" runat="server" Text="Отчёт (Мандатная)" OnClick="btn_exle_Click" />
                <asp:Button ID="Button1" runat="server" Text="Отчёт (Результаты 1-го дня)" OnClick="btn_exle_Click" />
                <asp:Button ID="Button2" runat="server" Text="Отчёт (Результаты 2-го дня)" OnClick="btn_exle_Click" />
                <asp:Button ID="Button3" runat="server" Text="Отчёт (Финалы 3-го дня)" OnClick="btn_exle_Click" />
                <asp:Button ID="Button4" runat="server" Text="Отчёт (Результаты 1-го дня 'командная')" OnClick="btn_exle_Click" />
                <asp:Button ID="Button5" runat="server" Text="Отчёт (Результаты 2-го дня 'командная')" OnClick="btn_exle_Click" />
                <asp:Button ID="Button6" runat="server" Text="Отчёт (Финалы 3-го дня 'командная')" OnClick="btn_exle_Click" />
            </ul>
        </div>
        <div id="<%=tablename%>_tablemenu2" class="sidemenu2" onclick="hideSideMenu('sidemenu')"></div>



        <div class="tableContent">
           <ul class="toolbar">
               <li>
                   <asp:Button ID="but_addper" runat="server" OnClick="but_addper_Click" Text="Добавить" />
               </li>
           </ul> 
    
        <asp:GridView ID="Competitions" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" BorderStyle="None" BorderWidth="1px" CellPadding="4" AllowPaging="True" CssClass="ui-grid" PageSize="4" DataKeyNames="CompetitionId">
        <Columns>
            <asp:BoundField DataField="CompetitionId" HeaderText="CompetitionId" SortExpression="CompetitionId" ReadOnly="True" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" />
            <asp:BoundField DataField="competition_name" HeaderText="Название" SortExpression="competition_name" />
            <asp:BoundField DataField="city_name" HeaderText="Город" SortExpression="CityId" />
            <asp:BoundField DataField="data_start" HeaderText="Дата начала" SortExpression="data_start" />
            <asp:BoundField DataField="data_end" HeaderText="Дата окончания" SortExpression="data_end" />
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
            ID="SqlDataSource2" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            SelectCommand="SELECT * FROM [Competitions] join [Cities] on [Cities].[CityId]=[Competitions].[CityId]" DeleteCommand="DELETE FROM [Competitions] WHERE [CompetitionId] = @CompetitionId" InsertCommand="INSERT INTO [Competitions] ([CompetitionId], [competition_name], [CityId], [data_start], [data_end]) VALUES (@CompetitionId, @competition_name, @CityId, @data_start, @data_end)" UpdateCommand="UPDATE [Competitions] SET [competition_name] = @competition_name, [CityId] = @CityId, [data_start] = @data_start, [data_end] = @data_end WHERE [CompetitionId] = @CompetitionId">
            <DeleteParameters>
                <asp:Parameter Name="CompetitionId" Type="Object" />
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
                <asp:Parameter Name="CompetitionId" Type="Object" />
            </UpdateParameters>
            
        
    </asp:SqlDataSource>

</asp:Content>

