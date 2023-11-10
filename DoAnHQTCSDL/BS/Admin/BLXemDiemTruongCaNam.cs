using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.Admin
{
    internal class BLXemDiemTruongCaNam
    {
        DBMain db = null;
        int namHoc = 0;
        public BLXemDiemTruongCaNam(DBMain db)
        {
            this.db = db;
        }

        public DataSet LayDiemTruongCaNam()
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.XemDiemTruongCaNam(" + this.namHoc + ");", CommandType.Text);
        }

        public void SetNamHoc(int namHoc)
        {
            this.namHoc = namHoc;
        }

        public DataSet TimDiemTruongCaNam(string kiTu)
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.TimDiemTruongCaNam(" + this.namHoc + ",N'" + kiTu + "');", CommandType.Text);
        }
    }
}
