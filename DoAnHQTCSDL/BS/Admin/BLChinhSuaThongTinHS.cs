using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS
{
    internal class BLChinhSuaThongTinHS
    {
        DBMain db = null;
        public BLChinhSuaThongTinHS(DBMain db)
        {
            this.db = db;
        }

        public DataSet LayThongTinHocSinh()
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM XemHocSinh;", CommandType.Text);
        }
    }
}
