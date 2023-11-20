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

namespace DoAnHQTCSDL.UserControls.Admin
{
    public partial class ThemAdmin : UserControl
    {
        BLThemAdmin bLThemAdmin = null;
        string err = "";
        string gioiTinh = "";

        public ThemAdmin(DBMain db)
        {
            InitializeComponent();
            bLThemAdmin = new BLThemAdmin(db);
        }

        private void ThemAdmin_Load(object sender, EventArgs e)
        {
            this.rdNam.Checked = true;
        }

        private void rdNam_CheckedChanged(object sender, EventArgs e)
        {
            this.gioiTinh = "Nam";
        }

        private void rdNu_CheckedChanged(object sender, EventArgs e)
        {
            this.gioiTinh = "Nữ";
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Xác nhận thêm admin!!", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                if (this.bLThemAdmin.ThemAdmin(txtusername.Text, txtpassword.Text, txtHoTen.Text, dtNgaySinh.Value, this.gioiTinh, txtDiaChi.Text, txtSDT.Text, ref err))
                    MessageBox.Show("Thêm admin thành công!");
                else
                    MessageBox.Show(err);
            }
        }
    }
}
