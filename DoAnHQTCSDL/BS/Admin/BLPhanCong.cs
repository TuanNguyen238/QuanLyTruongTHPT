using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.Admin
{
    internal class BLPhanCong
    {
        DBMain db = null;
        public BLPhanCong(DBMain db)
        {
            this.db = db;
        }

        public DataSet XemPhanCong()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM XemPhanCong", CommandType.Text);
        }

        public DataSet TimPhanCong(string kiTu)
        {
            return db.ExecuteQueryDataSet("SELECT * FROM TimPhanCong(N'" + kiTu + "');", CommandType.Text);
        }
    }
}
