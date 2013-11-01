﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_prerowdatabound.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_prerowdatabound" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <x:PageManager ID="PageManager1" runat="server" />
        <x:Grid ID="Grid1" Title="表格" EnableFrame="true" EnableCollapse="true" PageSize="3" ShowBorder="true" ShowHeader="true"
            Width="800px" OnPreRowDataBound="Grid1_PreRowDataBound" runat="server"
            EnableCheckBoxSelect="True" DataKeyNames="Id,Name" OnRowCommand="Grid1_RowCommand">
            <Columns>
                <x:RowNumberField />
                <x:BoundField Width="100px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <x:TemplateField Width="80px" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </x:TemplateField>
                <x:BoundField Width="80px" DataField="EntranceYear" HeaderText="入学年份" />
                <x:CheckBoxField ColumnID="cbxAtSchool" TextAlign="Center" Width="80px" RenderAsStaticField="false" DataField="AtSchool"
                    HeaderText="是否在校" />
                <x:HyperLinkField ColumnID="hlMajor" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    DataNavigateUrlFieldsEncode="true" Target="_blank" ExpandUnusedSpace="True" />
                <x:ImageField Width="80px" Hidden="true" DataImageUrlField="Group" DataImageUrlFormatString="~/images/16/{0}.png"
                    HeaderText="分组"></x:ImageField>
                <x:LinkButtonField TextAlign="Center" ConfirmText="你确定要这么做么？" ConfirmTarget="Top"
                    ColumnID="lbfAction1" Width="60px" CommandName="Action1" Text="按钮" />
                <x:LinkButtonField TextAlign="Center" ConfirmText="你确定要这么做么？" Icon="Delete" ConfirmTarget="Top"
                    ColumnID="lbfAction2" HeaderText="&nbsp;" Width="60px" CommandName="Action2" />
            </Columns>
        </x:Grid>
        <br />
        <x:Label ID="labResult" EncodeText="false" runat="server">
        </x:Label>
        <br />
    </form>
</body>
</html>