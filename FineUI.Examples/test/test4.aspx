<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test4.aspx.cs" Inherits="FineUI.Examples.test4" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title></title>
    <link href="../res/css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager2" runat="server" />
        <f:Panel ID="Panel16" runat="server">
            <Items>
                <f:Tree runat="server" ShowBorder="false" ShowHeader="False" ID="leftMenuTree">
                    <Nodes>
                        <f:TreeNode Text="默认分类" Expanded="true">
                            <f:TreeNode Text="开始页面" NavigateUrl="~/hello.aspx"></f:TreeNode>
                            <f:TreeNode Text="登录页面" NavigateUrl="~/login.aspx"></f:TreeNode>
                        </f:TreeNode>
                    </Nodes>
                </f:Tree>
            </Items>
        </f:Panel>
        <f:Panel runat="server" ID="Panel1" ShowHeader="true" Width="500px" Height="300px" Title="HAHAH">
            <Content>
                <div>HAHA</div>
                <asp:Label ID="Label1" runat="server" Text="OK">
                </asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" Text="UUUU"></asp:TextBox>
                <f:Form ID="Form2" runat="server" Height="136px" Width="300px" BodyPadding="5px" ShowHeader="true"
                    ShowBorder="true" Title="JJJJ" LabelAlign="Right">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar3" runat="server">
                            <Items>
                                <f:Button ID="Button2" runat="server" Text="增加2">
                                </f:Button>
                                <f:ToolbarFill ID="ToolbarFill1" runat="server">
                                </f:ToolbarFill>
                                <f:Button ID="Button1" runat="server" Text="增加">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>

                </f:Form>
            </Content>
        </f:Panel>
        <f:ContentPanel runat="server" ID="Panel2" ShowHeader="true" Width="500px" Height="300px" Title="HAHAH">
            <div>HAHA</div>
            <asp:Label ID="Label1" runat="server" Text="OK">
            </asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Text="UUUU"></asp:TextBox>
        </f:ContentPanel>

        <f:Panel ID="Panel3" runat="server" Width="850px" ShowBorder="True"  EnableCollapse="true"
            BodyPadding="5px" Layout="Column" ShowHeader="True">
            <Items>
                <f:Panel ID="Panel5" ColumnWidth="33%" runat="server"
                    ShowBorder="false" ShowHeader="false" Margin="0 5px 0 0">
                    <Items>
                        <f:Panel ID="Panel13" runat="server"
                            BodyPadding="5px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" Margin="0 0 5px 0">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel14" runat="server"
                            BodyPadding="5px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" Margin="0 0 5px 0">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel15" runat="server"
                            BodyPadding="5px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" Margin="0 0 5px 0">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel6" ColumnWidth="33%" runat="server"
                    ShowBorder="false" ShowHeader="false" Margin="0 5px 0 0">
                    <Items>
                        <f:Panel ID="Panel7" runat="server"
                            BodyPadding="5px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" Margin="0 0 5px 0">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel8" runat="server"
                            BodyPadding="5px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" Margin="0 0 5px 0">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel9" runat="server"
                            BodyPadding="5px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" Margin="0 0 5px 0">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel4" ColumnWidth="34%" runat="server"
                    ShowBorder="false" ShowHeader="false">
                    <Items>
                        <f:Panel ID="Panel10" runat="server"
                            BodyPadding="5px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" Margin="0 0 5px 0">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel11" runat="server"
                            BodyPadding="5px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" Margin="0 0 5px 0">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel12" runat="server"
                            BodyPadding="5px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" Margin="0 0 5px 0">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
