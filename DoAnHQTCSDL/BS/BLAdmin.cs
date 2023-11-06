using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS
{
    internal class BLAdmin
    {
        string username = "";
        DBMain db = null;

        public BLAdmin(string username, DBMain db)
        {
            this.username = username;
            this.db = db;
        }

        public string TraMaNguoiDung()
        {
            return db.ExecuteQueryString("SELECT dbo.TraMaNguoiDung('" + username + "');", CommandType.Text);
        }
    }
}
