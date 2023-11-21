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
    public partial class CapNhatThongTin : UserControl
    {
        BLCapNhatTT blCapNhat = null;
        string err = "";

        public CapNhatThongTin(string maHoSo, DBMain db)
        {
            InitializeComponent();
            blCapNhat = new BLCapNhatTT(maHoSo, db);
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            this.panelTT.Enabled = true;
            this.btnCapNhat.Enabled = false;
            this.btnLuu.Enabled = true;
            this.btnHuy.Enabled = true;
            this.btnXoa.Enabled = false;
        }

        private void CapNhatThongTin_Load(object sender, EventArgs e)
        {
            this.txtTenDangNhap.ReadOnly = true;
            this.txtMatKhau.ReadOnly = true;
            this.LoadData();
        }

        private void LoadData()
        {
            this.panelTT.Enabled = false;
            this.btnLuu.Enabled = false;
            this.btnHuy.Enabled = false;
            this.btnCapNhat.Enabled = true;
            this.btnXoa.Enabled = true;
            DataSet ds = new DataSet();
            ds = blCapNhat.TraNguoiDung();
            DataTable dt = ds.Tables[0];
            DataRow dr = dt.Rows[0];
            this.txtHoTen.Text = dr["HoTen"].ToString();
            this.dtNgaySinh.Value = Convert.ToDateTime(dr["NgaySinh"]);
            string gioiTinh = dr["GioiTinh"].ToString();
            if(gioiTinh == "Nam")
                this.rdNam.Checked = true;
            else
                this.rdNu.Checked = true;
            this.txtSDT.Text = dr["SoDT"].ToString();
            this.txtDiaChi.Text = dr["DiaChi"].ToString();
            this.txtTenDangNhap.Text = dr["TenDangNhap"].ToString();
            this.txtMatKhau.Text = dr["MatKhau"].ToString();
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            string gioiTinh = "Nam";
            if (this.rdNu.Checked)
                gioiTinh = "Nữ";
            if (this.blCapNhat.CapNhatTT(txtHoTen.Text, dtNgaySinh.Value, gioiTinh, txtDiaChi.Text, txtSDT.Text, ref err))
                MessageBox.Show("Cập nhật thành công");
            else
                MessageBox.Show(err);
            this.LoadData();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.panelTT.Enabled = false;
            this.btnLuu.Enabled = false;
            this.btnHuy.Enabled = false;
            this.btnCapNhat.Enabled = true;
            this.btnXoa.Enabled = true;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (blCapNhat.XoaNguoiDung(ref err))
            {
                MessageBox.Show("Xóa thành công");
                this.Visible = false;
            }
            else
                MessageBox.Show(err);
        }
    }
}
