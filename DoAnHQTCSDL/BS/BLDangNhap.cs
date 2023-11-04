using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS
{
    internal class BLDangNhap
    {
        DBMain db = null;
        string username = null;
        string password = null;
        public BLDangNhap(string username, string password)
        {
            this.username = username;
            this.password = password;
            this.db = new DBMain();
        }

        public int KiemTraDangNhap()
        {
            string queryStr = "SELECT dbo.KiemTra_LoaiNguoiDung('" + this.username + "', '" + this.password + "');";
            int loaiNguoiDung = this.db.ExecuteQueryInt(queryStr, CommandType.Text);
            this.db.KetNoiDB(loaiNguoiDung);
            return loaiNguoiDung;
        }

        public DBMain TraVeDB()
        {
            return this.db;
        }
    }
}
