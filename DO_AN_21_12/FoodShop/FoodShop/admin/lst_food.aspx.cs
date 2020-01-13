using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using FoodShop.App_Code;

namespace FoodShop.admin
{
    public partial class lst_food : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=ADMIN\SQLEXPRESS;Initial Catalog=vegefoods;Integrated Security=True");
            string sQuery = "";
            sQuery = "Select * from Food";
            if (Session["Login"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            Response.Write("Chao: " + Session["Login"].ToString());

            if (Request["del"] != null)
            {
                sQuery = "UPDATE [dbo].[Food] SET [status] = 0 WHERE id ='" + Request["del"] + "'";
                if (DataProvider.executeNonQuery(sQuery))
                {
                    lbmodal.Text = "Xóa Thành Công";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
                else
                {
                    lbmodal.Text = "Xóa Thất Bại";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }

            }
        }
    }
}