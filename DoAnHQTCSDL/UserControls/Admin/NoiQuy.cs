using DoAnHQTCSDL.BS.Admin;
using DoAnHQTCSDL.BS.GiaoVien;
using DoAnHQTCSDL.DB;
using Siticone.Desktop.UI.WinForms;
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
    public partial class NoiQuy : UserControl
    {
        BLXemNoiQuy blXemNoiQuy = null;
        bool Them;
        string err = "";
        string nguoiDeXuat = "";
        public NoiQuy(string maNQL, DBMain db)
        {
            InitializeComponent();
            blXemNoiQuy = new BLXemNoiQuy(maNQL, db);
        }

        private void NoiQuy_Load(object sender, EventArgs e)
        {
            dgvNoiQuy.ReadOnly = true;
            this.LoadData();
        }

        private void ResetAllText()
        {
            this.txtDieuLe.ResetText();
            this.txtSoDiemTru.ResetText();
            this.dtNgayBanHanh.ResetText();
        }

        private void LoadData()
        {
            this.panelNQ.Enabled = false;
            this.ResetAllText();
            DataSet ds = new DataSet();
            ds = blXemNoiQuy.XemNoiQuy();
            DataTable dt = ds.Tables[0];
            dgvNoiQuy.DataSource = dt;
            dgvNoiQuy.Columns[0].HeaderText = "Người đề xuất";
            dgvNoiQuy.Columns[1].HeaderText = "Họ tên";
            dgvNoiQuy.Columns[2].HeaderText = "Điều lệ";
            dgvNoiQuy.Columns[3].HeaderText = "Số điểm trừ";
            dgvNoiQuy.Columns[4].HeaderText = "Ngày ban hành";
            this.btnLuu.Enabled = false;
            this.btnHuy.Enabled = false;
            this.btnThem.Enabled = true;
            this.btnSua.Enabled = true;
            this.btnXoa.Enabled = true;
            dgvNoiQuy_CellClick(null, null);
        }

        private void dgvNoiQuy_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvNoiQuy.CurrentCell != null)
            {
                // Thứ tự dòng hiện hành
                int r = dgvNoiQuy.CurrentCell.RowIndex;
                if (!dgvNoiQuy.Rows[r].Cells.Cast<DataGridViewCell>().Any(c => c.Value == null))
                {
                    this.nguoiDeXuat =
                    dgvNoiQuy.Rows[r].Cells[0].Value.ToString();
                    this.txtDieuLe.Text =
                    dgvNoiQuy.Rows[r].Cells[2].Value.ToString();
                    this.txtMaNQ.Text = blXemNoiQuy.LayNoiQuyTuDieuLe(this.txtDieuLe.Text);
                    this.txtSoDiemTru.Text =
                    dgvNoiQuy.Rows[r].Cells[3].Value.ToString();

                    DateTime date_NgBH = new DateTime();
                    Object date_NgBH_obj = dgvNoiQuy.Rows[r].Cells[4].Value;
                    if (!Convert.IsDBNull(date_NgBH_obj))
                        date_NgBH = DateTime.Parse(date_NgBH_obj.ToString());
                    else
                        date_NgBH = DateTime.Now;
                    this.dtNgayBanHanh.Value = date_NgBH;
                }
            }
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = blXemNoiQuy.TimNoiQuy(txtTimKiem.Text);
            DataTable dt = ds.Tables[0];
            dgvNoiQuy.DataSource = dt;
            dgvNoiQuy.Columns[0].HeaderText = "Người đề xuất";
            dgvNoiQuy.Columns[1].HeaderText = "Họ tên";
            dgvNoiQuy.Columns[2].HeaderText = "Điều lệ";
            dgvNoiQuy.Columns[3].HeaderText = "Số điểm trừ";
            dgvNoiQuy.Columns[4].HeaderText = "Ngày ban hành";
            dgvNoiQuy_CellClick(null, null);
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            Them = true;
            this.ResetAllText();
            this.btnLuu.Enabled = true;
            this.btnHuy.Enabled = true;
            this.panelNQ.Enabled = true;
            this.btnThem.Enabled = false;
            this.btnSua.Enabled = false;
            this.btnXoa.Enabled = false;
            this.txtDieuLe.Focus();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            Them = false;
            // Cho phép thao tác trên Panel
            this.panelNQ.Enabled = true;
            dgvNoiQuy_CellClick(null, null);
            // Cho thao tác trên các nút Lưu / Hủy / Panel
            this.btnLuu.Enabled = true;
            this.btnHuy.Enabled = true;
            // Không cho thao tác trên các nút Thêm / Xóa / Thoát
            this.btnThem.Enabled = false;
            this.btnSua.Enabled = false;
            this.btnXoa.Enabled = false;
            this.txtDieuLe.Focus();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.Them = false;
            // Xóa trống các đối tượng trong Panel
            this.ResetAllText();
            // Cho thao tác trên các nút Thêm / Sửa / Xóa / Thoát
            this.btnThem.Enabled = true;
            this.btnSua.Enabled = true;
            this.btnXoa.Enabled = true;
            // Không cho thao tác trên các nút Lưu / Hủy / Panel
            this.btnLuu.Enabled = false;
            this.btnHuy.Enabled = false;
            this.panelNQ.Enabled = false;
            dgvNoiQuy_CellClick(null, null);
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            if(Them)
            {
                if (this.blXemNoiQuy.ThemNoiQuy(txtMaNQ.Text, txtDieuLe.Text, txtSoDiemTru.Text, DateTime.Now, ref err))
                {
                    MessageBox.Show("Thêm thành công");
                    this.LoadData();
                }
                else
                    MessageBox.Show(err);
                this.Them = false;
            }
            else
            {
                if (this.blXemNoiQuy.CapNhatNoiQuyLanDau(nguoiDeXuat, txtMaNQ.Text, txtDieuLe.Text, txtSoDiemTru.Text, DateTime.Now, ref err))
                {
                    MessageBox.Show("Sửa thành công");
                    this.LoadData();
                }
                else
                {
                    if (err == "Lỗi: Nội Quy này là do Admin khác ban hành, bạn có chắc muốn sửa?")
                    {
                        DialogResult rs = MessageBox.Show(err, "Thông báo",MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                        if (rs == DialogResult.Yes)
                        {
                            if (this.blXemNoiQuy.CapNhatNoiQuy(txtMaNQ.Text, txtDieuLe.Text, txtSoDiemTru.Text, DateTime.Now, ref err))
                            {
                                MessageBox.Show("Sửa thành công");
                                this.LoadData();
                            }
                            else
                                MessageBox.Show(err);
                        }
                    }
                    else
                        MessageBox.Show(err);
                }
            }    
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (blXemNoiQuy.XoaNoiQuy(this.txtMaNQ.Text, ref err))
            {
                MessageBox.Show("Xóa thành công");
                this.LoadData();
            }
            else
                MessageBox.Show(err);
        }
    }
}
