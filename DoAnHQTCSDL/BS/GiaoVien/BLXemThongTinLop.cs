using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DoAnHQTCSDL.BS.GiaoVien
{
    internal class BLXemThongTinLop
    {
        string maGV = "";
        DBMain db = null;
        public BLXemThongTinLop(string maGV, DBMain db)
        {
            this.maGV = maGV;
            this.db = db;
        }

        public DataSet LayThongTinLop()
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.XemTTLop('" + maGV + "');", CommandType.Text);
        }

        public bool CapNhatHocSinh(string maHS, string hoTen, DateTime ngSinh, string gioiTinh, string sdt, string diaChi, ref string err)
        {
            string sqlStr = "EXEC CapNhatHocSinh '" + maHS + "',N'" + hoTen + "','" + ngSinh.ToString("yyyy-MM-dd")
                + "',N'" + gioiTinh + "','" + sdt + "',N'" + diaChi + "';";
            return db.MyExecuteNonQuery(sqlStr, CommandType.Text, ref err);
        }

        public DataSet TimHocSinhTrongLop(string kiTu)
        {
            return db.ExecuteQueryDataSet("SELECT * FROM dbo.TimHocSinhTrongLop('" + maGV + "',N'" + kiTu + "');", CommandType.Text);
        }

        public int SiSoLop()
        {
            return db.ExecuteQueryInt("SELECT dbo.TraSiSoLop('" + maGV + "');", CommandType.Text);
        }
    }
}
