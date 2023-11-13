using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAnHQTCSDL.BS.GiaoVien
{
    internal class BLXemThiDua
    {
        string tenLop = "";
        DBMain db = null;
        public BLXemThiDua(string tenLop, DBMain db)
        {
            this.tenLop = tenLop;
            this.db = db;
        }

        public DataSet ThiDua()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM dbo.XemThiDuaLop('" + tenLop + "');", CommandType.Text);
        }

        public DataSet TongKet_ThiDua()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM dbo.TraDTK_XepHang_ThiDua('" + tenLop + "');", CommandType.Text);
        }

        public DataSet TimKiemChiTietThiDua(string kiTu)
        {
            return db.ExecuteQueryDataSet("SELECT * FROM dbo.TimThiDuaLop('" + tenLop + "',N'" + kiTu + "');", CommandType.Text);
        }
    }
}
