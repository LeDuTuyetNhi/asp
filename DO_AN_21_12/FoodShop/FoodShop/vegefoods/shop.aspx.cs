﻿using System;
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

    public partial class shop : System.Web.UI.Page
    {
        public static int sl = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=ADMIN\SQLEXPRESS;Initial Catalog=vegefoods;Integrated Security=True");
            string sQuery = "";
            sQuery = "Select * from Food where status=1";
            if (Request["type"] != null)
            {
                sQuery = "Select * from Food where status=1 and type="+Request["type"].ToString();
            }
            DataTable dt = new DataTable();
            dt = DataProvider.getDataTable(sQuery);
            int so_item_1trang = 8;
            int so_trang = dt.Rows.Count / so_item_1trang + (dt.Rows.Count % so_item_1trang == 0 ? 0 : 1);
            int page = Request["page"] == null ? 1 : Convert.ToInt32(Request["page"]);
            int from = (page - 1) * 8;
            int to = page * 8 - 1;
            for (int i = dt.Rows.Count - 1; i >= 0; i--)
            {
                if (i < from || i > to)
                {
                    dt.Rows.RemoveAt(i);
                }
            }
            Repeater2.DataSource = dt;
            Repeater2.DataBind();
            DataTable dtPage = new DataTable();
            dtPage.Columns.Add("index");
            dtPage.Columns.Add("active");
            for (int i = 1; i <= so_trang; i++)
            {
                DataRow dr = dtPage.NewRow();
                dr["index"] = i;

                if ((Request["page"] == null && i == 1) || (Request["page"] != null && Convert.ToInt32(Request["page"]) == i))
                    dr["active"] = 1;
                else
                    dr["active"] = 0;
                dtPage.Rows.Add(dr);
            }
            Repeater3.DataSource = dtPage;
            Repeater3.DataBind();
        }

        protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Add_to_cart")
            {
                HiddenField hf_id = (HiddenField)e.Item.FindControl("hf_id");
                HiddenField hf_img = (HiddenField)e.Item.FindControl("hf_img");
                HiddenField hf_name = (HiddenField)e.Item.FindControl("hf_name");
                HiddenField hf_price = (HiddenField)e.Item.FindControl("hf_price");
                HiddenField hf_unit = (HiddenField)e.Item.FindControl("hf_unit");
                HiddenField hf_pricepromo = (HiddenField)e.Item.FindControl("hf_pricepromo");
                DataTable dt = new DataTable();
                if (Session["Cart"] == null)
                {
                    dt.Columns.Add("ID");
                    dt.Columns.Add("Images");
                    dt.Columns.Add("Products Name");
                    dt.Columns.Add("Price");
                    dt.Columns.Add("PricePromo");
                    dt.Columns.Add("Unit");
                    dt.Columns.Add("Quantity");
                    dt.Columns.Add("Total");
                }
                else
                {
                    dt = (DataTable)Session["Cart"];
                }
                int iRow = CheckExited(dt, hf_id.Value);
                if (iRow != -1)
                {
                    dt.Rows[iRow]["Quantity"] = Convert.ToInt32(dt.Rows[iRow]["Quantity"]) + sl;
                    dt.Rows[iRow]["Total"] = Convert.ToInt32(dt.Rows[iRow]["Total"]) * Convert.ToInt32(dt.Rows[iRow]["Quantity"]);
                }
                else
                {
                    DataRow dr = dt.NewRow();
                    dr["ID"] = hf_id.Value;
                    dr["Images"] = hf_img.Value;
                    dr["Products Name"] = hf_name.Value;
                    dr["Price"] = hf_price.Value;
                    dr["Unit"] = hf_unit.Value;
                    dr["PricePromo"] = hf_pricepromo.Value;
                    dr["Quantity"] = sl;
                    dr["Total"] = hf_pricepromo.Value;
                    dt.Rows.Add(dr);
                }
                Session["Cart"] = dt;
            }
        }
        private int CheckExited(DataTable dt, string id)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["ID"].ToString() == id)
                {
                    return i;
                }
            }
            return -1;
        }
    }
}