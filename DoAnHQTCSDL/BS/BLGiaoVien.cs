using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS
{
    internal class BLGiaoVien: BLNguoiDung
    {
        public BLGiaoVien(string username, DBMain db) : base(username, db) { }

        public override string TraLop(string maNguoiDung)
        {
            return db.ExecuteQueryString("SELECT dbo.LopCuaGiaoVien('" + maNguoiDung + "');", CommandType.Text);
        }
    }
}
