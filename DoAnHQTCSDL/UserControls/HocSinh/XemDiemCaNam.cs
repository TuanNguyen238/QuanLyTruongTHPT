using DoAnHQTCSDL.BS.HocSinh;
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
namespace DoAnHQTCSDL.UserControls.HocSinh
{
    public partial class XemDiemCaNam : UserControl
    {
        BLXemDiemCaNam blXemDiemCaNam = null;
        public XemDiemCaNam(string maHS, DBMain db)
        {
            blXemDiemCaNam = new BLXemDiemCaNam(maHS, db);
            InitializeComponent();
        }

        public void SetNamHoc(int namHoc)
        {
            this.blXemDiemCaNam.SetNamHoc(namHoc);
        }

        private void XemDiemCaNam_Load(object sender, EventArgs e)
        {
            this.dgvCaNam.ReadOnly = true;
            this.LoadData();
        }

        private void LoadData()
        {
            DataSet ds = new DataSet();
            ds = this.blXemDiemCaNam.LayDiemCaNam();
            DataTable dt = ds.Tables[0];
            this.dgvCaNam.DataSource = dt;
            this.dgvCaNam.Columns[0].HeaderText = "Tên môn học";
            this.dgvCaNam.Columns[1].HeaderText = "Điểm trung bình môn";
            ds = this.blXemDiemCaNam.LayDanhHieuCaNam();
            DataTable dtn = ds.Tables[0];
            DataRow dr = dtn.Rows[0];
            string diemTK = dr["DiemCaNam"].ToString();
            string hanhKiem = dr["HanhKiemCaNam"].ToString();
            string danhHieu = dr["CaNam"].ToString();
            string xepHang = dr["XepHang"].ToString();
            this.txtDiemTongKet.Text = diemTK;
            this.txtDiemTongKet.ReadOnly = true;
            this.txtHanhKiem.Text = hanhKiem;
            this.txtHanhKiem.ReadOnly = true;
            this.txtDanhHieu.Text = danhHieu;
            this.txtDanhHieu.ReadOnly = true;
            this.txtXepHang.Text = xepHang;
            this.txtXepHang.ReadOnly = true;
        }
    }
}
