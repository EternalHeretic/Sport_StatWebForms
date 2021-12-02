<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Judging.aspx.cs" Inherits="Sport_Stat.Judging"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    
    <script src="../Scripts/dataGridContextJudging.js" ></script>
    <script src="../Scripts/sidemenu.js"></script>
    
    <div class="divContentSerchParticipant">
    <asp:Label ID="LblCopmetition" runat="server" Text="Соревнования"></asp:Label><br />
    <asp:Label ID="LblShell" runat="server" Text="Текущее снаряд"></asp:Label><br />
    <asp:Label ID="LblTeam" runat="server" Text="Команда"></asp:Label><br />
<%--    <asp:Label ID="lbl_userid" runat="server" Text="UserID"></asp:Label>--%>
    </div>
    <div class="tableContent">
    <asp:GridView 
        ID="gv_Referee_Judging" 
        runat="server" 
        DataSourceID="SqlDataSourceParticipantJudging" 
        AllowSorting="True" 
        AutoGenerateColumns="False" 
        BorderStyle="None" 
        BorderWidth="1px" 
        RowDataBound = "gv_Referee_Judging_RowDataBound"
        CellPadding="4" 
        AllowPaging="True" 
        CssClass="ui-grid" OnSelectedIndexChanged="gv_Referee_Judging_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="ParticipantId" HeaderText="ParticipantId" SortExpression="ParticipantId" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound"></asp:BoundField>
            <asp:BoundField DataField="ResultId" HeaderText="ResultId" SortExpression="ResultId" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound"></asp:BoundField>
            <asp:BoundField DataField="CompetitionId" HeaderText="CompetitionId" SortExpression="CompetitionId" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" ></asp:BoundField>
            <asp:BoundField DataField="PeopleId" HeaderText="PeopleId" SortExpression="PeopleId" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" ></asp:BoundField>
            <asp:BoundField DataField="PeopleId1" HeaderText="PeopleId1" SortExpression="PeopleId1" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound" ></asp:BoundField>
            <asp:BoundField DataField="second_name" HeaderText="Фамилия" SortExpression="second_name" />
            <asp:BoundField DataField="first_name" HeaderText="Имя" SortExpression="first_name" />
            <asp:BoundField DataField="middle_name" HeaderText="Отчество" SortExpression="middle_name" />
            <asp:BoundField DataField="N_participant" HeaderText="Номер участника" SortExpression="N_participant" />
            <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound"></asp:BoundField>
            <asp:BoundField DataField="CityId" HeaderText="CityId" SortExpression="CityId" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound"></asp:BoundField>
            <asp:BoundField DataField="birthday" HeaderText="birthday" SortExpression="birthday" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound"></asp:BoundField>
            <asp:BoundField DataField="N_phone" HeaderText="N_phone" SortExpression="N_phone" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound"></asp:BoundField>
            <asp:BoundField DataField="RefereeId" HeaderText="RefereeId" SortExpression="RefereeId" ItemStyle-CssClass="shadow_fist_bound" HeaderStyle-CssClass="shadow_fist_bound"></asp:BoundField>
            <asp:BoundField DataField="rating" HeaderText="Оценка" SortExpression="rating" />
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
        ID="SqlDataSourceParticipantJudging"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
        SelectCommand="SELECT * FROM [Participants] join [Peoples] on [Peoples].[PeopleId]=[Participants].[PeopleId] left join [Results] on [Results].[ParticipantId]=[Participants].[ParticipantId]"></asp:SqlDataSource>
    
    <asp:Button ID="btn_end_judging" runat="server" Text="Завершить судейство" CssClass="divContentBtnEndJudging" OnClick="btn_end_judging_Click" />
    

    <%--<asp:Panel ID="popupPanel" runat="server" CssClass="popup">
        <div class="scoreparticipatns">
            <asp:Label
                ID="lblusertest"
                runat="server"
                Text="Оценка"
                CssClass="lblusertest">
            </asp:Label>
            <br />
            <asp:RadioButton
                ID="rbt_score"
                runat="server"
                CssClass="onestroka"
                Checked="True"
                GroupName="score" />

            <asp:TextBox
                ID="txtusertest"
                runat="server"
                CssClass="onestroka">
            </asp:TextBox>
            <br />

            <asp:RadioButton
                ID="rbt_bolezn"
                runat="server"
                CssClass="lblbolezn"
                GroupName="score" />

            <asp:Label
                ID="lbl_bolezn"
                runat="server"
                Text="Болен"
                CssClass="lblbolezn">
            </asp:Label>
            <br />

            <asp:RadioButton
                ID="rbt_neyavka"
                runat="server"
                CssClass="lblneyavka"
                GroupName="score" />

            <asp:Label
                ID="lbl_neyavka"
                runat="server"
                Text="Неявка"
                CssClass="lblneyavka">
            </asp:Label>
            <br />

            <asp:Button
                ID="btnusertest"
                runat="server"
                Text="Поставить" OnClick="btnusertest_Click" />
            <asp:Button
                ID="btn_cancel"
                runat="server"
                Text="Отмена" />
        </div>
    </asp:Panel>
    
    <ajaxToolkit:ModalPopupExtender
        ID="ModalPopupExtender1"
        runat="server"
        PopupControlID="popupPanel"
        TargetControlID="gv_Referee_Judging"
        OkControlID="btnusertest"
        BackgroundCssClass="contentpopup">
    </ajaxToolkit:ModalPopupExtender>--%>


   <asp:TextBox ID="txt_refereeid" runat="server" CssClass="shadow_fist_bound" Text=""></asp:TextBox>
    </asp:Content>
<asp:Content ContentPlaceHolderID="FeaturedContent1" ID="Content4" runat="server">
    <div id="prompt-form-container">
        <form id="prompt-form">
            <div id="prompt-message"></div>
            <input name="rbtn_1" id="rbtn1" type="radio" onchange="radiobuttonchecked(this)" checked>
            <label class="label_score">Оценка</label>
            <input type="text" name="text" id="text" class="disabled" value=""/><br>
            <input name="rbtn_1" id="rbtn2" type="radio" onchange="radiobuttonchecked(this)">
            <label class="label_bolezn">Болезнь</label><br>
            <input name="rbtn_1" id="rbtn3" type="radio" onchange="radiobuttonchecked(this)">
            <label class="label_neyavka">Неявка</label><br>
            <input type="submit" name="btn_ok" value="Ок">
            <input type="button" name="cancel" value="Отмена">
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
</asp:Content>
