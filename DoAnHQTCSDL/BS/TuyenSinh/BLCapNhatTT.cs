using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DoAnHQTCSDL.BS.TuyenSinh
{
    internal class BLCapNhatTT
    {
        string maHoSo = "";
        DBMain db = null;

        public BLCapNhatTT(string maHoSo, DBMain db)
        {
            this.maHoSo = maHoSo;
            this.db = db;
        }

        public bool CapNhatTT(string tenDN, string matKhau, string hoTen, DateTime ngaySinh, string gioiTinh, string diaChi, string soDT, ref string err)
        {
            string sqlStr = "EXEC CapNhatNguoiDung '" + this.maHoSo + "','" + tenDN + "','" + matKhau + "',N'" + hoTen + "','" + ngaySinh + "',N'" + gioiTinh + "',N'" + diaChi + "','" + soDT + "';";
            return db.MyExecuteNonQuery(sqlStr, CommandType.Text, ref err);
        }

        public DataSet TraNguoiDung()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM dbo.LayNguoiDung('" + maHoSo + "');", CommandType.Text);
        }

        public bool XoaNguoiDung(ref string err)
        {
            return db.MyExecuteNonQuery("EXEC XoaNguoiDung '" + maHoSo + "';", CommandType.Text, ref err);
        }
    }
}
