using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DoAnHQTCSDL.BS
{
    internal class BLTuyenSinh: BLNguoiDung
    {
        public BLTuyenSinh(string usename, DBMain db) : base(usename, db) { }

        public bool KiemTraUsername()
        {
            if(db.ExecuteQueryInt("SELECT dbo.KiemTraTenNguoiDung('" + this.username + "');", CommandType.Text) == 1)
                return true;
            return false;
        }
    }
}
