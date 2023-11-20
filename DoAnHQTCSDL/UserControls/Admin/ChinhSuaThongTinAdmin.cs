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
    public partial class ChinhSuaThongTinAdmin : UserControl
    {
        BLChinhSuaThongTinAdmin blAdmin = null;
        string err = "";

        public ChinhSuaThongTinAdmin(string maNQL, DBMain db)
        {
            InitializeComponent();
            blAdmin = new BLChinhSuaThongTinAdmin(maNQL, db);
        }

        private void ChinhSuaThongTinAdmin_Load(object sender, EventArgs e)
        {
            this.txtMaNQL.ReadOnly = true;
            this.txtChucVu.ReadOnly = true;
            this.LoadData();
        }

        private void LoadData()
        {
            this.panelThongTin.Enabled = false;
            this.btnCapNhat.Enabled = true;
            this.btnLuu.Enabled = false;
            this.btnHuy.Enabled = false;
            DataSet ds = new DataSet();
            ds = this.blAdmin.XemThongTin();
            DataTable dt = ds.Tables[0];
            DataRow dr = dt.Rows[0];
            this.txtMaNQL.Text = dr["MaNQL"].ToString();
            this.txtHoTen.Text = dr["HoTen"].ToString();
            this.dtNgaySinh.Value = Convert.ToDateTime(dr["NgaySinh"]);
            string gioiTinh = dr["GioiTinh"].ToString();
            if (gioiTinh == "Nam")
                this.rdNam.Checked = true;
            else if (gioiTinh == "Nữ")
                this.rdNu.Checked = true;
            this.txtSDT.Text = dr["SDT"].ToString();
            this.txtChucVu.Text = dr["ChucVu"].ToString();
            this.txtDiaChi.Text = dr["DiaChi"].ToString();
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            this.panelThongTin.Enabled = true;
            this.btnCapNhat.Enabled = false;
            this.btnLuu.Enabled = true;
            this.btnHuy.Enabled = true;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            string gioiTinh = "Nam";
            if (this.rdNu.Checked)
                gioiTinh = "Nữ";
            if (this.blAdmin.CapNhatAdmin(txtHoTen.Text, dtNgaySinh.Value, gioiTinh, txtSDT.Text, txtDiaChi.Text, ref err))
                MessageBox.Show("Cập nhật thành công");
            else
                MessageBox.Show(err);
            this.LoadData();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.LoadData();
        }
    }
}
