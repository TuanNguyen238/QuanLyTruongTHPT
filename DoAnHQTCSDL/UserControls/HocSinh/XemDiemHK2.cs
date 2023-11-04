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
    public partial class XemDiemHK2 : UserControl
    {
        BLXemDiemHK blXemDiemHK = null;
        public XemDiemHK2(string maHS, DBMain db)
        {
            blXemDiemHK = new BLXemDiemHK(maHS, db);
            this.blXemDiemHK.SetKyHoc(2);
            InitializeComponent();
        }

        public void SetNamHoc(int namHoc)
        {
            this.blXemDiemHK.SetNamHoc(namHoc);
        }

        private void XemDiemHK2_Load(object sender, EventArgs e)
        {
            this.dgvHK2.ReadOnly = true;
            this.LoadData();
        }

        private void LoadData()
        {
            DataSet ds = new DataSet();
            ds = this.blXemDiemHK.LayDiemHK();
            DataTable dt = ds.Tables[0];
            this.dgvHK2.DataSource = dt;
            this.dgvHK2.Columns[0].HeaderText = "Tên môn";
            this.dgvHK2.Columns[1].HeaderText = "Điểm kiểm tra thường xuyên";
            this.dgvHK2.Columns[2].HeaderText = "Điểm kiểm tra giữa kỳ";
            this.dgvHK2.Columns[3].HeaderText = "Điểm kiểm tra cuối kỳ";
            this.dgvHK2.Columns[4].HeaderText = "Điểm trung bình môn";
            this.dgvHK2.ReadOnly = true;
            ds = this.blXemDiemHK.LayDanhHieuHK();
            DataTable dtn = ds.Tables[0];
            DataRow dr = dtn.Rows[0];
            string diemTK = dr["DiemHocKy"].ToString();
            string hanhKiem = dr["HanhKiemHocKy"].ToString();
            string danhHieu = dr["DanhHieuHocSinh"].ToString();
            this.txtDiemTongKet.Text = diemTK;
            this.txtDiemTongKet.ReadOnly = true;
            this.txtHanhKiem.Text = hanhKiem;
            this.txtHanhKiem.ReadOnly = true;
            this.txtDanhHieu.Text = danhHieu;
            this.txtDanhHieu.ReadOnly = true;
        }
    }
}
