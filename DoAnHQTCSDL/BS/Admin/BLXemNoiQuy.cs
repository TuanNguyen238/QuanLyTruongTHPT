using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.Admin
{
    internal class BLXemNoiQuy
    {
        string maNQL = "";
        DBMain db = null;
        public BLXemNoiQuy(string maNQL, DBMain db)
        {
            this.maNQL = maNQL;
            this.db = db;
        }

        public DataSet XemNoiQuy()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM XemNoiQuy", CommandType.Text);
        }

        public DataSet TimNoiQuy(string kiTu)
        {
            return db.ExecuteQueryDataSet("SELECT * FROM dbo.TimNoiQuy(N'" + kiTu + "');", CommandType.Text);
        }

        public bool ThemNoiQuy(string maNQ, string dieuLe, string soDiemTru, DateTime ngayBanHanh, ref string err)
        {
            string sqlStr = "EXEC ThemNoiQuy '" + this.maNQL + "','" + maNQ + "',N'" + dieuLe + "','" + soDiemTru + "','" + ngayBanHanh + "';";
            return db.MyExecuteNonQuery(sqlStr, CommandType.Text, ref err);
        }

        public bool CapNhatNoiQuyLanDau(string maNQL, string maNQ, string dieuLe, string soDiemTru, DateTime ngayBanHanh, ref string err)
        {
            string sqlStr = "EXEC CapNhatNoiQuyLanDau '" + this.maNQL +  "','" + maNQL + "','" + maNQ + "',N'" + dieuLe + "','" + soDiemTru + "','" + ngayBanHanh + "';";
            return db.MyExecuteNonQuery(sqlStr, CommandType.Text, ref err);
        }

        public string LayNoiQuyTuDieuLe(string dieuLe)
        {
            return db.ExecuteQueryString("SELECT dbo.LayNoiQuyTuDieuLe(N'" + dieuLe + "');", CommandType.Text);
        }

        public bool CapNhatNoiQuy(string maNQ, string dieuLe, string soDiemTru, DateTime ngayBanHanh, ref string err)
        {
            string sqlStr = "EXEC CapNhatNoiQuy '" + this.maNQL + "','" + maNQ + "',N'" + dieuLe + "','" + soDiemTru + "','" + ngayBanHanh + "';";
            return db.MyExecuteNonQuery(sqlStr, CommandType.Text, ref err);
        }

        public bool XoaNoiQuy(string maNQ, ref string err)
        {
            string sqlStr = "EXEC XoaNoiQuy '"  + maNQ + "';";
            return db.MyExecuteNonQuery(sqlStr, CommandType.Text, ref err);

        }
    }
}
