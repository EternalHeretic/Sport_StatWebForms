<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shell.aspx.cs" Inherits="Sport_Stat.Shell" %>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    
    <script src="../Scripts/dataGridContext.js" ></script>
    <script src="../Scripts/sidemenu.js"></script>

    <div id="<%=tablename%>_tablemenu" class="sidemenu">
        <ul class="panel" role="navigation">
            <li>
                Редактирование
            </li>    
            <li>
                    <ul class="panel" role="navigation">
                        <li><a id="Edit<%=tablename%>">Редактировать</a></li>
                    </ul>
                </li>
        </ul>
    </div>
    <div id="<%=tablename%>_tablemenu2" class="sidemenu2" onclick="hideSideMenu('sidemenu')"></div>


        
    <div class="tableContent">
        <ul class="toolbar">
                <li>
                        <asp:Button ID="but_addper" runat="server" OnClick="But_addper_Click" Text="Добавить" />
                </li>
        </ul>
        
        <asp:GridView ID="Shells" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" BorderStyle="None" BorderWidth="1px" CellPadding="4" AllowPaging="True" CssClass="ui-grid" DataKeyNames="ShellId">
        <Columns>
            <asp:BoundField DataField="ShellId" HeaderText="ShellId" SortExpression="ShellId" ReadOnly="True" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound"/>
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
        ID="SqlDataSource2" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT * FROM [Shells] ORDER BY [shell_name]">
        
    </asp:SqlDataSource>



        
</asp:Content>