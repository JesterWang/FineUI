using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.test
{
    public partial class textbox : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        #region BindGrid

        private void BindGrid()
        {
            ViewState["UseDataSource1"] = true;

            DataTable table = GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();

        }



        #endregion

        #region Events

        protected void Button2_Click(object sender, EventArgs e)
        {
            DataTable table;
            if (Convert.ToBoolean(ViewState["UseDataSource1"]))
            {
                ViewState["UseDataSource1"] = false;
                table = GetDataTable2();
            }
            else
            {
                ViewState["UseDataSource1"] = true;
                table = GetDataTable();
            }

            Grid1.DataSource = table;
            Grid1.DataBind();
        }


        protected void Button4_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<table class=\"result\" style=\"width:350px;\"><tr><th>编号</th><th>姓名</th><th>用户输入的分组号</th></tr>");
            for (int i = 0, count = Grid1.Rows.Count; i < count; i++)
            {
                sb.Append("<tr>");
                object[] rowDataKeys = Grid1.DataKeys[i];
                sb.AppendFormat("<td>{0}</td>", rowDataKeys[0]);
                sb.AppendFormat("<td>{0}</td>", rowDataKeys[1]);

                GridRow row = Grid1.Rows[i];
                System.Web.UI.WebControls.TextBox tbxGroupName = (System.Web.UI.WebControls.TextBox)row.FindControl("tbxGroupName");
                sb.AppendFormat("<td>{0}</td>", tbxGroupName.Text);

                sb.Append("<tr>");
            }

            sb.Append("</table>");

            Label2.Text = sb.ToString();

        }

        #endregion



        protected void Button3_Click1(object sender, EventArgs e)
        {
            var policy = Grid1.Rows[0].FindControl("tbxGroupName") as System.Web.UI.WebControls.TextBox;
            policy.Text = "New Value";

            Grid1.UpdateTemplateFields();
        }

    }
}