using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.GiaoVien
{
    internal class BLChinhSuaThongTinGV
    {
        string maGV = "";
        DBMain db = null;

        public BLChinhSuaThongTinGV(string maGV, DBMain db)
        {
            this.maGV = maGV;
            this.db = db;
        }

        public DataSet XemThongTin()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM dbo.TraTTGiaoVien('" + maGV + "');", CommandType.Text);
        }
    }
}
