using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.HocSinh
{
    internal class BLXemTKB
    {
        DBMain db = null;
        string tenLop = "";
        public BLXemTKB(string tenLop, DBMain db)
        {
            this.tenLop = tenLop;
            this.db = db;
        }

        public DataSet LayTKB(int kyHoc)
        {
            return this.db.ExecuteQueryDataSet(" EXEC XemTKB '" + this.tenLop + "', " + kyHoc + ";", CommandType.Text);
        }
    }
}
