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
    internal class BLXemDiemLopHK
    {
        string tenLop = "";
        DBMain db = null;
        int namHoc = 0, kyHoc = 0;
        public BLXemDiemLopHK(string tenLop, DBMain db)
        {
            this.tenLop = tenLop;
            this.db = db;
        }

        public DataSet LayDiemLopHK()
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.XemDiemLopHocKy('" + this.tenLop + "'," + this.kyHoc + ", " + this.namHoc + ");", CommandType.Text);
        }

        public DataSet LayDanhHieuHK(string maHS)
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.XemDanhHieuCaNhanHocKy('" + maHS + "'," + this.kyHoc + ", " + this.namHoc + ");", CommandType.Text);
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
