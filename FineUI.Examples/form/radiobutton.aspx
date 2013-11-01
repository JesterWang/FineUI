<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="radiobutton.aspx.cs" Inherits="FineUI.Examples.form.radiobutton" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <x:PageManager ID="PageManager1" runat="server" />
        <x:SimpleForm ID="SimpleForm1" Width="700px" runat="server" LabelWidth="150px" Title="简单表单" EnableFrame="true" EnableCollapse="true"
            BodyPadding="5px" ShowBorder="True" ShowHeader="True">
            <Items>
                <x:RadioButton ID="rbtnSingleRadio" Label="单选框" Text="可选项" runat="server">
                </x:RadioButton>
                <x:Button ID="btnSelectSingleRadio" Text="选择/反选上面的单选框" OnClick="btnSelectSingleRadio_Click"
                    runat="server">
                </x:Button>
                <x:Label runat="server" ShowEmptyLabel="true">
                </x:Label>
                <x:RadioButton ID="rbtnFirst" Label="单选框（分组）" Checked="true" GroupName="MyRadioGroup1"
                    Text="可选项 1" runat="server">
                </x:RadioButton>
                <x:RadioButton ID="rbtnSecond" GroupName="MyRadioGroup1" ShowEmptyLabel="true" Text="可选项 2" runat="server">
                </x:RadioButton>
                <x:RadioButton ID="rbtnThird" GroupName="MyRadioGroup1" ShowEmptyLabel="true" Text="可选项 3" runat="server">
                </x:RadioButton>
                <x:Button ID="btnSelectSecondRadio" Text="选中分组单选框中的下一个" OnClick="btnSelectSecondRadio_Click"
                    runat="server">
                </x:Button>
                <x:Label ID="Label1" runat="server" ShowEmptyLabel="true">
                </x:Label>
                <x:RadioButton ID="rbtnFirstAuto" Label="单选框（自动回发）" Checked="true" GroupName="MyRadioGroup2"
                    Text="可选项 1" runat="server" OnCheckedChanged="rbtnAuto_CheckedChanged" AutoPostBack="true">
                </x:RadioButton>
                <x:RadioButton ID="rbtnSecondAuto" GroupName="MyRadioGroup2" ShowEmptyLabel="true" Text="可选项 2" runat="server"
                    OnCheckedChanged="rbtnAuto_CheckedChanged" AutoPostBack="true">
                </x:RadioButton>
                <x:RadioButton ID="rbtnThirdAuto" GroupName="MyRadioGroup2" ShowEmptyLabel="true" Text="可选项 3" runat="server"
                    OnCheckedChanged="rbtnAuto_CheckedChanged" AutoPostBack="true">
                </x:RadioButton>
            </Items>
        </x:SimpleForm>
    </form>
</body>
</html>
