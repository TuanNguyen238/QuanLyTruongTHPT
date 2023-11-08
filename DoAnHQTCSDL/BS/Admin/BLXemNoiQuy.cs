using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.Admin
{
    internal class BLXemNoiQuy
    {
        string maNQL = "";
        DBMain db = null;
        public BLXemNoiQuy(string maNQL, DBMain db)
        {
            this.maNQL = maNQL;
            this.db = db;
        }

        public DataSet XemNoiQuy()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM XemNoiQuy", CommandType.Text);
        }
    }
}
