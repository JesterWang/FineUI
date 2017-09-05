using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FineUI;
using System.Data;

namespace EmptyProjectNet20
{
    public partial class hello : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Grid1.DataSource = BulidDataSet();
                Grid1.DataBind();
            }
        }


        public DataSet BulidDataSet()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            DataColumn col = new DataColumn("编号", typeof(string));
            col.MaxLength = 20;
            dt.Columns.Add(col);                   //注意是dt.columns 然后ADD
            DataColumn col1 = new DataColumn("识别", typeof(int));
            col.MaxLength = 20;
            dt.Columns.Add(col1);
            DataRow rw = dt.NewRow();          //给DT增加一个新行对象
            rw["编号"] = "1";
            rw["识别"] = 26;
            dt.Rows.Add(rw);                         //   dt.Rows.Add(dt.NewRow());   增加一个空
            DataRow rw1 = dt.NewRow();
            rw1["编号"] = "2";
            rw1["识别"] = 26;
            dt.Rows.Add(rw1);
            DataRow rw2 = dt.NewRow();
            rw2["编号"] = "3";
            rw2["识别"] = 26;
            dt.Rows.Add(rw2);
            ds.Tables.Add(dt);
            return ds;
        }

        protected void Grid1_RowDoubleClick(object sender, GridRowClickEventArgs e)
        {
            Grid1.Rows.RemoveAt(e.RowIndex);
        }
    }
}
