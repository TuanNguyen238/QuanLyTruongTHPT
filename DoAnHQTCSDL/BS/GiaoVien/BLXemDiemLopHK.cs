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
    internal class BLXemDiemLopHK
    {
        string tenLop = "";
        DBMain db = null;
        int namHoc = 0, kyHoc = 0;
        public BLXemDiemLopHK(string tenLop, DBMain db)
        {
            this.tenLop = tenLop;
            this.db = db;
        }

        public DataSet LayDiemLopHK()
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.XemDiemLopHocKy('" + this.tenLop + "'," + this.kyHoc + ", " + this.namHoc + ");", CommandType.Text);
        }

        public DataSet LayDanhHieuHK(string maHS)
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.XemDanhHieuCaNhanHocKy('" + maHS + "'," + this.kyHoc + ", " + this.namHoc + ");", CommandType.Text);
        }

        public void SetNamHoc(int namHoc)
        {
            this.namHoc = namHoc;
        }

        public void SetKyHoc(int kyHoc)
        {
            this.kyHoc = kyHoc;
        }

        public DataSet TimDiemLopHocKy(string kiTu)
        {
            return this.db.ExecuteQueryDataSet("SELECT * FROM dbo.TimDiemLopHocKy('" + this.tenLop + "',N'" + kiTu + "'," + this.kyHoc + ", " + this.namHoc + ");", CommandType.Text);
        }

        public bool CapNhatDiem(string maHS, string tenMon, float thuongXuyen, float giuaKy, float cuoiKy, ref string err)
        {
            string sqlStr = "EXEC CapNhatDiemHocKy '" + maHS + "',N'" + tenMon + "'," + kyHoc + "," + namHoc + "," + thuongXuyen + "," + giuaKy + "," + cuoiKy + ";";
            return db.MyExecuteNonQuery(sqlStr, CommandType.Text, ref err);
        }
    }
}
