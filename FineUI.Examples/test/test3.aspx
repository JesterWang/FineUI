<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test3.aspx.cs" Inherits="FineUI.Examples.test3" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" AutoSizePanelID="MainPanel" />
        <f:Panel runat="server" ID="MainPanel" ShowHeader="true" ShowBorder="true" Layout="VBox" BoxConfigAlign="Start" >
            <Items>
                <f:Panel runat="server" ID="BizTask" ShowHeader="true" ShowBorder="true" Layout="Fit" BoxFlex="1" Width="500px">
                    <Items>
                        <f:TabStrip runat="server" ID="TabStrip1" ShowBorder="false">
                            <Tabs>
                                <f:Tab ID="Tab1" runat="server">
                                    <Content>
                                        tab
                                    </Content>
                                </f:Tab>
                            </Tabs>
                        </f:TabStrip>
                    </Items>
                </f:Panel>

            </Items>
        </f:Panel>

    </form>
</body>
</html>
