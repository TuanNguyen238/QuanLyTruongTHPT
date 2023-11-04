using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.HocSinh
{
    internal class BLPhanHoi
    {
        string maHS = "";
        DBMain db = null;
        public BLPhanHoi(string maHs, DBMain db)
        {
            this.maHS = maHs;
            this.db = db;
        }

        public DataSet LayMaGiaoVien()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM TraGiaovien;", CommandType.Text);
        }

        public bool GuiPhanHoi(string maGv)
        {
            // return db.MyExecuteNonQuery("", CommandType.Text, ref err);
            return true;
        }
    }
}
