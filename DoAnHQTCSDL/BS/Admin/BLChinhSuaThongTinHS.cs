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
        string username = "";
        public BLChinhSuaThongTinHS(string username, DBMain db)
        {
            this.db = db;
            this.username = username;
        }

        public DataSet LayThongTinHocSinh()
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM XemHocSinh;", CommandType.Text);
        }
    }
}
