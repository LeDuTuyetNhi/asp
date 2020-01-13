using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using FoodShop.App_Code;
using FoodShop.admin;

namespace FoodShop.admin
{
    public partial class food : System.Web.UI.Page
    {
        public static int id;
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
            if (!IsPostBack)
            {
                if (Request["id"] != null)
                {
                    sQuery = "select * from Food where id=" + Request["id"];
                    SqlDataAdapter lst = new SqlDataAdapter(sQuery, con);
                    DataTable sp = new DataTable();
                    lst.Fill(sp);
                    exampleFoodName.Text = sp.Rows[0]["name"].ToString();
                    exampleFoodDes.Text = sp.Rows[0]["description"].ToString();
                    exampleFoodPrice.Text = sp.Rows[0]["price"].ToString();
                    examplePricePromo.Text = sp.Rows[0]["price_promo"].ToString();
                    Image_Thumb.Visible = true;
                    Image_Thumb.ImageUrl = "~/img/" + sp.Rows[0]["img"].ToString();
                    Image1.Visible = true;
                    Image1.ImageUrl = "~/img/" + sp.Rows[0]["img"].ToString();
                    exampleUnit.Text = sp.Rows[0]["unit"].ToString();
                    examplePercent.Text = sp.Rows[0]["percent_promo"].ToString();
                    exampleRating.Text = sp.Rows[0]["rating"].ToString();
                    exampleSold.Text = sp.Rows[0]["sold"].ToString();
                    examplePoint.Text = sp.Rows[0]["point"].ToString();
                    DropDownList1.SelectedValue=sp.Rows[0]["type"].ToString();
                    DropDownList_SelectStatus.SelectedValue = sp.Rows[0]["status"].ToString();
                    exampleUsername.Text = sp.Rows[0]["username"].ToString();
                    exampleModifiled.Text = sp.Rows[0]["modified"].ToString();
                    id=Convert.ToInt32(sp.Rows[0]["id"].ToString());
                    btnAdd.Text = "Update";
                }
                SqlDataAdapter da = new SqlDataAdapter(sQuery, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
            }
            
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (btnAdd.Text == "Thêm Food")
            {
                string sName = exampleFoodName.Text;
                string sDescription = exampleFoodDes.Text;
                int sPrice = Convert.ToInt32(exampleFoodPrice.Text);
                int sPrice_promo = Convert.ToInt32(examplePricePromo.Text);
                string sThumb = FileUpload2.FileName;
                string sImg = FileUpload1.FileName;
                string sUnit = exampleUnit.Text;
                int sPrecent_promo = Convert.ToInt32(examplePercent.Text);
                int sRating = Convert.ToInt32(exampleRating.Text);
                int sSold = Convert.ToInt32(exampleSold.Text);
                int sPoint = Convert.ToInt32(examplePoint.Text);
                int sType = Convert.ToInt32(DropDownList1.Text);
                int stt = Convert.ToInt32(DropDownList_SelectStatus.Text);
                string sUs = (string)Session["Login"];
                Food food = new Food(sName, sDescription, sPrice, sPrice_promo, sThumb, sImg, sUnit, sPrecent_promo, sRating, sSold, sPoint, sType, stt, sUs,id);
                if (food.AddFood() == true)
                {
                    lbmodal.Text = "Thêm sản phẩm thành công";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
                else
                {
                    lbmodal.Text = "Thêm sản phẩm thất bại";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
            }
            if (btnAdd.Text == "Update")
            {
                string sName = exampleFoodName.Text;
                string sDescription = exampleFoodDes.Text;
                int sPrice = Convert.ToInt32(exampleFoodPrice.Text);
                int sPrice_promo = Convert.ToInt32(examplePricePromo.Text);
                string sThumb = FileUpload2.FileName;
                string sImg = FileUpload1.FileName;
                string sUnit = exampleUnit.Text;
                int sPrecent_promo = Convert.ToInt32(examplePercent.Text);
                int sRating = Convert.ToInt32(exampleRating.Text);
                int sSold = Convert.ToInt32(exampleSold.Text);
                int sPoint = Convert.ToInt32(examplePoint.Text);
                int sType = Convert.ToInt32(DropDownList1.Text);
                int stt = Convert.ToInt32(DropDownList_SelectStatus.Text);
                string sUs = (string)Session["Login"];

                Food food = new Food(sName, sDescription, sPrice, sPrice_promo, sThumb, sImg, sUnit, sPrecent_promo, sRating, sSold, sPoint, sType, stt, sUs,id);
                if (food.UpdateFood() == true)
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
        //protected void btnHuy_Click(object sender, EventArgs e)
        //{
        //    ex.Text = "";
        //    txtPos.Text = "";
        //    DropDownList_SelectStatus.SelectedValue = "Active";
        //}
    }
}