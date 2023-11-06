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
    public partial class XemDiemHSCaNam : UserControl
    {
        BLXemDiemTruongCaNam blXemDiemTruongCaNam = null;
        public XemDiemHSCaNam(DBMain db)
        {
            blXemDiemTruongCaNam = new BLXemDiemTruongCaNam(db);
            InitializeComponent();
        }

        public void SetNamHoc(int namHoc)
        {
            this.blXemDiemTruongCaNam.SetNamHoc(namHoc);
        }

        private void XemDiemHSCaNam_Load(object sender, EventArgs e)
        {
            this.dgvDiemHSCaNam.ReadOnly = true;
            this.LoadData();
        }

        private void LoadData()
        {
            DataSet ds = new DataSet();
            ds = this.blXemDiemTruongCaNam.LayDiemTruongCaNam();
            DataTable dt = ds.Tables[0];
            this.dgvDiemHSCaNam.DataSource = dt;
            this.dgvDiemHSCaNam.Columns[0].HeaderText = "Mã học sinh";
            this.dgvDiemHSCaNam.Columns[1].HeaderText = "Lớp";
            this.dgvDiemHSCaNam.Columns[2].HeaderText = "Họ tên";
            this.dgvDiemHSCaNam.Columns[3].HeaderText = "Trung bình môn";
            this.dgvDiemHSCaNam.Columns[4].HeaderText = "Hạnh kiểm";
            this.dgvDiemHSCaNam.Columns[5].HeaderText = "Danh hiệu";
            this.dgvDiemHSCaNam.Columns[6].HeaderText = "Xếp hạng";
            this.dgvDiemHSCaNam.ReadOnly = true;
        }
    }
}
