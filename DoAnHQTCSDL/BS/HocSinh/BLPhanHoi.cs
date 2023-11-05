using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

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

        public bool GuiPhanHoi(string maGv, string noiDung, ref string err)
        {
            string SQLstr = "EXEC GuiPhanHoi '" + this.maHS + "','" + maGv + "',N'" + noiDung + "';";
            return db.MyExecuteNonQuery(SQLstr, CommandType.Text, ref err);
        }
    }
}
