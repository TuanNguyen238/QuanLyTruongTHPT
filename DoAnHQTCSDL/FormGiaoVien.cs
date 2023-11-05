using DoAnHQTCSDL.BS;
using DoAnHQTCSDL.DB;
using DoAnHQTCSDL.UserControls;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAnHQTCSDL
{
    public partial class FormGiaoVien : Form
    {
        ChinhSuaThongTinHocSinh chinhSuaThongTinHocSinh = null;
        XemDiemHocSinh xemDiemHocSinh = null;
        XemThoiKhoaBieuLop xemThoiKhoaBieuLop = null;
        XemThiDua xemThiDua = null;
        XemPhanHoi xemPhanHoi = new XemPhanHoi();
        BLGiaoVien blGiaoVien = null;
        string maGV = "", tenLop = "";
        DBMain db = null;
        public FormGiaoVien(string username, DBMain db)
        {
            InitializeComponent();
            blGiaoVien = new BLGiaoVien(username, db);
            this.maGV = blGiaoVien.TraMaNguoiDung();
            this.tenLop = blGiaoVien.TraLop(this.maGV);
            this.db = db;
        }

        private void btnChinhSua_Click(object sender, EventArgs e)
        {
            chinhSuaThongTinHocSinh = new ChinhSuaThongTinHocSinh(maGV, db);
            this.panelGiaoVien.Controls.Clear();
            this.panelGiaoVien.Controls.Add(chinhSuaThongTinHocSinh);
        }

        private void btnXemDiem_Click(object sender, EventArgs e)
        {
            xemDiemHocSinh = new XemDiemHocSinh(maGV, tenLop, db);
            this.panelGiaoVien.Controls.Clear();
            this.panelGiaoVien.Controls.Add(xemDiemHocSinh);
        }

        private void btnXemTKB_Click(object sender, EventArgs e)
        {
            xemThoiKhoaBieuLop = new XemThoiKhoaBieuLop(this.tenLop, this.db);
            this.panelGiaoVien.Controls.Clear();
            this.panelGiaoVien.Controls.Add(xemThoiKhoaBieuLop);
        }

        private void btnXemThiDua_Click(object sender, EventArgs e)
        {
            xemThiDua = new XemThiDua(this.tenLop, this.db);
            this.panelGiaoVien.Controls.Clear();
            this.panelGiaoVien.Controls.Add(xemThiDua);
        }

        private void btnPhanHoi_Click(object sender, EventArgs e)
        {
            this.panelGiaoVien.Controls.Clear();
            this.panelGiaoVien.Controls.Add(xemPhanHoi);
        }

        private void btnDangXuat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát không?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)

            {
                this.Hide();
                FormDangNhap formDangNhap = new FormDangNhap();
                formDangNhap.ShowDialog();
            }
        }
    }
}
