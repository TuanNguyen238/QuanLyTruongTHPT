using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.Admin
{
    internal class BLThemAdmin
    {
        DBMain db = null;
        
        public BLThemAdmin(DBMain db)
        {
            this.db = db;
        }

        public bool ThemAdmin(string tenDN, string matKhau, string hoTen, DateTime ngaySinh, string gioiTinh, string diaChi, string sdt, ref string err)
        {
            string sqlStr = "EXEC ThemAdmin '" + tenDN + "','" + matKhau + "',N'" + hoTen + "','" + ngaySinh + "',N'" + gioiTinh + "',N'" + diaChi + "','" + sdt + "';";
            return db.MyExecuteNonQuery(sqlStr, CommandType.Text, ref err);
        }
    }
}
