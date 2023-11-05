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
    }
}
