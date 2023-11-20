using DoAnHQTCSDL.BS.GiaoVien;
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

namespace DoAnHQTCSDL.UserControls.GiaoVien
{
    public partial class ChinhSuaThongTinGiaoVien : UserControl
    {
        BLChinhSuaThongTinGV blGv = null;
        public ChinhSuaThongTinGiaoVien(string maGv, DBMain db)
        {
            InitializeComponent();
            blGv = new BLChinhSuaThongTinGV(maGv, db);
        }

        private void ChinhSuaThongTinGiaoVien_Load(object sender, EventArgs e)
        {
            this.panelThongTin.Enabled = false;
            this.LoadData();
        }

        private void LoadData()
        {
            DataSet ds = new DataSet();
            ds = this.blGv.XemThongTin();
            DataTable dt = ds.Tables[0];
            DataRow dr = dt.Rows[0];
            this.txtMaGV.Text = dr["MaGV"].ToString();
            this.txtHoTen.Text = dr["HoTen"].ToString();
            this.dtNgaySinh.Value = Convert.ToDateTime(dr["NgaySinh"]);
            string gioiTinh = dr["GioiTinh"].ToString();
            if (gioiTinh == "Nam")
                this.rdNam.Checked = true;
            else if(gioiTinh == "Nữ")
                this.rdNu.Checked = true;
            this.txtSDT.Text = dr["SDT"].ToString();
            this.txtLop.Text = dr["TenLop"].ToString();
            this.txtMonHoc.Text = dr["TenMon"].ToString();
            this.txtDiaChi.Text = dr["DiaChi"].ToString();
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            this.panelThongTin.Enabled = true;
            this.btnLuu.Enabled = true;
            this.btnHuy.Enabled = true;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {

        }
    }
}
