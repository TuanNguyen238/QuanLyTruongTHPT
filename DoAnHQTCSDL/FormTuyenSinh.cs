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
    public partial class FormTuyenSinh : Form
    {
        CapNhatThongTin capNhatThongTin = null;
        DangKyTuyenSinh dangKyTuyenSinh = null;
        BLTuyenSinh bLTuyenSinh = null;
        string maHoSo = "";
        DBMain db = null;
        public FormTuyenSinh(string usename, DBMain db)
        {
            InitializeComponent();
            bLTuyenSinh = new BLTuyenSinh(usename, db);
            if (bLTuyenSinh.KiemTraUsername())
            {
                maHoSo = bLTuyenSinh.TraMaNguoiDung();
                this.db = db;
                capNhatThongTin = new CapNhatThongTin(maHoSo, db);
                dangKyTuyenSinh = new DangKyTuyenSinh(maHoSo, db);
            }
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            if (capNhatThongTin != null)
            {
                this.panelTuyenSinh.Controls.Clear();
                this.panelTuyenSinh.Controls.Add(capNhatThongTin);
            }
        }

        private void btnDangKy_Click(object sender, EventArgs e)
        {
            if (capNhatThongTin.Visible)
            {
                this.panelTuyenSinh.Controls.Clear();
                this.panelTuyenSinh.Controls.Add(dangKyTuyenSinh);
            }
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
