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
    public partial class XemDiemLopHK2 : UserControl
    {
        BLXemDiemLopHK blXemDiemLopHK = null;
        public XemDiemLopHK2(string tenLop, DBMain db)
        {
            InitializeComponent();
            blXemDiemLopHK = new BLXemDiemLopHK(tenLop, db);
            this.blXemDiemLopHK.SetKyHoc(2);
        }

        public void SetNamHoc(int namHoc)
        {
            this.blXemDiemLopHK.SetNamHoc(namHoc);
        }

        private void XemDiemLopHK2_Load(object sender, EventArgs e)
        {
            this.dgvHK2.ReadOnly = true;
            this.LoadData();
        }

        private void LoadData()
        {
            this.panelTT.Enabled = false;
            this.panelTK.Enabled = false;
            this.ResetAllText();
            DataSet ds = new DataSet();
            ds = this.blXemDiemLopHK.LayDiemLopHK();
            DataTable dt = ds.Tables[0];
            this.dgvHK2.DataSource = dt;
            this.dgvHK2.Columns[0].HeaderText = "Mã học sinh";
            this.dgvHK2.Columns[1].HeaderText = "Họ tên";
            this.dgvHK2.Columns[2].HeaderText = "Tên môn";
            this.dgvHK2.Columns[3].HeaderText = "Điểm kiểm tra thường xuyên";
            this.dgvHK2.Columns[4].HeaderText = "Điểm kiểm tra giữa kỳ";
            this.dgvHK2.Columns[5].HeaderText = "Điểm kiểm tra cuối kỳ";
            this.dgvHK2.Columns[6].HeaderText = "Điểm trung bình môn";
            this.dgvHK2_CellClick(null, null);
        }

        public void TimKiem(string kiTu)
        {
            this.panelTT.Enabled = false;
            this.panelTK.Enabled = false;
            this.ResetAllText();
            DataSet ds = new DataSet();
            ds = this.blXemDiemLopHK.TimDiemLopHocKy(kiTu);
            DataTable dt = ds.Tables[0];
            this.dgvHK2.DataSource = dt;
            this.dgvHK2.Columns[0].HeaderText = "Mã học sinh";
            this.dgvHK2.Columns[1].HeaderText = "Họ tên";
            this.dgvHK2.Columns[2].HeaderText = "Tên môn";
            this.dgvHK2.Columns[3].HeaderText = "Điểm kiểm tra thường xuyên";
            this.dgvHK2.Columns[4].HeaderText = "Điểm kiểm tra giữa kỳ";
            this.dgvHK2.Columns[5].HeaderText = "Điểm kiểm tra cuối kỳ";
            this.dgvHK2.Columns[6].HeaderText = "Điểm trung bình môn";
            this.dgvHK2_CellClick(null, null);
        }

        private void dgvHK2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvHK2.CurrentCell != null)
            {
                // Thứ tự dòng hiện hành
                int r = dgvHK2.CurrentCell.RowIndex;
                if (!dgvHK2.Rows[r].Cells.Cast<DataGridViewCell>().Any(c => c.Value == null))
                {
                    // Chuyển thông tin lên panel
                    this.txtMaHS.Text =
                    dgvHK2.Rows[r].Cells[0].Value.ToString();
                    this.txtMon.Text =
                    dgvHK2.Rows[r].Cells[2].Value.ToString();
                    this.txtDiemKTTX.Text =
                    dgvHK2.Rows[r].Cells[3].Value.ToString();
                    this.txtDiemKTGK.Text =
                    dgvHK2.Rows[r].Cells[4].Value.ToString();
                    this.txtDiemCK.Text =
                    dgvHK2.Rows[r].Cells[5].Value.ToString();
                    this.txtTBM.Text =
                    dgvHK2.Rows[r].Cells[6].Value.ToString();
                    if (txtMaHS.Text.Length > 0)
                    {
                        DataSet ds = blXemDiemLopHK.LayDanhHieuHK(this.txtMaHS.Text);
                        DataTable dtn = ds.Tables[0];
                        DataRow dr = dtn.Rows[0];
                        string diemTK = dr["DiemHocKy"].ToString();
                        string hanhKiem = dr["HanhKiemHocKy"].ToString();
                        string danhHieu = dr["DanhHieuHocSinh"].ToString();
                        this.txtDiemTongKet.Text = diemTK;
                        this.txtHanhKiem.Text = hanhKiem;
                        this.txtDanhHieu.Text = danhHieu;
                    }
                }
            }
        }

        public void ResetAllText()
        {
            this.txtMaHS.ResetText();
            this.txtMon.ResetText();
            this.txtDiemKTTX.ResetText();
            this.txtDiemKTGK.ResetText();
            this.txtDiemCK.ResetText();
            this.txtTBM.ResetText();
        }

        public void CapNhat()
        {
            panelTT.Enabled = true;
            this.txtMaHS.Enabled = false;
            this.txtTBM.Enabled = false;
            this.txtMon.Enabled = false;
            this.txtDiemKTTX.Focus();
        }

        public void Luu()
        {
            panelTT.Enabled = false;
            string err = "";
            if (blXemDiemLopHK.CapNhatDiem(txtMaHS.Text, txtMon.Text,
                txtDiemKTTX.Text, txtDiemKTGK.Text, txtDiemCK.Text, ref err))
            {
                // Load lại dữ liệu trên DataGridView
                this.txtMaHS.Enabled = true;
                this.txtTBM.Enabled = true;
                this.txtMon.Enabled = true;
                // Thông báo
                MessageBox.Show("Đã sửa xong!");
            }
            else
                MessageBox.Show(err);
            LoadData();
        }

        public void Huy()
        {
            this.txtMaHS.Enabled = true;
            this.txtTBM.Enabled = true;
            this.txtMaHS.Enabled = true;
            this.txtMon.Enabled = true;
            this.ResetAllText();
            this.panelTT.Enabled = false;
            dgvHK2_CellClick(null, null);
        }
    }
}
