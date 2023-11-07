using DoAnHQTCSDL.BS;
using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL
{
    internal class BLHocSinh: BLNguoiDung
    {
        public BLHocSinh(string username, DBMain db) : base(username, db) { }

        public override string TraLop(string maNguoiDung)
        {
            return db.ExecuteQueryString("SELECT dbo.TraLop('" + maNguoiDung + "');", CommandType.Text);
        }
    }
}
