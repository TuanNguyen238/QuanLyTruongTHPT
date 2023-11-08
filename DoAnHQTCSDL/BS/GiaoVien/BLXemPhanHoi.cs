using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.GiaoVien
{
    internal class BLXemPhanHoi
    {
        string maGV = "";
        DBMain db = null;
        public BLXemPhanHoi(string maGV, DBMain db)
        {
            this.maGV = maGV;
            this.db = db;
        }

        public DataSet XemPhanHoi()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM dbo.XemPhanHoi('" + maGV + "');", CommandType.Text);
        }

        public bool XoaPhanHoi(string maHS, ref string err)
        {
            return db.MyExecuteNonQuery("EXEC XoaPhanHoi '" + maHS + "','" + maGV + "';", CommandType.Text, ref err);
        }
    }
}
