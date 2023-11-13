using DoAnHQTCSDL.BS;
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
    public partial class FormQuenMatKhau : Form
    {
        BLQuenMK blQuenMK = null;
        string err = "";

        public FormQuenMatKhau()
        {
            InitializeComponent();
            blQuenMK = new BLQuenMK();
        }

        private void btnSubmit_Click(object sender, EventArgs e)
        {
            if (blQuenMK.CapNhatMatKhau(txtusername.Text, txtphonenumber.Text, txtpassword.Text, txtCheckPass.Text, ref err))
            {
                MessageBox.Show("Cập nhật mật khẩu thành công!");
                this.Hide();
                FormDangNhap formDangNhap = new FormDangNhap();
                formDangNhap.ShowDialog();
            }
            else
                MessageBox.Show(err);
        }

        private void btnReturn_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            this.Hide();
            FormDangNhap formDangNhap = new FormDangNhap();
            formDangNhap.ShowDialog();
        }

        private void FormQuenMatKhau_Load(object sender, EventArgs e)
        {

        }
    }
}
