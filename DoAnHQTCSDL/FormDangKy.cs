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
        }

        private void FormDangKy_Load(object sender, EventArgs e)
        {
            this.rdMale.Checked = true;
        }

        private void btnSignUp_Click(object sender, EventArgs e)
        {
            if (blDangKy.KiemTraDangKy(txtusername.Text, txtpassword.Text, txtfullname.Text,
                gioiTinh, dtdate.Value, txtAddress.Text, txtphonenumber.Text, ref err))
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
