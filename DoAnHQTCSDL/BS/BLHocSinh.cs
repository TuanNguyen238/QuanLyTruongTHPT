using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL
{
    internal class BLHocSinh
    {
        string username = "";
        DBMain db = null;
        public BLHocSinh(string username, DBMain db)
        {
            this.username = username;
            this.db = db;
        }

        public string TraMaNguoiDung()
        {
            return db.ExecuteQueryString("SELECT dbo.TraMaNguoiDung('" + username + "');", CommandType.Text);
        }

        public string TraLop(string maHS)
        {
            return db.ExecuteQueryString("SELECT dbo.TraLop('" + maHS + "');", CommandType.Text);
        }
    }
}
