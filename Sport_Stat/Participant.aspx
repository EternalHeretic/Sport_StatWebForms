<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Participant.aspx.cs" Inherits="Sport_Stat.Participant" %>


<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
 
        <script src="../Scripts/dataGridContextParticipant.js" ></script>
        <script src="../Scripts/sidemenu.js"></script>
        <script src="../Scripts/PartificantButton.js"></script>

        <div id="<%=tablename%>_tablemenu" class="sidemenu">
            <ul class="panel" role="navigation">
                <li>
                    Редактирование
                </li>   
                 
                <li>
                    <ul class="panel" role="navigation">
                        <li><a id="<%=tablename%>">Удалить</a></li>
                    </ul>
                </li>

            </ul>
        </div>
        <div id="<%=tablename%>_tablemenu2" class="sidemenu2" onclick="hideSideMenu('sidemenu')"></div>



        <div class="tableContent">
           <ul class="toolbar">
               <li>
                   <asp:Button ID="but_addper" runat="server"  OnClick="But_addper_Click" Text="Добавить" />
               </li>
           </ul> 
    
        <asp:GridView ID="Participants" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" BorderStyle="None" BorderWidth="1px" CellPadding="4" AllowPaging="True" CssClass="ui-grid" DataKeyNames="ParticipantId,PeopleId1">
        <Columns>
            <asp:BoundField DataField="ParticipantId" HeaderText="ParticipantId" SortExpression="ParticipantId" ReadOnly="True" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound"></asp:BoundField>
            <asp:BoundField DataField="CompetitionId" HeaderText="CompetitionId" SortExpression="CompetitionId" ReadOnly="True" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" ></asp:BoundField>
            <asp:BoundField DataField="PeopleId" HeaderText="PeopleId" SortExpression="PeopleId" ReadOnly="True" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" ></asp:BoundField>
            <asp:BoundField DataField="second_name" HeaderText="Фамилия" SortExpression="second_name" />
            <asp:BoundField DataField="first_name" HeaderText="Имя" SortExpression="first_name" />
            <asp:BoundField DataField="middle_name" HeaderText="Отчество" SortExpression="middle_name" />
            <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" ReadOnly="True" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" ></asp:BoundField>
            <asp:BoundField DataField="city_name" HeaderText="Город" SortExpression="city_name"></asp:BoundField>
            <asp:BoundField DataField="N_participant" HeaderText="Номер участника" SortExpression="N_participant" />
            <asp:BoundField DataField="birthday" HeaderText="birthday" SortExpression="birthday" ReadOnly="True" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" ></asp:BoundField>
            <asp:BoundField DataField="N_phone" HeaderText="N_phone" SortExpression="N_phone" ReadOnly="True" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" >
</asp:BoundField>
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
            SelectCommand="SELECT * FROM [Participants] join [Peoples] on [Peoples].[PeopleId]=[Participants].[PeopleId] join [Cities] on [Peoples].[CityId]=[Cities].[CityId]  ">
            
        
    </asp:SqlDataSource>

</asp:Content>


