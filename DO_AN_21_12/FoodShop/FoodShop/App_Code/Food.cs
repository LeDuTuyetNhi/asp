using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace FoodShop.App_Code
{
    public class Food
    {
        private int _Id;
        private string _Name;
        private string _Desciption;
        private int _Price;
        private int _Price_promo;
        private string _Thumb;
        private string _Img;
        private string _Unit;
        private int _Precent_promo;
        private int _Rating;
        private int _Sold;
        private int _Point;
        private int _Type;
        private int _Status;
        private string _Username;
        private DateTime _Modified;

        public int Id { get => _Id; set => _Id = value; }
        public string Name { get => _Name; set => _Name = value; }
        public string Desciption { get => _Desciption; set => _Desciption = value; }
        
        public string Thumb { get => _Thumb; set => _Thumb = value; }
        public string Img { get => _Img; set => _Img = value; }
        public string Unit { get => _Unit; set => _Unit = value; }
        
        public int Rating { get => _Rating; set => _Rating = value; }
        public int Sold { get => _Sold; set => _Sold = value; }
        
        public int Type { get => _Type; set => _Type = value; }
        public int Status { get => _Status; set => _Status = value; }
        public string Username { get => _Username; set => _Username = value; }
        public DateTime Modified { get => _Modified; set => _Modified = value; }
        public int Price { get => _Price; set => _Price = value; }
        public int Price_promo { get => _Price_promo; set => _Price_promo = value; }
        public int Precent_promo { get => _Precent_promo; set => _Precent_promo = value; }
        public int Point { get => _Point; set => _Point = value; }

        public Food(string sName, string sDescription, int sPrice, int sPrice_promo, string sThumb, string sImg, string sUnit, int sPrecent_promo, int sRating, int sSold, int sPoint, int sType, int stt, string sUs,int Sid)
        {
            _Name = sName;
            _Desciption = sDescription;
            Price = sPrice;
            Price_promo = sPrice_promo;
            _Thumb = sThumb;
            _Img = sImg;
            _Unit = sUnit;
            Precent_promo = sPrecent_promo;
            _Rating = sRating;
            _Sold = sSold;
            Point = sPoint;
            _Type = sType;
            _Status = stt;
            _Username = sUs;
            _Id = Sid;
        }
        public bool AddFood()
        {
            string sQuery = "INSERT INTO [dbo].[Food]([name],[description],[price],[price_promo],[thumb],[img],[unit],[percent_promo],[rating],[sold],[point],[type],[status],[username],[modified])VALUES(@name,@description,@price,@price_promo,@thumb,@img,@unit,@percent_promo,@rating,@sold,@point,@type,@status,@username,GETDATE())";
            SqlParameter[] pars =
            {
                new SqlParameter("@name",SqlDbType.NVarChar,50){Value=this.Name},
                new SqlParameter("@description",SqlDbType.Text,255){Value=this.Desciption},
                new SqlParameter("@price",SqlDbType.Int,4){ Value=this.Price},
                new SqlParameter("@price_promo",SqlDbType.Int,4){Value=this.Price_promo},
                 new SqlParameter("@thumb",SqlDbType.VarChar,255){Value=this.Thumb},
                 new SqlParameter("@img",SqlDbType.VarChar,255){Value=this.Img},
                 new SqlParameter("@unit",SqlDbType.NVarChar,10){ Value=this.Unit},
                 new SqlParameter("@percent_promo",SqlDbType.Int,4){Value=this.Precent_promo},
                 new SqlParameter("@rating",SqlDbType.Int,4){Value=this.Rating},
                 new SqlParameter("@sold",SqlDbType.Int,4){Value=this.Sold},
                 new SqlParameter("@point",SqlDbType.Int,4){Value=this.Point},
                 new SqlParameter("@type",SqlDbType.Int,4){Value=this.Type},
                 new SqlParameter("@status",SqlDbType.Int,4){Value=this.Status},
                 new SqlParameter("@username",SqlDbType.VarChar,50){Value=this.Username}
            };
            return DataProvider.executeNonQuery(sQuery, pars);
        }
        public bool UpdateFood()
        {
            string sQuery = "UPDATE [dbo].[Food] SET [name] = @name ,[description] = @description ,[price]=@price,[price_promo]=@price_promo,[thumb]=@thumb,[img]=@img,[unit]=@unit,[percent_promo]=@percent_promo,[rating]=@rating,[sold]=@sold,[point]=@point,[type]=@type,[status]=@status,[username]=@username,[modified]=GETDATE() WHERE [id]=@id";
            SqlParameter[] pars =
            {
                new SqlParameter("@name",SqlDbType.NVarChar,50){Value=this.Name},
                new SqlParameter("@description",SqlDbType.Text,255){Value=this.Desciption},
                new SqlParameter("@price",SqlDbType.Int,4){ Value=this.Price},
                new SqlParameter("@price_promo",SqlDbType.Int,4){Value=this.Price_promo},
                 new SqlParameter("@thumb",SqlDbType.VarChar,255){Value=this.Thumb},
                 new SqlParameter("@img",SqlDbType.VarChar,255){Value=this.Img},
                 new SqlParameter("@unit",SqlDbType.NVarChar,10){ Value=this.Unit},
                 new SqlParameter("@percent_promo",SqlDbType.Int,4){Value=this.Precent_promo},
                 new SqlParameter("@rating",SqlDbType.Int,4){Value=this.Rating},
                 new SqlParameter("@sold",SqlDbType.Int,4){Value=this.Sold},
                 new SqlParameter("@point",SqlDbType.Int,4){Value=this.Point},
                 new SqlParameter("@type",SqlDbType.Int,4){Value=this.Type},
                 new SqlParameter("@status",SqlDbType.Int,4){Value=this.Status},
                 new SqlParameter("@id",SqlDbType.Int,4){Value=this.Id},
                 new SqlParameter("@username",SqlDbType.VarChar,50){Value=this.Username}
            };
            return DataProvider.executeNonQuery(sQuery, pars);
        }
    }
}