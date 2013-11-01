<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="anchor.aspx.cs" Inherits="FineUI.Examples.layout.anchor" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <x:PageManager ID="PageManager1" runat="server" />
        <x:Panel ID="Panel3" Title="面板一（Height=300px Width=750px）" runat="server" Height="300px" EnableFrame="true" EnableCollapse="true"
            Width="850px" BodyPadding="5px" ShowBorder="True" ShowHeader="True">
            <Items>
                <x:Panel ID="Panel1" runat="server" ShowBorder="True"
                    BodyPadding="5px" ShowHeader="false" Title="面板">
                    <Items>
                        <x:Button ID="Button1" Text="按钮" runat="server">
                        </x:Button>
                    </Items>
                </x:Panel>
                <x:Form ID="Form3" runat="server" ShowBorder="True"
                    BodyPadding="5px" ShowHeader="false" Title="表单">
                    <Rows>
                        <x:FormRow>
                            <Items>
                                <x:Label ID="Label2" Label="文本" Text="文本内容" runat="server">
                                </x:Label>
                            </Items>
                        </x:FormRow>
                        <x:FormRow>
                            <Items>
                                <x:TextBox ID="TextBox2" Label="输入框" runat="server">
                                </x:TextBox>
                                <x:Button ID="Button2" Text="按钮" runat="server">
                                </x:Button>
                            </Items>
                        </x:FormRow>
                    </Rows>
                </x:Form>
            </Items>
        </x:Panel>
        <br />
        <x:Panel ID="Panel2" runat="server" Height="300px" Width="850px" ShowBorder="True" EnableFrame="true" EnableCollapse="true"
            BodyPadding="5px" Layout="Anchor" ShowHeader="True" Title="面板二（Height=300px Width=750px Layout=Anchor）">
            <Items>
                <x:Panel ID="Panel4" AnchorValue="60% 30%" runat="server"
                    BodyPadding="5px" ShowBorder="True" ShowHeader="false">
                    <Items>
                        <x:Label ID="Label3" ShowEmptyLabel="false" Text="AnchorValue=60% 30%" runat="server">
                        </x:Label>
                    </Items>
                </x:Panel>
                <x:Form ID="Form2" AnchorValue="100% 70%" runat="server"
                    BodyPadding="5px" ShowBorder="True" ShowHeader="false">
                    <Rows>
                        <x:FormRow>
                            <Items>
                                <x:Label ID="Label1" ShowEmptyLabel="false" Text="AnchorValue=100% 70%" runat="server">
                                </x:Label>
                            </Items>
                        </x:FormRow>
                        <x:FormRow>
                            <Items>
                                <x:TextBox ID="TextBox1" Label="输入框" runat="server">
                                </x:TextBox>
                                <x:Button ID="Button7" Text="按钮" runat="server">
                                </x:Button>
                            </Items>
                        </x:FormRow>
                    </Rows>
                </x:Form>
            </Items>
        </x:Panel>
        <br />
        <x:Panel ID="Panel5" Title="面板三（Width=750px）" runat="server" EnableFrame="true" EnableCollapse="true"
            BodyPadding="3px" ShowBorder="True" ShowHeader="True" Width="850px">
            <Items>
                <x:Form ID="Form4" ShowBorder="False" BodyPadding="5px" ShowHeader="False" runat="server">
                    <Rows>
                        <x:FormRow>
                            <Items>
                                <x:TextBox ID="TextBox3" Label="用户名" runat="server">
                                </x:TextBox>
                                <x:Button ID="Button6" Text="搜索" runat="server">
                                </x:Button>
                            </Items>
                        </x:FormRow>
                    </Rows>
                </x:Form>
                <x:Panel ID="Panel6" ShowBorder="True" ShowHeader="false" runat="server">
                    <Toolbars>
                        <x:Toolbar ID="Toolbar1" runat="server">
                            <Items>
                                <x:Button ID="Button4" Text="按钮一" runat="server">
                                </x:Button>
                                <x:Button ID="Button5" Text="按钮二" runat="server">
                                </x:Button>
                            </Items>
                        </x:Toolbar>
                    </Toolbars>
                    <Items>
                        <x:Grid ID="Grid1" Title="表格" PageSize="3" ShowBorder="false" ShowHeader="False"
                            runat="server" EnableCheckBoxSelect="True" DataKeyNames="Id,Name">
                            <Columns>
                                <x:RowNumberField />
                                <x:BoundField Width="100px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                                <x:TemplateField Width="80px" HeaderText="性别">
                                    <ItemTemplate>
                                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                                        <asp:Label ID="Label4" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                                    </ItemTemplate>
                                </x:TemplateField>
                                <x:BoundField Width="80px" DataField="EntranceYear" HeaderText="入学年份" />
                                <x:CheckBoxField Width="80px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                                <x:HyperLinkField HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                                    DataNavigateUrlFieldsEncode="true" Target="_blank" ExpandUnusedSpace="True" />
                                <x:ImageField Width="80px" DataImageUrlField="Group" DataImageUrlFormatString="~/images/16/{0}.png"
                                    HeaderText="分组"></x:ImageField>
                            </Columns>
                        </x:Grid>
                    </Items>
                </x:Panel>
            </Items>
        </x:Panel>
        <br />
        <x:Panel ID="Panel7" runat="server" BodyPadding="3px" EnableFrame="true" EnableCollapse="true"
            ShowBorder="True" ShowHeader="True" Width="850px" Height="350px" Title="面板四（Width=750px Height=350px Layout=Anchor）"
            Layout="Anchor">
            <Items>
                <x:Form ID="Form5" ShowBorder="False" BodyPadding="5px" AnchorValue="100%"
                    ShowHeader="False" runat="server">
                    <Rows>
                        <x:FormRow>
                            <Items>
                                <x:TextBox ID="TextBox5" Label="用户名" runat="server">
                                </x:TextBox>
                                <x:TextBox ID="TextBox8" Label="所在班级" runat="server">
                                </x:TextBox>
                            </Items>
                        </x:FormRow>
                        <x:FormRow>
                            <Items>
                                <x:TextBox ID="TextBox6" Label="所在年级" runat="server">
                                </x:TextBox>
                                <x:Button ID="Button11" Text="搜索" runat="server">
                                </x:Button>
                            </Items>
                        </x:FormRow>
                    </Rows>
                </x:Form>
                <x:Panel ID="Panel8" ShowBorder="True" ShowHeader="false" AnchorValue="100% -68"
                    Layout="Fit" runat="server">
                    <Toolbars>
                        <x:Toolbar ID="Toolbar2" runat="server">
                            <Items>
                                <x:Button ID="Button8" Text="按钮一" runat="server">
                                </x:Button>
                                <x:Button ID="Button9" Text="按钮二" runat="server">
                                </x:Button>
                            </Items>
                        </x:Toolbar>
                    </Toolbars>
                    <Items>
                        <x:Grid ID="Grid2" Title="Grid2" PageSize="3" ShowBorder="false" ShowHeader="False"
                            runat="server" EnableCheckBoxSelect="True" DataKeyNames="Id,Name">
                            <Columns>
                                <x:RowNumberField />
                                <x:BoundField Width="100px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                                <x:TemplateField Width="80px" HeaderText="性别">
                                    <ItemTemplate>
                                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                                        <asp:Label ID="Label6" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                                    </ItemTemplate>
                                </x:TemplateField>
                                <x:BoundField Width="80px" DataField="EntranceYear" HeaderText="入学年份" />
                                <x:CheckBoxField Width="80px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                                <x:HyperLinkField HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                                    DataNavigateUrlFieldsEncode="true" Target="_blank" ExpandUnusedSpace="True" />
                                <x:ImageField Width="80px" DataImageUrlField="Group" DataImageUrlFormatString="~/images/16/{0}.png"
                                    HeaderText="分组"></x:ImageField>
                            </Columns>
                        </x:Grid>
                    </Items>
                </x:Panel>
            </Items>
        </x:Panel>
        <br />
        <br />
        使用VBox布局实现与上例相同的界面：
        <br />
        ===========================================================================
        <br />
        <x:Panel ID="Panel9" runat="server" Layout="VBox" EnableFrame="true" EnableCollapse="true"
            BoxConfigAlign="Stretch" BoxConfigPosition="Start" BoxConfigPadding="3" BoxConfigChildMargin="0"
            ShowBorder="True" ShowHeader="True" Width="850px" Height="350px"
            Title="面板五（Layout=VBox BoxConfigAlign=Stretch BoxConfigPosition=Start BoxConfigPadding=3 BoxConfigChildMargin=0）">
            <Items>
                <x:Form ID="Form6" ShowBorder="False" BodyPadding="5px" ShowHeader="False" runat="server">
                    <Rows>
                        <x:FormRow>
                            <Items>
                                <x:TextBox ID="TextBox4" Label="用户名" runat="server">
                                </x:TextBox>
                                <x:TextBox ID="TextBox7" Label="所在班级" runat="server">
                                </x:TextBox>
                            </Items>
                        </x:FormRow>
                        <x:FormRow>
                            <Items>
                                <x:TextBox ID="TextBox9" Label="所在年级" runat="server">
                                </x:TextBox>
                                <x:Button ID="Button10" Text="搜索" runat="server">
                                </x:Button>
                            </Items>
                        </x:FormRow>
                    </Rows>
                </x:Form>
                <x:Panel ID="Panel10" ShowBorder="True" ShowHeader="false" BoxFlex="1" Layout="Fit" runat="server">
                    <Toolbars>
                        <x:Toolbar ID="Toolbar3" runat="server">
                            <Items>
                                <x:Button ID="Button12" Text="按钮一" runat="server">
                                </x:Button>
                                <x:Button ID="Button13" Text="按钮二" runat="server">
                                </x:Button>
                            </Items>
                        </x:Toolbar>
                    </Toolbars>
                    <Items>
                        <x:Grid ID="Grid3" Title="Grid3" PageSize="3" ShowBorder="false" ShowHeader="False"
                            runat="server" EnableCheckBoxSelect="True" DataKeyNames="Id,Name">
                            <Columns>
                                <x:RowNumberField />
                                <x:BoundField Width="100px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                                <x:TemplateField Width="80px" HeaderText="性别">
                                    <ItemTemplate>
                                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                                        <asp:Label ID="Label8" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                                    </ItemTemplate>
                                </x:TemplateField>
                                <x:BoundField Width="80px" DataField="EntranceYear" HeaderText="入学年份" />
                                <x:CheckBoxField Width="80px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                                <x:HyperLinkField HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                                    DataNavigateUrlFieldsEncode="true" Target="_blank" ExpandUnusedSpace="True" />
                                <x:ImageField Width="80px" DataImageUrlField="Group" DataImageUrlFormatString="~/images/16/{0}.png"
                                    HeaderText="分组"></x:ImageField>
                            </Columns>
                        </x:Grid>
                    </Items>
                </x:Panel>
            </Items>
        </x:Panel>
    </form>
</body>
</html>
