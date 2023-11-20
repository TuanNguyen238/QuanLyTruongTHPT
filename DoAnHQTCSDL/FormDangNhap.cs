using DoAnHQTCSDL.BS;
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

namespace DoAnHQTCSDL
{
    public partial class FormDangNhap : Form
    {
        BLDangNhap blDangNhap = null;
        public FormDangNhap()
        {
            InitializeComponent();
        }

        private void FormDangNhap_Load(object sender, EventArgs e)
        {
        }

        private void btnClick_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            this.Hide();
            FormDangKy formDangKy = new FormDangKy();
            formDangKy.ShowDialog();

        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            this.blDangNhap = new BLDangNhap(this.txtUsername.Text, this.txtPassword.Text);
            int loaiNguoiDung = this.blDangNhap.KiemTraDangNhap();
            if (loaiNguoiDung > 0)
            {
                this.Hide();
                DBMain db = blDangNhap.TraVeDB();
                if (loaiNguoiDung == 1)
                {
                    FormAdmin frmAdmin = new FormAdmin(this.txtUsername.Text, db);
                    frmAdmin.ShowDialog();
                }
                else if (loaiNguoiDung == 2)
                {
                    FormGiaoVien frmGiaoVien = new FormGiaoVien(this.txtUsername.Text, db);
                    frmGiaoVien.ShowDialog();
                }
                else if (loaiNguoiDung == 3)
                {
                    if (blDangNhap.KiemTraTonTaiHocSinh())
                    {
                        FormHocSinh frmHocSinh = new FormHocSinh(this.txtUsername.Text, db);
                        frmHocSinh.ShowDialog();
                    }
                    else
                    {
                        FormTuyenSinh frmTuyenSinh = new FormTuyenSinh(this.txtUsername.Text, db);
                        frmTuyenSinh.ShowDialog();
                    }
                }
            }
            else
                MessageBox.Show("Tên đăng nhập hoặc mật khẩu không đúng");
        }

        private void btnForgot_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            this.Hide();
            FormQuenMatKhau formQuenMatKhau = new FormQuenMatKhau();
            formQuenMatKhau.ShowDialog();

        }
    }
}
