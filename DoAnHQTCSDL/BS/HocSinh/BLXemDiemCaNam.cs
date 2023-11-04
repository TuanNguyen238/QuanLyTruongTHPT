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
    internal class BLXemDiemCaNam
    {
        string maHS = "";
        DBMain db = null;
        int namHoc = 0;
        public BLXemDiemCaNam(string maHS, DBMain db)
        {
            this.maHS = maHS;
            this.db = db;
        }

        public DataSet LayDiemCaNam()
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.XemDiemCaNhanCaNam('" + this.maHS + "', " + this.namHoc + ");", CommandType.Text);
        }

        public DataSet LayDanhHieuCaNam()
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.XemDanhHieuCaNhanCaNam('" + this.maHS + "', " + this.namHoc + ");", CommandType.Text);
        }

        public void SetNamHoc(int namHoc)
        {
            this.namHoc = namHoc;
        }
    }
}
