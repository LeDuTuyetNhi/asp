using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace FoodShop.App_Code
{
    public class DataProvider
    {
        private static string ChuoiKetNoi = @"Data Source=ADMIN\SQLEXPRESS;Initial Catalog=vegefoods;Integrated Security=True";

        private static SqlConnection conn = new SqlConnection(ChuoiKetNoi);
        private static void Connect()
        {
            if (conn.State == System.Data.ConnectionState.Closed || conn.State == ConnectionState.Broken)
            {
                conn.Open();
            }
        }
        public static bool executeNonQuery(string sQuery, SqlParameter[] paras)
        {
            try
            {
                Connect();
                SqlCommand cmd = new SqlCommand(sQuery, conn);
                cmd.Parameters.AddRange(paras);
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;
            }
            catch (Exception ex)
            {

                return false;
            }
        }
        public static bool executeNonQuery(string sQuery)
        {
            try
            {
                Connect();
                SqlCommand cmd = new SqlCommand(sQuery, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;
            }
            catch (Exception ex)
            {

                return false;
            }
        }
        public static int executeScalar(string sQuery, SqlParameter[] paras)
        {
            try
            {
                Connect();
                SqlCommand cmd = new SqlCommand(sQuery, conn);
                cmd.Parameters.AddRange(paras);
                cmd.ExecuteNonQuery();
                //sQuery = "select @@identity";
                //cmd = new SqlCommand(sQuery, conn);
                int id = (int)cmd.ExecuteScalar();
                conn.Close();
                return id;
            }
            catch (Exception ex)
            {
                return -1;
            }
        }

        public static int executeScalar(string sQuery)
        {
            try
            {
                Connect();
                SqlCommand cmd = new SqlCommand(sQuery, conn);


                int id = (int)cmd.ExecuteScalar();
                conn.Close();
                return id;
            }
            catch (Exception ex)
            {
                return -1;
            }
        }

        public static DataTable getDataTable(string sQuery, SqlParameter[] paras)
        {
            try
            {
                Connect();
                SqlDataAdapter da = new SqlDataAdapter(sQuery, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static DataTable getDataTable(string sQuery)
        {
            try
            {
                Connect();
                SqlDataAdapter da = new SqlDataAdapter(sQuery, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}