using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DoAnHQTCSDL.BS.TuyenSinh
{
    internal class BLDangKyTuyenSinh
    {
        string maHoSo = "";
        DBMain db = null;
        
        public BLDangKyTuyenSinh(string maHoSo, DBMain db)
        {
            this.maHoSo = maHoSo;
            this.db = db;
        }

        public bool KiemTraTuyenSinh()
        {
            if (db.ExecuteQueryInt("SELECT dbo.KiemTraTuyenSinh('" + this.maHoSo + "');", CommandType.Text) == 1)
                return true;
            return false;
        }

        public bool KiemTraDiem(ref string err)
        {
            return db.MyExecuteNonQuery("EXEC KiemTraDiemTS '" + this.maHoSo + "';", CommandType.Text, ref err);
        }

        public bool ThemTuyenSinh(string diemToan, string diemVan, string diemAnh, string truong, ref string err)
        {
            return db.MyExecuteNonQuery("EXEC GuiTuyenSinh '" + this.maHoSo + "','" + diemToan + "','" + diemVan + "','" + diemAnh + "',N'" + truong + "';", CommandType.Text, ref err);
        }

        public bool XoaTuyenSinh(ref string err)
        {
            return db.MyExecuteNonQuery("EXEC XoaHoSo'" + this.maHoSo + "';", CommandType.Text, ref err);
        }
    }
}
