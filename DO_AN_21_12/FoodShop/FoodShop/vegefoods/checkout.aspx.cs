using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using FoodShop.App_Code;

namespace FoodShop.vegefoods
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Cart"] != null)
            {
                int total = 0;
                DataTable dt = new DataTable();
                dt = (DataTable)Session["Cart"];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    total += int.Parse(dt.Rows[i]["Total"].ToString());
                }
                lblSumTotal.Text = total.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //if (Session["Cart"] != null)
            //{
            //    DataTable dt = new DataTable();
            //    dt = (DataTable)Session["Cart"];
            //    SqlConnection con = new SqlConnection(@"Data Source=ADMIN\SQLEXPRESS;Initial Catalog=vegefoods;Integrated Security=True");
            //    con.Open();
            //    string squery = "INSERT INTO [dbo].[HD]([cus_name],[cus_add],[cus_receiver])VALUES('abc','123abc','n')";

            //    string cus_username = txt_FirtName.Text;
            //    string name = txt_LastName.Text;
            //    string phone = txt_phone.Text;
            //    string add = txt_add.Text;
            //    order a = new order(name,phone,add,)
            //    Account acc = new Account(sUserName, sPass, sName, sPhone, sMail, sStatus, sRole);
            //    if (acc.UpdateMember() == true)

            //        SqlCommand com = new SqlCommand(squery, con);
            //    com.ExecuteNonQuery();
            //    squery = "select @@indentity";
            //    com = new SqlCommand(squery, con);
            //    int id = Convert.ToInt32(com.ExecuteScalar().ToString());
            //    for (int i = 0; i < dt.Rows.Count; i++)
            //    {
            //        squery = "INSERT INTO [dbo].[CTHD]([id_hd],[id_sp],[price],[quan])VALUES(@id,@idsp,@price,@quan)";
            //        SqlParameter[] paras = new SqlParameter[4];
            //        paras[0] = new SqlParameter("@id", id);
            //        paras[1] = new SqlParameter("@idsp", dt.Rows[i]["id"]);
            //        paras[2] = new SqlParameter("@price", dt.Rows[i]["price"]);
            //        paras[3] = new SqlParameter("@quan", dt.Rows[i]["quan"]);
            //        com = new SqlCommand(squery, con);
            //        com.Parameters.AddRange(paras);
            //        com.ExecuteNonQuery();

            //    }
            //    con.Close();
            //    Session["cart"] = null;
            //    Response.Write("<script>alert('Dat hang thanh cong ');</script>");
            //}
        }
    }
}