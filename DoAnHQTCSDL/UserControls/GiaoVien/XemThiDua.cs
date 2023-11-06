using DoAnHQTCSDL.BS.GiaoVien;
using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAnHQTCSDL.UserControls
{
    public partial class XemThiDua : UserControl
    {
        BLXemThiDua bLXemThiDua = null;
        public XemThiDua(string tenLop, DBMain db)
        {
            InitializeComponent();
            this.txtLop.Text = tenLop;
            bLXemThiDua = new BLXemThiDua(tenLop, db);
        }

        private void XemThiDua_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = bLXemThiDua.ThiDua();
            DataTable dt = new DataTable();
            dt = ds.Tables[0];
            dgvXemThiDua.DataSource = dt;
            dgvXemThiDua.Columns[0].HeaderText = "Mã nội quy";
            dgvXemThiDua.Columns[0].HeaderText = "Điều lệ vi phạm";
            dgvXemThiDua.Columns[0].HeaderText = "Số lần vi phạm";
            dgvXemThiDua.Columns[0].HeaderText = "Tổng số điểm trừ";
            ds = bLXemThiDua.TongKet_ThiDua();
            dt = ds.Tables[0];
            if (this.txtLop.Text.Length > 0)
            {
                DataRow dr = dt.Rows[0];
                string diemTongKet = dr["DiemTongKet"].ToString();
                string xephang = dr["XepHang"].ToString();
                this.txtDiemTongKet.Text = diemTongKet;
                this.txtDiemTongKet.ReadOnly = true;
                this.txtXepHang.Text = xephang;
                this.txtXepHang.ReadOnly = true;
            }
        }
    }
}
