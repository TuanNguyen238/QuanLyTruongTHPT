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

namespace DoAnHQTCSDL.UserControls
{
    public partial class panelXemThongTin : UserControl
    {
        BLXemThongTin blXemTT = null;
        public panelXemThongTin(string maHS, DBMain db)
        {
            InitializeComponent();
            this.blXemTT = new BLXemThongTin(maHS, db);
        }



        private void panelXemThongTin_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = this.blXemTT.LayThongTinCaNhan();
            DataTable dt = ds.Tables[0];
            DataRow dr = dt.Rows[0];
            string maHS = dr["MaHS"].ToString();
            string hoTen = dr["HoTen"].ToString();
            DateTime ngSinh = Convert.ToDateTime(dr["NgaySinh"]);
            string gioiTinh = dr["GioiTinh"].ToString();
            string sdt = dr["SoDT"].ToString();
            string tenLop = dr["TenLop"].ToString();
            string namHoc = dr["NamHoc"].ToString();
            string diaChi = dr["DiaChi"].ToString();

            this.txtMaHS.Text = maHS;
            this.txtMaHS.ReadOnly = true;
            this.txtHoTen.Text = hoTen;
            this.txtHoTen.ReadOnly = true;
            this.dtNgaySinh.Value = ngSinh;
            this.dtNgaySinh.Enabled = false;
            if(gioiTinh == "Nam")
                this.rdNam.Checked = true;
            else if(gioiTinh == "Nữ")
                this.rdNu.Checked = true;
            this.rdNam.Enabled = false;
            this.rdNu.Enabled = false;
            this.txtSDT.Text = sdt;
            this.txtSDT.ReadOnly = true;
            this.txtLop.Text = tenLop;
            this.txtLop.ReadOnly = true;
            this.txtNamHoc.Text = namHoc;
            this.txtNamHoc.ReadOnly = true;
            this.txtDiaChi.Text = diaChi;
            this.txtDiaChi.ReadOnly = true;
        }
    }
}
