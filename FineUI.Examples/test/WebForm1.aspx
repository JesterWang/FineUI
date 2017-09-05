<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="EmptyProjectNet40_FineUI.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="ageManager1" runat="server" />
        <f:Button Text="点击弹出对话框" runat="server" ID="btnHello">
        </f:Button>
        <f:Panel ID="anel1" runat="server" BodyPadding="5px" ShowBorder="true" ShowHeader="true" Title="anel">
            <Items>
                <f:Grid ID="Grid1" AllowSorting="true" SortField="Gender" SortDirection="ASC" runat="server">
                    <Columns>
                        <f:RowNumberField />
                        <f:BoundField Width="100px" SortField="Gender" DataField="Gender" DataFormatString="{0}"
                            HeaderText="性别" />
                    </Columns>
                </f:Grid>
            </Items>
        </f:Panel>
    </form>
</body>
</html>


<%--错误现象：不断上下点击客户名称就会报错，如果去掉所学专业或类型列前面不能有显示列就会正常。
--%>