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
        ChinhSuaThongTinHocSinh chinhSuaThongTinHocSinh = new ChinhSuaThongTinHocSinh();
        XemDiemHocSinh xemDiemHocSinh = new XemDiemHocSinh();
        XemThoiKhoaBieu xemThoiKhoaBieu = new XemThoiKhoaBieu();
        XemLichDay xemLichDay = new XemLichDay();
        XemThiDua xemThiDua = new XemThiDua();
        XemPhanHoi xemPhanHoi = new XemPhanHoi();
        public FormGiaoVien()
        {
            InitializeComponent();
        }

        private void btnChinhSua_Click(object sender, EventArgs e)
        {
            this.panelGiaoVien.Controls.Clear();
            this.panelGiaoVien.Controls.Add(chinhSuaThongTinHocSinh);
        }

        private void btnXemDiem_Click(object sender, EventArgs e)
        {
            this.panelGiaoVien.Controls.Clear();
            this.panelGiaoVien.Controls.Add(xemDiemHocSinh);
        }

        private void btnXemTKB_Click(object sender, EventArgs e)
        {
            this.panelGiaoVien.Controls.Clear();
            this.panelGiaoVien.Controls.Add(xemThoiKhoaBieu);
        }

        private void btnXemLichDay_Click(object sender, EventArgs e)
        {
            this.panelGiaoVien.Controls.Clear();
            this.panelGiaoVien.Controls.Add(xemLichDay);
        }

        private void btnXemThiDua_Click(object sender, EventArgs e)
        {
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
            if (System.Windows.Forms.MessageBox.Show("Bạn có muốn thoát không?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)

            {
                this.Hide();
                FormDangNhap formDangNhap = new FormDangNhap();
                formDangNhap.ShowDialog();


            }

            else

            {
                FormGiaoVien formGiaoVien = new FormGiaoVien();
                formGiaoVien.ShowDialog();
            }
        }
    }
}
