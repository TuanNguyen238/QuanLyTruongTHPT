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
    public partial class XemDiemLopCaNam : UserControl
    {
        BLXemDiemLopCaNam blXemDiemLopCaNam = null;
        public XemDiemLopCaNam(string tenLop, DBMain db)
        {
            blXemDiemLopCaNam = new BLXemDiemLopCaNam(tenLop, db);
            InitializeComponent();
        }

        public void SetNamHoc(int namHoc)
        {
            this.blXemDiemLopCaNam.SetNamHoc(namHoc);
        }

        private void XemDiemLopCaNam_Load(object sender, EventArgs e)
        {
            this.dgvCaNam.ReadOnly = true;
            this.panelTT.Enabled = false;
            this.panelTK.Enabled = false;
            this.LoadData();
        }

        private void LoadData()
        {
            DataSet ds = new DataSet();
            ds = this.blXemDiemLopCaNam.LayDiemLopCaNam();
            DataTable dt = ds.Tables[0];
            this.dgvCaNam.DataSource = dt;
            this.dgvCaNam.Columns[0].HeaderText = "Mã học sinh";
            this.dgvCaNam.Columns[1].HeaderText = "Họ tên";
            this.dgvCaNam.Columns[2].HeaderText = "Tên môn học";
            this.dgvCaNam.Columns[3].HeaderText = "Điểm trung bình môn";
            this.dgvCaNam.ReadOnly = true;
            this.dgvCaNam_CellClick(null, null);
        }

        private void dgvCaNam_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvCaNam.CurrentCell != null)
            {
                // Thứ tự dòng hiện hành
                int r = dgvCaNam.CurrentCell.RowIndex;
                if (!dgvCaNam.Rows[r].Cells.Cast<DataGridViewCell>().Any(c => c.Value == null))
                {
                    // Chuyển thông tin lên panel
                    this.txtMaHS.Text =
                    dgvCaNam.Rows[r].Cells[0].Value.ToString();
                    this.txtMon.Text =
                    dgvCaNam.Rows[r].Cells[2].Value.ToString();
                    this.txtTBM.Text =
                    dgvCaNam.Rows[r].Cells[3].Value.ToString();
                    if (txtMaHS.Text.Length > 0)
                    {
                        DataSet ds = blXemDiemLopCaNam.LayDanhHieuCaNam(this.txtMaHS.Text);
                        DataTable dtn = ds.Tables[0];
                        DataRow dr = dtn.Rows[0];
                        string diemTK = dr["DiemCaNam"].ToString();
                        string hanhKiem = dr["HanhKiemCaNam"].ToString();
                        string danhHieu = dr["CaNam"].ToString();
                        string xepHang = dr["XepHang"].ToString();
                        this.txtDiemTongKet.Text = diemTK;
                        this.txtHanhKiem.Text = hanhKiem;
                        this.txtDanhHieu.Text = danhHieu;
                        this.txtXepHang.Text = xepHang;
                    }
                }
            }
        }

        public void TimKiem(string kiTu)
        {
            DataSet ds = new DataSet();
            ds = this.blXemDiemLopCaNam.TimDiemLopCaNam(kiTu);
            DataTable dt = ds.Tables[0];
            this.dgvCaNam.DataSource = dt;
            this.dgvCaNam.Columns[0].HeaderText = "Mã học sinh";
            this.dgvCaNam.Columns[1].HeaderText = "Họ tên";
            this.dgvCaNam.Columns[2].HeaderText = "Tên môn học";
            this.dgvCaNam.Columns[3].HeaderText = "Điểm trung bình môn";
            this.dgvCaNam.ReadOnly = true;
        }
    }
}
