using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace FoodShop.App_Code
{
    public class order
    {
        private int _Order_id;
        private string _Cus_name;
        private string _Cus_phone;
        private string _Cus_add;
        private int _Quan;
        private int _Sum;
        private int _Status;
        private DateTime _Modified;
        private DateTime _Create;
        private string _Cus_username;

        public int Order_id { get => _Order_id; set => _Order_id = value; }
        public string Cus_name { get => _Cus_name; set => _Cus_name = value; }
        public string Cus_phone { get => _Cus_phone; set => _Cus_phone = value; }
        public string Cus_add { get => _Cus_add; set => _Cus_add = value; }
        public int Quan { get => _Quan; set => _Quan = value; }
        public int Sum { get => _Sum; set => _Sum = value; }
        public int Status { get => _Status; set => _Status = value; }
        public DateTime Modified { get => _Modified; set => _Modified = value; }
        public DateTime Create { get => _Create; set => _Create = value; }
        public string Cus_username { get => _Cus_username; set => _Cus_username = value; }
        public order(string name,string phone,string add,int quan,int sum,string cus_us,int id)
        {
            _Cus_name = name;
            _Cus_phone = phone;
            _Cus_add = add;
            _Quan = quan;
            _Sum = sum;
            _Cus_username = cus_us;
            _Order_id = id;
        }
        public bool Add()
        {
            string sQuery = "INSERT INTO [dbo].[Order]([cus_name],[cus_phone],[cus_add],[quan],[sum],[status],[modified],[created],[cus_username])VALUES(@name,@phone,@add,@quan,@sum,@status,GETDATE(),GETDATE(),@cus_us)";
            SqlParameter[] pars =
            {
                new SqlParameter("@name",SqlDbType.NVarChar,100){Value=this.Cus_name},
                new SqlParameter("@phone",SqlDbType.VarChar,50){Value=this.Cus_phone},
                new SqlParameter("@add",SqlDbType.NVarChar,255){ Value=this.Cus_add},
                new SqlParameter("@quan",SqlDbType.Int,4){Value=this.Quan},
                 new SqlParameter("@sum",SqlDbType.Int,4){Value=this.Sum},
                 new SqlParameter("@status",SqlDbType.Int,4){Value=this.Status},
                 new SqlParameter("@cus_us",SqlDbType.VarChar,50){Value=this.Cus_username}
                 
            };
            return DataProvider.executeNonQuery(sQuery, pars);
        }
    }

}