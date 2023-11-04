using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS
{
    internal class BLXemThongTin
    {
        DBMain db = null;
        string maHS = "";
        public BLXemThongTin(string maHS, DBMain db)
        {
            this.maHS = maHS;
            this.db = db;
        }

        public DataSet LayThongTinCaNhan()
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.XemTTCaNhan('" + this.maHS + "');", CommandType.Text);
        }
    }
}
