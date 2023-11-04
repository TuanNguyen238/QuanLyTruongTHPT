using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAnHQTCSDL.BS.HocSinh
{
    internal class BLXemDiemHK
    {
        string maHS = "";
        DBMain db = null;
        int namHoc = 0, kyHoc = 0;
        public BLXemDiemHK(string maHS, DBMain db)
        {
            this.maHS = maHS;
            this.db = db;
        }

        public DataSet LayDiemHK()
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.XemDiemCaNhanHocKy('" + this.maHS + "'," + this.kyHoc + ", " + this.namHoc + ");", CommandType.Text);
        }

        public DataSet LayDanhHieuHK()
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.XemDanhHieuCaNhanHocKy('" + this.maHS + "'," + this.kyHoc + ", " + this.namHoc + ");", CommandType.Text);
        }

        public void SetNamHoc(int namHoc)
        {
            this.namHoc = namHoc;
        }

        public void SetKyHoc(int kyHoc)
        {
            this.kyHoc = kyHoc;
        }
    }
}
