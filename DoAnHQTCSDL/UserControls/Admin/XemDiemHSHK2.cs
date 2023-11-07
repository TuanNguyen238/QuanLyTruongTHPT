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
    public partial class XemDiemHSHK2 : UserControl
    {
        BLXemDiemTruongHK blXemDiemTruongHK = null;
        public XemDiemHSHK2(DBMain db)
        {
            InitializeComponent();
            blXemDiemTruongHK = new BLXemDiemTruongHK(db);
            this.blXemDiemTruongHK.SetKyHoc(1);
        }

        public void SetNamHoc(int namHoc)
        {
            this.blXemDiemTruongHK.SetNamHoc(namHoc);
        }

        private void XemDiemHSHK2_Load(object sender, EventArgs e)
        {
            this.dgvXemDiemHSHK2.ReadOnly = true;
            this.LoadData();
        }

        private void LoadData()
        {
            DataSet ds = new DataSet();
            ds = this.blXemDiemTruongHK.LayDiemTruongHK();
            DataTable dt = ds.Tables[0];
            this.dgvXemDiemHSHK2.DataSource = dt;
            this.dgvXemDiemHSHK2.Columns[0].HeaderText = "Mã học sinh";
            this.dgvXemDiemHSHK2.Columns[1].HeaderText = "Lớp";
            this.dgvXemDiemHSHK2.Columns[2].HeaderText = "Họ tên";
            this.dgvXemDiemHSHK2.Columns[3].HeaderText = "Trung bình môn";
            this.dgvXemDiemHSHK2.Columns[4].HeaderText = "Hạnh kiểm";
            this.dgvXemDiemHSHK2.Columns[5].HeaderText = "Danh hiệu";
        }
    }
}
