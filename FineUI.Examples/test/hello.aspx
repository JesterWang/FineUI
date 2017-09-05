<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="hello.aspx.cs" Inherits="EmptyProjectNet20.hello" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" Title="Grid" ShowHeader="false" ShowBorder="false"
            DataKeyNames="编号,识别" EnableRowDoubleClickEvent="true" OnRowDoubleClick="Grid1_RowDoubleClick">
            <Columns>
                <f:BoundField DataField="编号" Width="70px" HeaderText="编号" ExpandUnusedSpace="true"
                    ID="ctl02" ColumnID="Window1_RegionPanel1_Region1_Panel2_Grid1_ctl02">
                </f:BoundField>
            </Columns>
        </f:Grid>
    </form>
</body>
</html>
