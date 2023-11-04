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

namespace DoAnHQTCSDL.UserControls.Admin
{
    public partial class ChinhSuaThongTinHS : UserControl
    {
        BLChinhSuaThongTinHS blCSTS = null;
        public ChinhSuaThongTinHS(string username, DBMain db)
        {
            InitializeComponent();
            blCSTS = new BLChinhSuaThongTinHS(username, db);
        }

        public void LoadData()
        {
            this.btnLuu.Enabled = false;
            this.btnHuy.Enabled = false;
            this.panelThongTin.Enabled = false;
            this.btnCapNhat.Enabled = true;
            DataTable dtTTHS = new DataTable();
            dtTTHS.Clear();
            DataSet ds = blCSTS.LayThongTinHocSinh();
            dtTTHS = ds.Tables[0];
            this.dgvChinhSuaThongTinHS.DataSource = dtTTHS;
            this.dgvChinhSuaThongTinHS.Columns[0].HeaderText = "Mã Học Sinh";
            this.dgvChinhSuaThongTinHS.Columns[1].HeaderText = "Họ Tên";
            this.dgvChinhSuaThongTinHS.Columns[2].HeaderText = "Ngày Sinh";
            this.dgvChinhSuaThongTinHS.Columns[3].HeaderText = "Giới Tính";
            this.dgvChinhSuaThongTinHS.Columns[4].HeaderText = "Số Điện Thoại";
            this.dgvChinhSuaThongTinHS.Columns[5].HeaderText = "Lớp";
            this.dgvChinhSuaThongTinHS.Columns[6].HeaderText = "Năm Học";
            this.dgvChinhSuaThongTinHS.Columns[7].HeaderText = "Địa Chỉ";
        }

        public void ResetAllText()
        {
            this.txtMaHS.ResetText();
            this.txtHoTen.ResetText();
            this.dtNgaySinh.ResetText();
            this.rbNam.Checked = false;
            this.rbNu.Checked = false;
            this.txtSoDT.ResetText();
            this.txtLop.ResetText();
            this.txtNamHoc.ResetText();
            this.txtDiaChi.ResetText();
        }

        public void btnCapNhat_Click(object sender, EventArgs e)
        {

            // Cho phép thao tác trên Panel
            this.panelThongTin.Enabled = true;
            this.btnCapNhat.Enabled = false;
            this.panelThongTin.Enabled = true;
            // Không cho thao tác trên các nút Thêm / Xóa / Thoát
            this.btnLuu.Enabled = true;
            this.btnHuy.Enabled = true;
            // Đưa con trỏ đến TextField txtMaLop
            this.txtMaHS.Enabled = false;
            this.txtHoTen.Focus();
        }
        private void dgvChinhSuaThongTinHS_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvChinhSuaThongTinHS.CurrentCell != null)
            {
                // Thứ tự dòng hiện hành
                int r = dgvChinhSuaThongTinHS.CurrentCell.RowIndex;
                if (!dgvChinhSuaThongTinHS.Rows[r].Cells.Cast<DataGridViewCell>().Any(c => c.Value == null))
                {
                    // Chuyển thông tin lên panel
                    this.txtMaHS.Text =
                    dgvChinhSuaThongTinHS.Rows[r].Cells[0].Value.ToString();
                    this.txtHoTen.Text =
                    dgvChinhSuaThongTinHS.Rows[r].Cells[1].Value.ToString();

                    DateTime date_NgSinh = new DateTime();
                    Object date_NgSinh_obj = dgvChinhSuaThongTinHS.Rows[r].Cells[2].Value;
                    if (!Convert.IsDBNull(date_NgSinh_obj))
                        date_NgSinh = DateTime.Parse(date_NgSinh_obj.ToString());
                    else
                        date_NgSinh = DateTime.Now;
                    this.dtNgaySinh.Value = date_NgSinh;

                    Object nu_obj = dgvChinhSuaThongTinHS.Rows[r].Cells[3].Value;
                    string nu_str = nu_obj.ToString();
                    if (nu_str == "Nữ")
                        this.rbNu.Checked = true;
                    else
                        this.rbNam.Checked = true;

                    this.txtSoDT.Text =
                    dgvChinhSuaThongTinHS.Rows[r].Cells[4].Value.ToString();
                    this.txtLop.Text =
                    dgvChinhSuaThongTinHS.Rows[r].Cells[5].Value.ToString();
                    this.txtNamHoc.Text =
                    dgvChinhSuaThongTinHS.Rows[r].Cells[6].Value.ToString();
                    this.txtDiaChi.Text =
                    dgvChinhSuaThongTinHS.Rows[r].Cells[7].Value.ToString();

                }
            }
        }

        private void ChinhSuaThongTinHS_Load(object sender, EventArgs e)
        {
            this.LoadData();
        }

        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnLuu_Click(object sender, EventArgs e)
        {

        }

        private void btnHuy_Click(object sender, EventArgs e)
        {

        }
    }
}
