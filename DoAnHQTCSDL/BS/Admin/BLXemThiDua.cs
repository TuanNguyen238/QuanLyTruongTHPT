using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.Admin
{
    internal class BLXemThiDua
    {
        DBMain db = null;
        public BLXemThiDua(DBMain db)
        {
            this.db = db;
        }

        public DataSet XemThiDua()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM XemThiDuaCaTruong", CommandType.Text);
        }
    }
}
