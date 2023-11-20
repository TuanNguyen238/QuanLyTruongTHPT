using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.GiaoVien
{
    internal class BLChinhSuaThongTinGV
    {
        string maGV = "";
        DBMain db = null;

        public BLChinhSuaThongTinGV(string maGV, DBMain db)
        {
            this.maGV = maGV;
            this.db = db;
        }

        public DataSet XemThongTin()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM dbo.TraTTGiaoVien('" + maGV + "');", CommandType.Text);
        }

        public bool CapNhatGiaoVien(string hoTen, DateTime ngaySinh, string gioiTinh, string soDT, string monHoc, string diaChi, ref string err)
        {
            string sqlStr = "EXEC CapNhatGiaoVien '" + maGV + "',N'" + hoTen + "','" + ngaySinh + "',N'" + gioiTinh + "','" + soDT + "',N'" + monHoc + "',N'" + diaChi + "';";
            return db.MyExecuteNonQuery(sqlStr, CommandType.Text, ref err);
        }

        public DataSet XemMon()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM TraDanhSachMon;", CommandType.Text);
        }

        public bool ThemMon(string monHoc, ref string err)
        {
            string sqlStr = "EXEC ChonMonDay '" + maGV + "',N'" + monHoc + "';";
            return db.MyExecuteNonQuery(sqlStr, CommandType.Text, ref err);
        }
    }
}
