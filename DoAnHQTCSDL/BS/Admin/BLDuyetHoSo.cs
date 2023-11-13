using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.Admin
{
    internal class BLDuyetHoSo
    {
        DBMain db = null;
        public BLDuyetHoSo(DBMain db)
        {
            this.db = db;
        }

        public DataSet XemDanhSachLopNhapHoc()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM XemDanhSachLopNhapHoc", CommandType.Text);
        }

        public DataSet XemDanhSachTuyenSinh()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM XemDanhSachNhapHoc", CommandType.Text);
        }

        public bool ThemHocSinh(string maHocSinh, string tenLop, int namHoc, ref string err)
        {
            string sqlStr = "EXEC ThemHocSinhVaoLop '" + maHocSinh + "','" + tenLop + "'," + namHoc + ";";
            return db.MyExecuteNonQuery(sqlStr, CommandType.Text, ref err);
        }
    }
}
