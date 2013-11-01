<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_groupheader.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_groupheader" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <x:PageManager ID="PageManager1" runat="server" />
        <x:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格" EnableFrame="true" EnableCollapse="true" Width="800px" runat="server"
            DataKeyNames="Guid" ForceFitAllTime="true">
            <Columns>
                <x:GroupField HeaderText="安徽省" TextAlign="Center">
                    <Columns>
                        <x:GroupField HeaderText="合肥市" TextAlign="Center">
                            <Columns>
                                <x:BoundField Width="100px" DataField="AHData1" HeaderText="数据一" />
                                <x:BoundField Width="100px" DataField="AHData2" HeaderText="数据二" />
                            </Columns>
                        </x:GroupField>
                    </Columns>
                </x:GroupField>
                <x:GroupField HeaderText="河南省">
                    <Columns>
                        <x:GroupField HeaderText="驻马店市">
                            <Columns>
                                <x:BoundField Width="100px" DataField="HZData1" HeaderText="数据一" />
                                <x:BoundField Width="100px" DataField="HZData2" HeaderText="数据二" />
                            </Columns>
                        </x:GroupField>
                        <x:GroupField HeaderText="漯河市">
                            <Columns>
                                <x:BoundField Width="100px" DataField="HLData1" HeaderText="数据一" />
                                <x:BoundField Width="100px" DataField="HLData2" HeaderText="数据二" />
                            </Columns>
                        </x:GroupField>
                    </Columns>
                </x:GroupField>
                <x:BoundField BoxFlex="1" DataField="LogTime" DataFormatString="{0:yyyy-MM-dd}" HeaderText="记录时间" />
            </Columns>
        </x:Grid>
        <br />
        <br />
    </form>
</body>
</html>
