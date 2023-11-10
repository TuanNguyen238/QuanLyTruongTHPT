using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.Admin
{
    internal class BLXemDiemTruongHK
    {
        DBMain db = null;
        int namHoc = 0, kyHoc = 0;
        public BLXemDiemTruongHK(DBMain db)
        {
            this.db = db;
        }

        public DataSet LayDiemTruongHK()
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.XemDiemTruongHocKy(" + this.kyHoc + ", " + this.namHoc + ");", CommandType.Text);
        }

        public void SetNamHoc(int namHoc)
        {
            this.namHoc = namHoc;
        }

        public void SetKyHoc(int kyHoc)
        {
            this.kyHoc = kyHoc;
        }

        public DataSet TimDiemTruongHK(string kiTu)
        {
            return db.ExecuteQueryDataSet("SELECT * FROM dbo.TimDiemTruongHocKy(" + this.kyHoc + "," + this.namHoc + ",N'" + kiTu + "');", CommandType.Text);
        }
    }
}
