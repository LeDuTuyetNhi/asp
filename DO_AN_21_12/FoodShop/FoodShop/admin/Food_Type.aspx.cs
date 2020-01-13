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
    public partial class Food_Type : System.Web.UI.Page
    {
        public static int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=ADMIN\SQLEXPRESS;Initial Catalog=vegefoods;Integrated Security=True");
            string sQuery = "";
            sQuery = "Select * from food_type";
            if (Session["Login"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            Response.Write("Chao: " + Session["Login"].ToString());
            if (!IsPostBack)
            {
                if (Request["type_id"] != null)
                {
                    sQuery = "select * from food_type where type_id='" + Request["type_id"] + "'";
                    SqlDataAdapter lst = new SqlDataAdapter(sQuery, con);
                    DataTable sp = new DataTable();
                    lst.Fill(sp);
                    txtName.Text = sp.Rows[0]["type_name"].ToString();
                    txtPos.Text = sp.Rows[0]["type_pos"].ToString();
                    DropDownList_SelectStatus.SelectedValue = sp.Rows[0]["status"].ToString();
                    id = Convert.ToInt32(sp.Rows[0]["type_id"].ToString());
                    btnAdd.Text = "Update";
                    FileUpload1.Visible = true;
                    
                }
                SqlDataAdapter da = new SqlDataAdapter(sQuery, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
            }
            if (Request["del"] != null)
            {
                sQuery = "UPDATE [dbo].[food_type] SET [status] = 0 WHERE type_id ='" + Request["del"] + "'";
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (btnAdd.Text == "Thêm Food Type")
            {
                string sFoodName = txtName.Text;
                int sPost = Convert.ToInt32(txtPos.Text);
                string sFoodImage = FileUpload1.FileName;
                string sUserName = (string)Session["Login"];
                int sStatus = Convert.ToInt32(DropDownList_SelectStatus.SelectedValue);
                Food_type food_type = new Food_type(sFoodName, sPost, sFoodImage, sStatus, sUserName, id);
                if (food_type.AddFood() == true)
                {
                    lbmodal.Text = "Thêm loại sản phẩm thành công";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
                else
                {
                    lbmodal.Text = "Thêm loại sản phẩm thất bại";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
            }
            if (btnAdd.Text == "Update")
            {
                string sFoodName = txtName.Text;
                int sPost = Convert.ToInt32(txtPos.Text);
                string sFoodImage = FileUpload1.FileName;
                string sUserName = (string)Session["Login"];
                int sStatus = Convert.ToInt32(DropDownList_SelectStatus.SelectedValue);
                Food_type food_type = new Food_type(sFoodName, sPost, sFoodImage, sStatus, sUserName, id);
                if (food_type.CapNhat() == true)
                {
                    lbmodal.Text = "Cập nhật thành công";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
                else
                {
                    lbmodal.Text = "Cập nhật thất bại";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
            }

        }
        protected void btnHuy_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtPos.Text = "";
            DropDownList_SelectStatus.SelectedValue = "Active";
        }
    }
}