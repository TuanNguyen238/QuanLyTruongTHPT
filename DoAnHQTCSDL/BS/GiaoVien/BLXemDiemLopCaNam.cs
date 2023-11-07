using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.GiaoVien
{
    internal class BLXemDiemLopCaNam
    {
        string tenLop = "";
        DBMain db = null;
        int namHoc = 0;
        public BLXemDiemLopCaNam(string tenLop, DBMain db)
        {
            this.tenLop = tenLop;
            this.db = db;
        }

        public DataSet LayDiemLopCaNam()
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.XemDiemLopCaNam('" + this.tenLop + "', " + this.namHoc + ");", CommandType.Text);
        }

        public DataSet LayDanhHieuCaNam(string maHS)
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.XemDanhHieuCaNhanCaNam('" + maHS + "', " + this.namHoc + ");", CommandType.Text);
        }

        public void SetNamHoc(int namHoc)
        {
            this.namHoc = namHoc;
        }

        public DataSet TimDiemLopCaNam(string kiTu)
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.TimDiemLopCaNam('" + this.tenLop + "', " + this.namHoc + ",N'" + kiTu + "');", CommandType.Text);
        }
    }
}
