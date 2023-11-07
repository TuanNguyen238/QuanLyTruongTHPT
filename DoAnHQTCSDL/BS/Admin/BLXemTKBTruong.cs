using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.Admin
{
    internal class BLXemTKBTruong
    {
        private DBMain db = null;

        public BLXemTKBTruong(DBMain db)
        {
            this.db = db;
        }

        public DataSet LayTKBLop(string tenLop, int kyHoc)
        {
            return db.ExecuteQueryDataSet(" EXEC XemTKB '" + tenLop + "', " + kyHoc + ";", CommandType.Text);
        }

        public DataSet TraDanhSachLop()
        {
            return db.ExecuteQueryDataSet("EXEC XemLopTrongTruong", CommandType.Text);
        }
    }
}
