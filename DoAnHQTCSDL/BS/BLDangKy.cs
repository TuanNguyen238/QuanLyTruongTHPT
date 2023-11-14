using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
namespace DoAnHQTCSDL.BS.Admin
{
    internal class BLDangKy
    {
        DBMain db = null;
        public BLDangKy()
        {
            this.db = new DBMain();
        }

        public bool KiemTraDangKy(string tenDN, string matKhau, string hoTen, string gioiTinh, DateTime ngaySinh, string diaChi, string sdt, int vaiTro, ref string err)
        {
            string sqlStr = "EXEC Them_LoaiNguoiDung '" + tenDN + "','" + matKhau + "',N'" + hoTen + "','" + ngaySinh + "',N'" + gioiTinh + "','" + diaChi + "','" + sdt + "'," + vaiTro + ";" ;
            return db.MyExecuteNonQuery(sqlStr, CommandType.Text, ref err);
        }
    }
}
