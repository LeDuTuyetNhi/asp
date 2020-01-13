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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] != null)
            {
                Response.Redirect("index.aspx");
            }
        }
        protected int KTDangNhap()
        {
            string name = txtU.Text.Trim();
            string pass = StringProc.MD5Hash(txtP.Text.Trim());
            string sQuery = "SELECT COUNT(*) FROM Member WHERE username=@us and pass=@pass";
            SqlParameter[] pars =
            {
                new SqlParameter("@us",SqlDbType.VarChar,50){Value=name},
                new SqlParameter("@pass",SqlDbType.VarChar,255){Value=pass},

            };
            return DataProvider.executeScalar(sQuery, pars);
        }

        protected void btLogin_Click(object sender, EventArgs e)
        {
            if (KTDangNhap() > 0)
            {
                Session["Login"] = txtU.Text;
                Response.Redirect("index.aspx");
            }
            else
            {
                
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi; Đăng nhập thất bại');", true);
            }
        }

        protected void btCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/vegefoods/TrangChu.aspx");
        }
    }
}