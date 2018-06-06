<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="layout_panel.aspx.cs" Inherits="FineUI.Examples.form.layout_panel" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .panel-in-formrow {
            margin-bottom: 5px;
            display: table;
            table-layout: fixed;
            border-spacing: 0;
            border-collapse: separate;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="SimpleForm1" BodyPadding="5px" Width="550px" LabelAlign="Left" LabelWidth="80px"
            Title="表单" runat="server">
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:TextBox ID="TextBox1" runat="server" Label="文本一">
                        </f:TextBox>
                        <f:Panel CssClass="panel-in-formrow" ShowBorder="false" runat="server">
                            <Items>
                                <f:Button ID="Button4" runat="server" Text="按钮一">
                                </f:Button>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRow6" runat="server">
                    <Items>
                        <f:TextBox ID="TextBox2" runat="server" Label="文本二">
                        </f:TextBox>
                        <f:Panel CssClass="panel-in-formrow" ShowBorder="false" runat="server">
                            <Items>
                                <f:Button ID="Button3" runat="server" Text="按钮二">
                                </f:Button>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRow7" runat="server">
                    <Items>
                        <f:TextBox ID="TextBox3" runat="server" Label="文本三">
                        </f:TextBox>
                        <f:Panel CssClass="panel-in-formrow" ShowBorder="false" runat="server">
                            <Items>
                                <f:Button ID="Button1" runat="server" Text="按钮三">
                                </f:Button>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRow8" runat="server">
                    <Items>
                        <f:TextBox ID="TextBox4" runat="server" Label="文本四">
                        </f:TextBox>
                        <f:Panel CssClass="panel-in-formrow" ShowBorder="false" runat="server">
                            <Items>
                                <f:Button ID="Button2" runat="server" Text="按钮四">
                                </f:Button>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
    </form>
</body>
</html>
