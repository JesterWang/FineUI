using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.form
{
    public partial class textbox_autopostback : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            labResult.Text = "事件来源：TextBox1<br/>文本框一：" + TextBox1.Text + "<br/>文本框二：" + TextBox2.Text + "<br/>文本框三：" + TextBox3.Text;
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            labResult.Text = "事件来源：TextBox2<br/>文本框一：" + TextBox1.Text + "<br/>文本框二：" + TextBox2.Text + "<br/>文本框三：" + TextBox3.Text;
        }

        protected void TextBox3_Blur(object sender, EventArgs e)
        {
            labResult.Text = "事件来源：TextBox3<br/>文本框一：" + TextBox1.Text + "<br/>文本框二：" + TextBox2.Text + "<br/>文本框三：" + TextBox3.Text;
        }
    }
}
