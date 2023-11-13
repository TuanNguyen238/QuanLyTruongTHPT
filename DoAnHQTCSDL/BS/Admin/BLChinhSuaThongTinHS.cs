using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS
{
    internal class BLChinhSuaThongTinHS
    {
        DBMain db = null;
        public BLChinhSuaThongTinHS(DBMain db)
        {
            this.db = db;
        }

        public DataSet LayThongTinHocSinh()
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM XemHocSinh;", CommandType.Text);
        }

        public bool CapNhatHocSinh(string maHS, string hoTen, DateTime ngSinh, string gioiTinh, string sdt, string diaChi, ref string err)
        {
            string sqlStr = "EXEC CapNhatHocSinh '" + maHS + "',N'" + hoTen + "','" + ngSinh.ToString("yyyy-MM-dd")
                + "',N'" + gioiTinh + "','" + sdt + "',N'" + diaChi + "';";
            return db.MyExecuteNonQuery(sqlStr, CommandType.Text, ref err);
        }

        public DataSet TimHocSinh(string kiTu)
        {
            return db.ExecuteQueryDataSet("SELECT * FROM dbo.TimHocSinh(N'" + kiTu + "');", CommandType.Text);
        }

        public int TinhTongHocSinh()
        {
            return db.ExecuteQueryInt("SELECT dbo.TinhTongHocSinh();", CommandType.Text);
        }

        public bool XoaHocSinh(string maHS, ref string err)
        {
            string sqlStr = "EXEC XoaHocSinh '" + maHS + "';";
            return db.MyExecuteNonQuery(sqlStr, CommandType.Text, ref err);
        }
    }
}
