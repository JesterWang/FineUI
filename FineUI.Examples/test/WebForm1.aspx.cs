using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace EmptyProjectNet40_FineUI
{
    public partial class WebForm1 : System.Web.UI.Page
    {
    
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.databind();
            }
            

        }
        private void databind()
        {
          

            DataTable dt = new DataTable();

            dt.Columns.Add("Cusname", typeof(System.String));
            dt.Columns.Add("id", typeof(System.Int32));
            dt.Columns.Add("type", typeof(System.String));

            DataRow row = dt.NewRow();
            row["Cusname"] = "客户名称";
            row["id"] = 1;
            row["type"] = "123";
            dt.Rows.Add(row);//这样就可以添加了  
            row = dt.NewRow();
            row["Cusname"] = "客户名称";
            row["id"] = 2;
            row["type"] = "456";
            dt.Rows.Add(row);


            Grid1.DataSource = dt.DefaultView;
           Grid1.DataBind();

          
        }
    }
}