<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="FineUI.Examples.test.test" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../res/css/main.css" rel="stylesheet" type="text/css" />
    <style>
        .margin_right {
            margin-right: 10px;
        }

        .type {
            border: 1px solid blue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form runat="server" ID="Form2" ShowBorder="false"
            ShowHeader="false" BodyPadding="5px" LabelAlign="Right" LabelWidth="100px">
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:Button ID="Button1" runat="server" Text="查 询">
                        </f:Button>
                        <f:Button ID="Button2" runat="server" Text="查 询">
                        </f:Button>
                        <f:Button ID="Button3" runat="server" Text="查 询">
                        </f:Button>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>

    </form>
</body>
</html>
