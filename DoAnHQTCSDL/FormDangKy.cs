using DoAnHQTCSDL.BS;
using DoAnHQTCSDL.BS.Admin;
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
    public partial class FormDangKy : Form
    {
        BLDangKy blDangKy = null;
        string err = "";
        string gioiTinh = "";
        public FormDangKy()
        {
            InitializeComponent();
            blDangKy = new BLDangKy();
            this.cbvaiTro.Items.Add("Giáo viên");
            this.cbvaiTro.Items.Add("Học sinh");
        }

        private void FormDangKy_Load(object sender, EventArgs e)
        {
            this.rdMale.Checked = true;
            this.cbvaiTro.SelectedIndex = 0;
        }

        private void btnSignUp_Click(object sender, EventArgs e)
        {
            int vaiTro = 2;
            if (cbvaiTro.SelectedIndex == 1)
                vaiTro = 3;
            if (blDangKy.KiemTraDangKy(txtusername.Text, txtpassword.Text, txtfullname.Text,
                gioiTinh, dtdate.Value, txtAddress.Text, txtphonenumber.Text, vaiTro, ref err))
            {
                MessageBox.Show("Đăng ký thành công!");
                this.Hide();
                FormDangNhap formDangNhap = new FormDangNhap();
                formDangNhap.ShowDialog();
            }
            else
                MessageBox.Show(err);
        }

        private void rdMale_CheckedChanged(object sender, EventArgs e)
        {
            this.gioiTinh = "Nam";
        }

        private void rdFemale_CheckedChanged(object sender, EventArgs e)
        {
            this.gioiTinh = "Nữ";
        }

        private void btnReturn_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            this.Hide();
            FormDangNhap formDangNhap = new FormDangNhap();
            formDangNhap.ShowDialog();
        }
    }
}