<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fileupload_autopostback.aspx.cs"
    Inherits="FineUI.Examples.form.fileupload_autopostback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <style>
        .photo {
            height: 150px;
            line-height: 150px;
            overflow: hidden;
        }

            .photo img {
                height: 150px;
                vertical-align: middle;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <x:PageManager ID="PageManager1" runat="server" />
        <x:SimpleForm ID="SimpleForm1" BodyPadding="5px" runat="server" Width="550px" EnableFrame="true" EnableCollapse="true"
            ShowBorder="True" Title="表单" ShowHeader="True">
            <Items>
                <x:Image ID="imgPhoto" CssClass="photo" ImageUrl="~/images/blank.png" ShowEmptyLabel="true" runat="server">
                </x:Image>
                <x:FileUpload runat="server" ID="filePhoto" ShowRedStar="false" ShowEmptyLabel="true"
                    ButtonText="上传个人头像" ButtonOnly="true" Required="false"
                    AutoPostBack="true" OnFileSelected="filePhoto_FileSelected">
                </x:FileUpload>
                <x:TextBox runat="server" Label="用户名" ID="tbxUserName" Required="true" ShowRedStar="true">
                </x:TextBox>
                <x:TextBox runat="server" Label="邮箱" ID="tbxEmail" Required="true" RegexPattern="EMAIL"
                    ShowRedStar="true">
                </x:TextBox>
                <x:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" ValidateForms="SimpleForm1"
                    Text="提交表单">
                </x:Button>
                <x:Label ID="labResult" EncodeText="false" runat="server">
                </x:Label>
            </Items>
        </x:SimpleForm>

    </form>
</body>
</html>
