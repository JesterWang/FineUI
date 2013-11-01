<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="textbox_autopostback.aspx.cs"
    Inherits="FineUI.Examples.form.textbox_autopostback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <x:PageManager ID="PageManager1" runat="server" />
        <x:SimpleForm ID="SimpleForm1" BodyPadding="5px" runat="server" LabelAlign="Top" EnableFrame="true" EnableCollapse="true"
            Title="简单表单" Width="550px" ShowHeader="True">
            <Items>
                <x:TextBox runat="server" ID="TextBox1" Label="文本框一（自动回发）" EmptyText="输入字符会立即触发TextChanged事件"
                    AutoPostBack="true" OnTextChanged="TextBox1_TextChanged">
                </x:TextBox>
                <x:TextBox ID="TextBox2" runat="server" Label="文本框二" OnTextChanged="TextBox2_TextChanged" EmptyText="输入字符后点击提交按钮，会触发TextChanged事件">
                </x:TextBox>
                <x:TextBox runat="server" ID="TextBox3" Label="文本框三（失去焦点事件）" EmptyText="输入字符后失去焦点，会触发Blur事件"
                    EnableBlurEvent="true" OnBlur="TextBox3_Blur">
                </x:TextBox>
                <x:Button runat="server" Text="提交">
                </x:Button>
                <x:Label ID="labResult" EncodeText="false" runat="server">
                </x:Label>
            </Items>
        </x:SimpleForm>
        <br />

    </form>
</body>
</html>
