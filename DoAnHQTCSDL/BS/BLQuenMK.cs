using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS
{
    internal class BLQuenMK
    {
        DBMain db = null;

        public BLQuenMK()
        {
            this.db = new DBMain();
        }

        public bool CapNhatMatKhau(string userName, string phoneNumber, string password, string checkPass, ref string err)
        {
            string sqlStr = "EXEC DoiMatKhau '" + userName + "','" + phoneNumber + "','" + password + "','" + checkPass + "';";
            return db.MyExecuteNonQuery(sqlStr, CommandType.Text, ref err);
        }
    }
}
