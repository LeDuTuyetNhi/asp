using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodShop.App_Code;
using System.Data;
using System.Data.SqlClient;

namespace FoodShop.admin
{
    public partial class Member : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=ADMIN\SQLEXPRESS;Initial Catalog=vegefoods;Integrated Security=True");
            string sQuery = "";
            sQuery = "Select * from Member";

            if (Session["Login"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            Response.Write("Chao: " + Session["Login"].ToString());

            
            if (!IsPostBack)
            {
                if (Request["id"] != null)
                {
                    sQuery = "select * from Member where username='" + Request["id"] + "'";
                    SqlDataAdapter lst = new SqlDataAdapter(sQuery, conn);
                    DataTable sp = new DataTable();
                    lst.Fill(sp);
                    exampleFirstName.Text = sp.Rows[0]["username"].ToString();
                    exampleInputPassword.Text = sp.Rows[0]["pass"].ToString();
                    exampleLastName.Text = sp.Rows[0]["name"].ToString();
                    exampleRepeatPhone.Text = sp.Rows[0]["phone"].ToString();
                    exampleInputEmail.Text = sp.Rows[0]["email"].ToString();
                    DropDownList_SelectStatus.SelectedValue = sp.Rows[0]["status"].ToString();
                    DropDownList_SelectRole.SelectedValue = sp.Rows[0]["role"].ToString();
                    btnAdd.Text = "Update";
                    
                }
                SqlDataAdapter da = new SqlDataAdapter(sQuery, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                
            }

            if (Request["del"] != null)
            {
                sQuery = "UPDATE [dbo].[Member] SET [status] = 0 WHERE username ='" + Request["del"].ToString() + "'";
                if (DataProvider.executeNonQuery(sQuery))
                {
                    lblModal.Text = "Xóa thành công";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
                else
                {
                    lblModal.Text = "Xóa thất bại";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {

            if (btnAdd.Text == "Thêm Member")
            {
                string sUserName = exampleFirstName.Text;
                string sPass = exampleInputPassword.Text;
                string sName = exampleLastName.Text;
                string sPhone = exampleRepeatPhone.Text;
                string sMail = exampleInputEmail.Text;
                int sStatus = Convert.ToInt32(DropDownList_SelectStatus.SelectedValue);
                int sRole = Convert.ToInt32(DropDownList_SelectRole.SelectedValue);
                
                Account acc = new Account(sUserName, sPass, sName, sPhone, sMail, sStatus, sRole);
                if (acc.AddMember() == true)
                {
                    lblModal.Text = "Thêm Thành Công" + " " + sUserName;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
                else
                {
                    lblModal.Text = "Thêm Member Thất Bại" + " " + sUserName;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
            }
            if (btnAdd.Text == "Update")
            {
                string sUserName = exampleFirstName.Text;
                string sName = exampleLastName.Text;
                string sPass = exampleRepeatPassword.Text;
                string sPhone = exampleRepeatPhone.Text;
                int sStatus = Convert.ToInt32(DropDownList_SelectStatus.SelectedValue);
                int sRole = Convert.ToInt32(DropDownList_SelectRole.SelectedValue);
                string sMail = exampleInputEmail.Text;
                Account acc = new Account(sUserName, sPass, sName, sPhone, sMail, sStatus, sRole);
                if (acc.UpdateMember() == true)
                {
                    lblModal.Text = "Cập Nhật Thành Công" + " " + sUserName;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
                else
                {
                    lblModal.Text = "Cập Nhật Thất Bại" + " " + sUserName;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }

            }
        }
        protected void HuyButton_Click(object sender, EventArgs e)
        {
            exampleFirstName.Text = "";
            exampleInputEmail.Text = "";
            exampleInputPassword.Text = "";
            exampleRepeatPassword.Text = "";
            exampleLastName.Text = "";
            exampleRepeatPhone.Text = "";
        }

    }
}