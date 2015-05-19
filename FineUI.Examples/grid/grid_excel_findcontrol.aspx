﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_excel_findcontrol.aspx.cs" Inherits="FineUI.Examples.data.grid_excel_findcontrol" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../res/css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" Title="表格" EnableCollapse="true" ShowBorder="true" ShowHeader="true" Width="900px"
            runat="server" DataKeyNames="Id,Name">
            <Columns>
                <f:TemplateField ColumnID="tfNumber" Width="60px">
                    <ItemTemplate>
                        <asp:Label ID="labNumber" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="100px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="tfGender" Width="80px" HeaderText="性别" TextAlign="Center">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="labGender" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="80px" DataField="EntranceYear" HeaderText="入学年份" TextAlign="Center" />
                <f:CheckBoxField ColumnID="cbfAtSchool" Width="80px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="True" />
                <f:ImageField ColumnID="ifGroup" Width="80px" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                    HeaderText="分组">
                </f:ImageField>
                <f:BoundField Width="100px" DataField="LogTime" DataFormatString="{0:yy-MM-dd}"
                    HeaderText="注册日期" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button2" CssClass="marginr" runat="server" Text="重新绑定表格" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" EnableAjax="false" DisableControlBeforePostBack="false"
            runat="server" Text="导出为Excel文件" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <br />
    </form>
</body>
</html>
