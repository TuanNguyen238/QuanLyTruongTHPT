using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS
{
    internal class BLNguoiDung
    {
        protected string username = "";
        protected DBMain db = null;
        public BLNguoiDung(string username, DBMain db)
        {
            this.username = username;
            this.db = db;
        }

        public string TraMaNguoiDung()
        {
            return db.ExecuteQueryString("SELECT dbo.TraMaNguoiDung('" + username + "');", CommandType.Text);
        }

        public virtual string TraLop(string maNguoiDung)
        {
            return maNguoiDung;
        }
    }
}
