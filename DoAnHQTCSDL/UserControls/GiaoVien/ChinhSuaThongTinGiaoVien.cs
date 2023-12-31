﻿using DoAnHQTCSDL.BS.GiaoVien;
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
        string err = "";
        public ChinhSuaThongTinGiaoVien(string maGv, DBMain db)
        {
            InitializeComponent();
            blGv = new BLChinhSuaThongTinGV(maGv, db);
            this.cbMonHoc.DataSource = blGv.XemMon().Tables[0];
            this.cbMonHoc.DisplayMember = "TenMonHoc";
            this.cbMonHoc.ValueMember = "TenMonHoc";
        }

        private void ChinhSuaThongTinGiaoVien_Load(object sender, EventArgs e)
        {
            this.txtLop.ReadOnly = true;
            this.txtMaGV.ReadOnly = true;
            this.LoadData();
        }

        private void LoadData()
        {
            this.panelThongTin.Enabled = false;
            this.btnCapNhat.Enabled = true;
            this.btnLuu.Enabled = false;
            this.btnHuy.Enabled = false;
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
            string tenMon = dr["TenMon"].ToString();
            if (tenMon != "")
                this.cbMonHoc.SelectedValue = tenMon;
            else
            {
                this.cbMonHoc.SelectedIndex = 0;
                if (this.blGv.ThemMon(cbMonHoc.SelectedValue.ToString(), ref err))
                    MessageBox.Show("Đã tự động cập nhật môn học cho giáo viên");
                else
                    MessageBox.Show(err);
            }    
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
            if (this.blGv.CapNhatGiaoVien(txtHoTen.Text, dtNgaySinh.Value, gioiTinh, txtSDT.Text, cbMonHoc.SelectedValue.ToString(), txtDiaChi.Text, ref err))
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
