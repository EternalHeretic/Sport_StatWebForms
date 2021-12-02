<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sport_Stat._Default" %>
<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    
    <script src="../Scripts/sidemenu.js"></script>
       

</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   
        <asp:HyperLink
            ID="HyperLinkNews" 
            runat="server" 
            Text="Последние новости по спортивной гимнастики!!!"
            NavigateUrl="http://sportgymrus.ru/"
            CssClass="HLNews">
        </asp:HyperLink>

    <div class="tableContent">
    
    <asp:Label ID="lbldefaultcom" runat="server" Text="Все соревнования" CssClass="lbldefaultcom"></asp:Label>
    
         <asp:GridView 
            ID="gv_all_copetition" 
            runat="server" 
            AutoGenerateColumns="False" 
            DataKeyNames="CompetitionId,CityId1" 
            DataSourceID="SqlDataSourceDefaultCom"
            AllowSorting="True"
            BorderStyle="None" 
            BorderWidth="1px" 
            CellPadding="4" 
            AllowPaging="True" 
            CssClass="ui-grid" 
            PageSize="4">
            <Columns>
                <asp:BoundField DataField="CompetitionId" HeaderText="CompetitionId" ReadOnly="True" SortExpression="CompetitionId" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound"/>
                <asp:BoundField DataField="competition_name" HeaderText="Название" SortExpression="competition_name" />
                <asp:BoundField DataField="CityId" HeaderText="CityId" SortExpression="CityId" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" />
                <asp:BoundField DataField="data_start" HeaderText="Дата начала" SortExpression="data_start" />
                <asp:BoundField DataField="data_end" HeaderText="Дата окончания" SortExpression="data_end" />
                <asp:BoundField DataField="CityId1" HeaderText="CityId1" ReadOnly="True" SortExpression="CityId1" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" />
                <asp:BoundField DataField="city_name" HeaderText="Город" SortExpression="city_name" />
                <asp:BoundField DataField="RegionId" HeaderText="RegionId" SortExpression="RegionId" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" />
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
            ID="SqlDataSourceDefaultCom" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            SelectCommand="SELECT * FROM [Competitions] join [Cities] on [Cities].[CityId]=[Competitions].[CityId]">

        </asp:SqlDataSource>

</asp:Content>
