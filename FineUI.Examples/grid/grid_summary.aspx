<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_summary.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_summary" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <style>
        .mygrid-row-summary .x-grid-td, .mygrid-row-summary.x-grid-row-focused .x-grid-td {
            background-color: #fafafa;
            font-weight: bold;
            color: red;
        }
        .mygrid-row-summary .x-grid-cell-row-checker .x-grid-cell-inner, .mygrid-row-summary .x-grid-cell-row-numberer .x-grid-cell-inner {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <x:PageManager ID="PageManager1" runat="server" />
        <x:Grid ID="Grid1" Title="表格" EnableFrame="true" EnableCollapse="true" Width="800px" Height="350px" PageSize="5" ShowBorder="true"
            ShowHeader="true" AllowPaging="true" runat="server" EnableCheckBoxSelect="True"
            DataKeyNames="Id,Name" IsDatabasePaging="true" OnPageIndexChange="Grid1_PageIndexChange">
            <Columns>
                <x:RowNumberField />
                <x:BoundField Width="100px" ColumnID="name" DataField="Name" DataFormatString="{0}"
                    HeaderText="姓名" />
                <x:TemplateField Width="80px" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </x:TemplateField>
                <x:BoundField Width="80px" DataField="EntranceYear" HeaderText="入学年份" />
                <x:CheckBoxField Width="80px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <x:HyperLinkField HeaderText="所学专业" ColumnID="major" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    DataNavigateUrlFieldsEncode="true" Target="_blank" ExpandUnusedSpace="True" />
                <x:BoundField Width="100px" DataField="Donate" ColumnID="donate" HeaderText="捐赠金额" />
            </Columns>
        </x:Grid>
        <br />
        <x:Button ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </x:Button>
        <br />
        <x:Label ID="labResult" EncodeText="false" runat="server">
        </x:Label>
    </form>
    <script>

        var gridClientID = '<%= Grid1.ClientID %>';

        function calcGridSummary(grid) {
            var donateTotal = 0, store = grid.getStore(), view = grid.getView(), storeCount = store.getCount();

            // 防止重复添加了合计行
            if (Ext.get(view.getNode(storeCount - 1)).hasCls('mygrid-row-summary')) {
                return;
            }

            // 遍历每一行数据，计算汇总数据
            store.each(function (record) {
                // 注：donate是列的ColumnID属性
                donateTotal += parseInt(record.data["donate"]);
            });
            var donateAvg = donateTotal / storeCount;

            store.add({
                'major': '合计：',
                'donate': donateTotal.toFixed(2)
            });

            store.add({
                'major': '平均：',
                'donate': donateAvg.toFixed(2)
            });


            // 为合计行添加自定义样式（隐藏序号列、复选框列，取消 hover 和 selected 效果）
            Ext.get(view.getNode(storeCount)).addCls('mygrid-row-summary');
            Ext.get(view.getNode(storeCount + 1)).addCls('mygrid-row-summary');
        }

        // 页面第一个加载完毕后执行的函数
        function onReady() {
            var grid = X(gridClientID);
            calcGridSummary(grid);

            // 防止选中合计行
            grid.addListener('beforeselect', function (sm, record, rowIndex) {
                if (Ext.get(grid.getView().getNode(rowIndex)).hasCls('mygrid-row-summary')) {
                    return false;
                }
                return true;
            });
        }

        // 页面AJAX回发后执行的函数
        function onAjaxReady() {
            var grid = X(gridClientID);
            calcGridSummary(grid);
        }
    </script>
</body>
</html>
