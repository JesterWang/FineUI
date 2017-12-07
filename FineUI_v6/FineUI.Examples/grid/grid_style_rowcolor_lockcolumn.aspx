<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_style_rowcolor_lockcolumn.aspx.cs"
    Inherits="FineUI.Examples.data.grid_style_rowcolor_lockcolumn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        .x-grid-item.highlight td {
            background-color: lightgreen;
            background-image: none;
        }

        .x-grid-item-selected.highlight td {
            background-color: yellow;
            background-image: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" Title="表格" EnableCollapse="true" ShowBorder="true" ShowHeader="true" Width="800px"
            runat="server" EnableCheckBoxSelect="true" AllowColumnLocking="true" DataKeyNames="Id,Name" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="100px" EnableLock="true" Locked="true" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField EnableLock="true" Width="80px" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField EnableLock="true" Width="80px" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField EnableLock="true" Width="80px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField EnableLock="true" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="True" />
                <f:ImageField EnableLock="true" Width="80px" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                    HeaderText="分组">
                </f:ImageField>
            </Columns>
        </f:Grid>
        <br />
        <br />
        注：这个表格高亮选中了所有[入学年份]大于等于2006的数据行。
        <br />
        <br />
        <f:Button ID="Button1" runat="server" Text="重新绑定表格" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <br />
        <br />

        <f:HiddenField ID="highlightRows" runat="server">
        </f:HiddenField>
    </form>
    <script src="../res/js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var highlightRowsClientID = '<%= highlightRows.ClientID %>';
        var gridClientID = '<%= Grid1.ClientID %>';

        function highlightRows() {
            // 增加延迟，等待HiddenField更新完毕
            window.setTimeout(function () {
                var highlightRows = F(highlightRowsClientID);
                var grid = F(gridClientID);

                $(grid.el.dom).find('.x-grid-item.highlight').removeClass('highlight');

                $.each(highlightRows.getValue().split(','), function (index, item) {
                    if (item) {
                        var rowIndex = parseInt(item, 10);
                        var row = grid.getView().getNode(rowIndex);
                        $(row).addClass('highlight');
                        // 锁定列
                        var lockedRow = grid.getView().lockedView.getNode(rowIndex);
                        $(lockedRow).addClass('highlight');
                    }
                });
            }, 100);
        }

        // 页面第一个加载完毕后执行的函数
        F.ready(function () {

            var grid = F(gridClientID);

            grid.on('columnhide', function () {
                highlightRows();
            });

            grid.on('columnshow', function () {
                highlightRows();
            });

            grid.getStore().on('refresh', function () {
                highlightRows();
            });

            highlightRows();

        });

    </script>
</body>
</html>
