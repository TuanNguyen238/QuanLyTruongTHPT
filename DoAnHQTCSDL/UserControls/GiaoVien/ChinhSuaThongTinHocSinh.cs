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

namespace DoAnHQTCSDL.UserControls
{
    public partial class ChinhSuaThongTinHocSinh : UserControl
    {
        BLXemThongTinLop blXemThongTinLop = null;
        public ChinhSuaThongTinHocSinh(string maGV, DBMain db)
        {
            InitializeComponent();
            blXemThongTinLop = new BLXemThongTinLop(maGV, db);
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            panelChinhSua.Enabled = true;
            btnCapNhat.Enabled = false;
            btnLuu.Enabled = true;
            btnHuy.Enabled = true;
            txtMaHS.Enabled = false;
            this.txtLop.Enabled = false;
            this.txtNamHoc.Enabled = false;
            txtHoTen.Focus();
        }

        private void ChinhSuaThongTinHocSinh_Load(object sender, EventArgs e)
        {
            dgvChinhSuaThongTin.ReadOnly = true;
            LoadData();
        }

        private void LoadData()
        {
            this.btnLuu.Enabled = false;
            this.btnHuy.Enabled = false;
            this.panelChinhSua.Enabled = false;
            this.btnCapNhat.Enabled = true;
            this.ResetAllText();
            DataSet ds = new DataSet();
            ds = this.blXemThongTinLop.LayThongTinLop();
            DataTable dt = ds.Tables[0];
            this.dgvChinhSuaThongTin.DataSource = dt;
            this.dgvChinhSuaThongTin.Columns[0].HeaderText = "Mã Học Sinh";
            this.dgvChinhSuaThongTin.Columns[1].HeaderText = "Họ Tên";
            this.dgvChinhSuaThongTin.Columns[2].HeaderText = "Ngày Sinh";
            this.dgvChinhSuaThongTin.Columns[3].HeaderText = "Giới Tính";
            this.dgvChinhSuaThongTin.Columns[4].HeaderText = "Số Điện Thoại";
            this.dgvChinhSuaThongTin.Columns[5].HeaderText = "Tên Lớp";
            this.dgvChinhSuaThongTin.Columns[6].HeaderText = "Năm Học";
            this.dgvChinhSuaThongTin.Columns[7].HeaderText = "Địa Chỉ";
            this.dgvChinhSuaThongTin_CellClick(null, null);
        }

        private void dgvChinhSuaThongTin_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvChinhSuaThongTin.CurrentCell != null)
            {
                // Thứ tự dòng hiện hành
                int r = dgvChinhSuaThongTin.CurrentCell.RowIndex;
                if (!dgvChinhSuaThongTin.Rows[r].Cells.Cast<DataGridViewCell>().Any(c => c.Value == null))
                {
                    // Chuyển thông tin lên panel
                    this.txtMaHS.Text =
                    dgvChinhSuaThongTin.Rows[r].Cells[0].Value.ToString();
                    this.txtHoTen.Text =
                    dgvChinhSuaThongTin.Rows[r].Cells[1].Value.ToString();

                    DateTime date_NgSinh = new DateTime();
                    Object date_NgSinh_obj = dgvChinhSuaThongTin.Rows[r].Cells[2].Value;
                    if (!Convert.IsDBNull(date_NgSinh_obj))
                        date_NgSinh = DateTime.Parse(date_NgSinh_obj.ToString());
                    else
                        date_NgSinh = DateTime.Now;
                    this.dtNgaySinh.Value = date_NgSinh;

                    Object nu_obj = dgvChinhSuaThongTin.Rows[r].Cells[3].Value;
                    string nu_str = nu_obj.ToString();
                    if (nu_str == "Nữ")
                        this.rdNu.Checked = true;
                    else
                        this.rdNam.Checked = true;

                    this.txtSDT.Text =
                    dgvChinhSuaThongTin.Rows[r].Cells[4].Value.ToString();
                    this.txtLop.Text =
                    dgvChinhSuaThongTin.Rows[r].Cells[5].Value.ToString();
                    this.txtNamHoc.Text =
                    dgvChinhSuaThongTin.Rows[r].Cells[6].Value.ToString();
                    this.txtDiaChi.Text =
                    dgvChinhSuaThongTin.Rows[r].Cells[7].Value.ToString();
                }
            }
        }

        public void ResetAllText()
        {
            this.txtMaHS.ResetText();
            this.txtHoTen.ResetText();
            this.dtNgaySinh.ResetText();
            this.rdNam.Checked = false;
            this.rdNu.Checked = false;
            this.txtSDT.ResetText();
            this.txtLop.ResetText();
            this.txtNamHoc.ResetText();
            this.txtDiaChi.ResetText();
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            string gioiTinh = "Nam";
            if (rdNu.Checked)
                gioiTinh = "Nữ";
            string err = "";
            if (blXemThongTinLop.CapNhatHocSinh(txtMaHS.Text, txtHoTen.Text, dtNgaySinh.Value,
                gioiTinh, txtSDT.Text, txtDiaChi.Text, ref err))
            {
                // Load lại dữ liệu trên DataGridView
                this.txtMaHS.Enabled = true;
                // Thông báo
                MessageBox.Show("Đã sửa xong!");
            }
            else
                MessageBox.Show(err);
            LoadData();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.txtMaHS.Enabled = true;
            this.ResetAllText();
            this.btnCapNhat.Enabled = true;
            this.btnLuu.Enabled = false;
            this.btnHuy.Enabled = false;
            this.panelChinhSua.Enabled = false;
            dgvChinhSuaThongTin_CellClick(null, null);
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            this.btnLuu.Enabled = false;
            this.btnHuy.Enabled = false;
            this.panelChinhSua.Enabled = false;
            this.btnCapNhat.Enabled = true;
            this.ResetAllText();
            DataSet ds = new DataSet();
            ds = this.blXemThongTinLop.TimHocSinhTrongLop(txtTimKiem.Text);
            DataTable dt = ds.Tables[0];
            this.dgvChinhSuaThongTin.DataSource = dt;
            this.dgvChinhSuaThongTin.Columns[0].HeaderText = "Mã Học Sinh";
            this.dgvChinhSuaThongTin.Columns[1].HeaderText = "Họ Tên";
            this.dgvChinhSuaThongTin.Columns[2].HeaderText = "Ngày Sinh";
            this.dgvChinhSuaThongTin.Columns[3].HeaderText = "Giới Tính";
            this.dgvChinhSuaThongTin.Columns[4].HeaderText = "Số Điện Thoại";
            this.dgvChinhSuaThongTin.Columns[5].HeaderText = "Tên Lớp";
            this.dgvChinhSuaThongTin.Columns[6].HeaderText = "Năm Học";
            this.dgvChinhSuaThongTin.Columns[7].HeaderText = "Địa Chỉ";
            this.dgvChinhSuaThongTin_CellClick(null, null);
        }
    }
}
