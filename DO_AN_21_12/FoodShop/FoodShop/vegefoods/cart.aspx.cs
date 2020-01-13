using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace FoodShop.vegefoods
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Cart"] != null)
            {
                int total = 0;
                DataTable dt = new DataTable();
                dt = (DataTable)Session["cart"];
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                for(int i=0;i<dt.Rows.Count;i++)
                {
                    total += int.Parse(dt.Rows[i]["Total"].ToString());
                }
                lblSumTotal.Text = total.ToString();
            }
        }



        }
}