<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkbox.aspx.cs" Inherits="FineUI.Examples.form.checkbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <x:PageManager ID="PageManager1" runat="server" />
        <x:SimpleForm ID="SimpleForm1" BodyPadding="5px" Width="550px" EnableFrame="true" EnableCollapse="true"
            Title="简单表单" FooterBarAlign="Left" runat="server">
            <Items>
                <x:CheckBox ID="CheckBox2" ShowLabel="false" runat="server" Text="复选框" Checked="True">
                </x:CheckBox>
                <x:Button ID="btnSelectCheckBox" Text="选择/反选上面的复选框" OnClick="btnSelectCheckBox_Click"
                    runat="server">
                </x:Button>
                <x:Label ID="Label1" runat="server" ShowEmptyLabel="true">
                </x:Label>
                <x:CheckBox ID="CheckBox1" ShowLabel="false" runat="server" Text="自动回发的复选框（AutoPostBack=True）" OnCheckedChanged="CheckBox1_CheckedChanged"
                    Checked="True" AutoPostBack="True">
                </x:CheckBox>
                <x:Label ID="labResult" runat="server" ShowLabel="false">
                </x:Label>

            </Items>

        </x:SimpleForm>
    </form>
</body>
</html>
