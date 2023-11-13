using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAnHQTCSDL.BS.GiaoVien
{
    internal class BLXemThiDua
    {
        string tenLop = "";
        DBMain db = null;
        public BLXemThiDua(string tenLop, DBMain db)
        {
            this.tenLop = tenLop;
            this.db = db;
        }

        public DataSet ThiDua()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM dbo.XemThiDuaLop('" + tenLop + "');", CommandType.Text);
        }

        public DataSet TongKet_ThiDua()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM dbo.TraDTK_XepHang_ThiDua('" + tenLop + "');", CommandType.Text);
        }

        public DataSet TimKiemChiTietThiDua(string kiTu)
        {
            return db.ExecuteQueryDataSet("SELECT * FROM dbo.TimThiDuaLop('" + tenLop + "',N'" + kiTu + "');", CommandType.Text);
        }

        public DataSet LayNoiQuy()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM LayNoiQuy", CommandType.Text);
        }

        public int LaySoDiemTru(string dieuLe)
        {
            return db.ExecuteQueryInt("SELECT dbo.LayDiemTuDieuLe(N'" + dieuLe + "');", CommandType.Text);
        }

        public bool ThemDanhGia(string tenLop, string dieuLe, ref string err)
        {
            return db.MyExecuteNonQuery("EXEC ThemDanhGia '" + tenLop + "','" + LayMaNoiQuy(dieuLe) + "';", CommandType.Text, ref err);
        }

        public bool SuaDanhGia(string tenLop, string dieuLe, int soLanVP, ref string err)
        {
            return db.MyExecuteNonQuery("EXEC SuaDanhGia '" + tenLop + "','" + LayMaNoiQuy(dieuLe) + "'," + soLanVP + ";", CommandType.Text, ref err);
        }

        public bool XoaDanhGia(string tenLop, string dieuLe, ref string err)
        {
            return db.MyExecuteNonQuery("EXEC XoaDanhGia '" + tenLop + "','" + LayMaNoiQuy(dieuLe) + "';", CommandType.Text, ref err);
        }

        public string LayMaNoiQuy(string dieuLe)
        {
            return db.ExecuteQueryString("SELECT dbo.LayNoiQuyTuDieuLe(N'" + dieuLe + "');", CommandType.Text);
        }
    }
}
