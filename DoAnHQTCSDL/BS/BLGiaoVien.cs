using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS
{
    internal class BLGiaoVien
    {
        string username = "";
        DBMain db = null;

        public BLGiaoVien(string username, DBMain db)
        {
            this.username = username;
            this.db = db;
        }

        public string TraMaNguoiDung()
        {
            return db.ExecuteQueryString("SELECT dbo.TraMaNguoiDung('" + username + "');", CommandType.Text);
        }

        public string TraLop(string maGV)
        {
            return db.ExecuteQueryString("SELECT dbo.LopCuaGiaoVien('" + maGV + "');", CommandType.Text);
        }
    }
}
