using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.Admin
{
    internal class BLChinhSuaThongTinAdmin
    {
        string maNQL = "";
        DBMain db = null;
        public BLChinhSuaThongTinAdmin(string maNQL, DBMain db)
        {
            this.maNQL = maNQL;
            this.db = db;
        }

        public DataSet XemThongTin()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM dbo.XemAdmin('" + maNQL + "');", CommandType.Text);
        }

        public bool CapNhatAdmin(string hoTen, DateTime ngaySinh, string gioiTinh, string soDT, string diaChi, ref string err)
        {
            string sqlStr = "EXEC CapNhatAdmin '" + maNQL + "',N'" + hoTen + "','" + ngaySinh + "',N'" + gioiTinh + "','" + soDT + "',N'" + diaChi + "';";
            return db.MyExecuteNonQuery(sqlStr, CommandType.Text, ref err);
        }
    }
}
