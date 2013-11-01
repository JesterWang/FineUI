<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cssclass.aspx.cs"
    Inherits="FineUI.Examples.other.cssclass" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <style>
        .red input {
            color: Red;
            font-weight: bold;
        }

        .red label.x-form-item-label {
            color: Red;
            font-weight: bold;
        }


        .blue input {
            color: Blue;
            font-weight: bold;
        }

        .blue label.x-form-item-label {
            color: Blue;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <x:PageManager ID="PageManager1" runat="server" />
        <x:SimpleForm ID="SimpleForm1" BodyPadding="5px" Width="550px" EnableFrame="true" EnableCollapse="true"
            Title="简单表单" runat="server">
            <Items>
                <x:TextBox runat="server" Label="用户名" CssClass="red" EmptyText="输入用户名" Text="张三"
                    ID="tbxUseraName">
                </x:TextBox>
                <x:TextBox runat="server" Label="密码" CssClass="red" TextMode="Password"
                    ID="tbxPassword">
                </x:TextBox>
                <x:Button ID="btnSwitchClass" Text="切换样式" Type="Submit" runat="server" OnClick="btnSwitchClass_Click">
                </x:Button>
            </Items>
        </x:SimpleForm>
        <br />
    </form>
</body>
</html>
