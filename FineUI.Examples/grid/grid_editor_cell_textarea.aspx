﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_editor_cell_textarea.aspx.cs" ValidateRequest="false"
    Inherits="FineUI.Examples.grid.grid_editor_cell_textarea" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .x-grid-row .x-grid-cell-inner
        {
            white-space: normal;
            word-break: break-all;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="true" Width="850px" Height="450px"
            runat="server" DataKeyNames="Id,Name" AllowCellEditing="true" ClicksToEdit="1" DataIDField="Id">
            <Columns>
                <f:TemplateField Width="60px">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:RenderField Width="100px" ColumnID="Name" DataField="Name" FieldType="String"
                    HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="100px" ColumnID="Gender" DataField="Gender" FieldType="Int"
                    RendererFunction="renderGender" HeaderText="性别">
                    <Editor>
                        <f:DropDownList ID="ddlGender" Required="true" runat="server">
                            <f:ListItem Text="男" Value="1" />
                            <f:ListItem Text="女" Value="0" />
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="100px" ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int"
                    HeaderText="入学年份" Hidden="true">
                    <Editor>
                        <f:NumberBox ID="tbxEditorEntranceYear" NoDecimal="true" NoNegative="true" MinValue="2000"
                            MaxValue="2025" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="120px" ColumnID="LogTime" DataField="LogTime" FieldType="Date"
                    Renderer="Date" RendererArgument="yyyy-MM-dd" HeaderText="入学日期" Hidden="true">
                    <Editor>
                        <f:DatePicker ID="DatePicker1" Required="true" runat="server">
                        </f:DatePicker>
                    </Editor>
                </f:RenderField>
                <f:RenderCheckField Width="100px" ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" Hidden="true" />
                <f:RenderField Width="150px" ColumnID="Major" DataField="Major" FieldType="String"
                    HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="100px" ColumnID="Desc" HtmlEncode="false" DataField="Desc" FieldType="String"
                    ExpandUnusedSpace="true" HeaderText="个人简介">
                    <Editor>
                        <f:TextArea ID="TextArea1" Required="true" runat="server">
                        </f:TextArea>
                    </Editor>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
    </form>
    <script>

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }


    </script>
</body>
</html>
