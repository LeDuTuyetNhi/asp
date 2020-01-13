using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace FoodShop.App_Code
{
    public class Account
    {
        private string _Username;
        private string _Pass;
        private string _Name;
        private string _Phone;
        private string _Email;
        private int _Role;
        private int _Status;
        public string Username { get => _Username; set => _Username = value; }
        public string Pass { get => _Pass; set => _Pass = value; }
        public string Name { get => _Name; set => _Name = value; }
        public string Phone { get => _Phone; set => _Phone = value; }
        public int Role { get => _Role; set => _Role = value; }
        public int Status { get => _Status; set => _Status = value; }
        public string Email { get => _Email; set => _Email = value; }

        public Account(string sUS, string sPass, string sName, string sPhone, string sEmail, int stt, int role)
        {

            
            _Username = sUS;
            _Name = sName;
            _Pass = sPass;
            _Phone = sPhone;
            _Email = sEmail;
            _Status = stt;
            _Role = role;
        }
        public bool AddMember()
        {
            string sQuery = "INSERT INTO [dbo].[Member]([username],[pass],[name],[phone],[email],[status],[role])VALUES(@username,@pass,@name,@phone,@email,@status,@role)";
            SqlParameter[] pars =
            {
                new SqlParameter("@username",SqlDbType.VarChar,50){Value=this.Username},
                new SqlParameter("@pass",SqlDbType.VarChar,255){ Value=(StringProc.MD5Hash(this.Pass))},
                new SqlParameter("@name",SqlDbType.NVarChar,200){ Value=this.Name},
                new SqlParameter("@phone",SqlDbType.VarChar,20){Value=this.Phone},
                new SqlParameter("@email",SqlDbType.VarChar,255){Value=this.Email},
                new SqlParameter("@role",SqlDbType.Int,4){Value=this.Role },
                new SqlParameter("@status",SqlDbType.Int,4){Value=this.Status },
            };

            return DataProvider.executeNonQuery(sQuery, pars);
        }
        public bool UpdateMember()
        {
            string sQuery = "UPDATE [dbo].[Member] SET [pass]=@pass,[name]=@name,[email]=@email,[phone]=@phone,[status]=@stt,[role]=@role WHERE [username]=@username";
            SqlParameter[] pars =
            {
                new SqlParameter("@username",SqlDbType.VarChar,50){ Value=this.Username},
                new SqlParameter("@pass",SqlDbType.VarChar,255){ Value=(StringProc.MD5Hash(this.Pass))},
                new SqlParameter("@name",SqlDbType.NVarChar,200){ Value=this.Name},
                new SqlParameter("@phone",SqlDbType.VarChar,20){Value=this.Phone},
                new SqlParameter("@email",SqlDbType.VarChar,255){Value=this.Email},
                new SqlParameter("@role",SqlDbType.Int,4){Value=this.Role },
                new SqlParameter("@stt",SqlDbType.Int,4){Value=this.Status },
            };

            return DataProvider.executeNonQuery(sQuery, pars);
        }
    }
}