using DoAnHQTCSDL.BS.TuyenSinh;
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
    public partial class DangKyTuyenSinh : UserControl
    {
        BLDangKyTuyenSinh blDangKy = null;
        string err = "";
        public DangKyTuyenSinh(string maHoSo, DBMain db)
        {
            InitializeComponent();
            blDangKy = new BLDangKyTuyenSinh(maHoSo, db);
        }

        private void DangKyTuyenSinh_Load(object sender, EventArgs e)
        {
            this.LoadData();
        }

        private void LoadData()
        {
            if (blDangKy.KiemTraTuyenSinh())
            {
                if (blDangKy.KiemTraDiem(ref err))
                    err = "Hồ sơ đang được admin duyệt!";
                lbThongBao.Text = "Hồ sơ đã được gửi.\n" + err;
                lbThongBao.Visible = true;
            }
            else
                lbThongBao.Visible = false;
        }

        private void btnGui_Click(object sender, EventArgs e)
        {
            if (blDangKy.ThemTuyenSinh(txtDiemToan.Text, txtDiemNguVan.Text, txtDiemAnhVan.Text, txtTruongTHCS.Text, ref err))
            {
                MessageBox.Show("Gửi hồ sơ thành công");
                this.LoadData();
            }
            else
                MessageBox.Show(err);
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if(blDangKy.XoaTuyenSinh(ref err))
            {
                MessageBox.Show("Xóa hồ sơ thành công");
                this.LoadData();
            }
            else
                MessageBox.Show(err);
        }
    }
}
