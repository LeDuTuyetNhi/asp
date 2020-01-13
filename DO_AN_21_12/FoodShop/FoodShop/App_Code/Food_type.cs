using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace FoodShop.App_Code
{
    public class Food_type
    {
        private int _Type_id;
        private string _Type_name;
        private int _Type_post;
        private string _Type_img;
        private int _Status;
        private string _Username;
        private DateTime _Modified;

        public string Type_name { get => _Type_name; set => _Type_name = value; }
        public int Type_post { get => _Type_post; set => _Type_post = value; }
        public string Type_img { get => _Type_img; set => _Type_img = value; }
        public int Status { get => _Status; set => _Status = value; }
        public string Username { get => _Username; set => _Username = value; }
        public DateTime Modified { get => _Modified; set => _Modified = value; }
        public int Type_id { get => _Type_id; set => _Type_id = value; }

        public Food_type(string SName, int SPost, string SImg, int sStatus, string sUsername, int ID)
        {
            _Type_name = SName;
            _Type_post = SPost;
            _Type_img = SImg;
            _Status = sStatus;
            _Username = sUsername;
            _Type_id = ID;
        }
        public bool AddFood()
        {
            string sQuery = "INSERT INTO [dbo].[food_type]([type_name],[type_pos],[type_img],[status],[username],[modified]) VALUES (@type_name,@type_pos,@type_img,@status,@username,GETDATE())";
            SqlParameter[] pars =
            {
                new SqlParameter("@type_name",SqlDbType.NVarChar,50){Value=this.Type_name},
                new SqlParameter("@type_pos",SqlDbType.Int,4){Value=this.Type_post},
                new SqlParameter("@type_img",SqlDbType.VarChar,255){Value=this.Type_img},
                new SqlParameter("@status",SqlDbType.Int,4){Value=this.Status},
                new SqlParameter("@username",SqlDbType.VarChar,50){Value=this.Username}
            };
            return DataProvider.executeNonQuery(sQuery, pars);
        }

        public bool CapNhat()
        {
            string sQuery = "UPDATE [dbo].[food_type] SET [type_name] = @type_name, [type_pos] = @type_pos, [type_img] = @type_img, [status] = @status, [username] = @username,[modified] = GETDATE() WHERE [type_id] = @id ";
            SqlParameter[] pars =
            {
                new SqlParameter("@type_name",SqlDbType.NVarChar,50){Value=this.Type_name},
                new SqlParameter("@type_pos",SqlDbType.Int,4){Value=this.Type_post},
                new SqlParameter("@type_img",SqlDbType.VarChar,255){Value=this.Type_img},
                new SqlParameter("@status",SqlDbType.Int,4){Value=this.Status},
                new SqlParameter("@username",SqlDbType.VarChar,50){Value=this.Username},
                new SqlParameter("@id",SqlDbType.Int,4){Value=this.Type_id}
            };
            return DataProvider.executeNonQuery(sQuery, pars);
        }
    }
}