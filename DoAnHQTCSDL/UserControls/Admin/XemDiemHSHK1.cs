using DoAnHQTCSDL.BS.Admin;
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

namespace DoAnHQTCSDL.UserControls.Admin
{
    public partial class XemDiemHSHK1 : UserControl
    {
        BLXemDiemTruongHK blXemDiemTruongHK = null;
        public XemDiemHSHK1(DBMain db)
        {
            InitializeComponent();
            blXemDiemTruongHK = new BLXemDiemTruongHK(db);
            this.blXemDiemTruongHK.SetKyHoc(1);
        }

        public void SetNamHoc(int namHoc)
        {
            this.blXemDiemTruongHK.SetNamHoc(namHoc);
        }

        private void XemDiemHSHK1_Load(object sender, EventArgs e)
        {
            this.dgvXemDiemHSHK1.ReadOnly = true;
            this.LoadData();
        }

        private void LoadData()
        {
            DataSet ds = new DataSet();
            ds = this.blXemDiemTruongHK.LayDiemTruongHK();
            DataTable dt = ds.Tables[0];
            this.dgvXemDiemHSHK1.DataSource = dt;
            this.dgvXemDiemHSHK1.Columns[0].HeaderText = "Mã học sinh";
            this.dgvXemDiemHSHK1.Columns[1].HeaderText = "Lớp";
            this.dgvXemDiemHSHK1.Columns[2].HeaderText = "Họ tên";
            this.dgvXemDiemHSHK1.Columns[3].HeaderText = "Trung bình môn";
            this.dgvXemDiemHSHK1.Columns[4].HeaderText = "Hạnh kiểm";
            this.dgvXemDiemHSHK1.Columns[5].HeaderText = "Danh hiệu";
        }

        public void TimKiem(string kiTu)
        {
            DataSet ds = new DataSet();
            ds = this.blXemDiemTruongHK.TimDiemTruongHK(kiTu);
            DataTable dt = ds.Tables[0];
            this.dgvXemDiemHSHK1.DataSource = dt;
            this.dgvXemDiemHSHK1.Columns[0].HeaderText = "Mã học sinh";
            this.dgvXemDiemHSHK1.Columns[1].HeaderText = "Lớp";
            this.dgvXemDiemHSHK1.Columns[2].HeaderText = "Họ tên";
            this.dgvXemDiemHSHK1.Columns[3].HeaderText = "Trung bình môn";
            this.dgvXemDiemHSHK1.Columns[4].HeaderText = "Hạnh kiểm";
            this.dgvXemDiemHSHK1.Columns[5].HeaderText = "Danh hiệu";
        }
    }
}
