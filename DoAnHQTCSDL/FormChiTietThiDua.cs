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

namespace DoAnHQTCSDL
{
    public partial class FormChiTietThiDua : Form
    {
        BLXemThiDua bLXemThiDua = null;
        bool Them = false;
        string err = "";

        public FormChiTietThiDua(string tenLop, DBMain db)
        {
            InitializeComponent();
            this.txtLop.Text = tenLop;
            this.txtLop.ReadOnly = true;
            this.txtSoDiemTru.ReadOnly = true;
            this.numSoLanViPham.Minimum = 1;
            this.numSoLanViPham.Maximum = 20;
            bLXemThiDua = new BLXemThiDua(tenLop, db);
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void FormChiTietThiDua_Load(object sender, EventArgs e)
        {
            this.dgvChiTietNoiQuy.ReadOnly = true;
            this.LoadData();
        }

        private void LoadData()
        {
            this.panelTT.Enabled = false;
            this.btnThem.Enabled = true;
            this.btnSua.Enabled = true;
            this.btnXoa.Enabled = true;
            this.btnLuu.Enabled = false;
            this.btnHuy.Enabled = false;
            DataSet ds = new DataSet();
            ds = bLXemThiDua.ThiDua();
            DataTable dt = new DataTable();
            dt = ds.Tables[0];
            dgvChiTietNoiQuy.DataSource = dt;
            dgvChiTietNoiQuy.Columns[0].HeaderText = "Mã nội quy";
            dgvChiTietNoiQuy.Columns[1].HeaderText = "Điều lệ vi phạm";
            dgvChiTietNoiQuy.Columns[2].HeaderText = "Số lần vi phạm";
            dgvChiTietNoiQuy.Columns[3].HeaderText = "Tổng số điểm trừ";
            ds = bLXemThiDua.LayNoiQuy();
            DataTable dataTable = ds.Tables[0];
            cbDieuLe.DataSource = dataTable;
            cbDieuLe.DisplayMember = "DieuLe";
            cbDieuLe.ValueMember = "DieuLe";
            cbDieuLe.SelectedIndex = 0;
            cbDieuLe_SelectedIndexChanged(cbDieuLe, EventArgs.Empty);
            numSoLanViPham.Enabled = true;
            this.dgvChiTietNoiQuy_CellClick(null, null);
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = bLXemThiDua.TimKiemChiTietThiDua(this.txtTimKiem.Text);
            DataTable dt = new DataTable();
            dt = ds.Tables[0];
            dgvChiTietNoiQuy.DataSource = dt;
            dgvChiTietNoiQuy.Columns[0].HeaderText = "Mã nội quy";
            dgvChiTietNoiQuy.Columns[1].HeaderText = "Điều lệ vi phạm";
            dgvChiTietNoiQuy.Columns[2].HeaderText = "Số lần vi phạm";
            dgvChiTietNoiQuy.Columns[3].HeaderText = "Tổng số điểm trừ";
        }

        private void cbDieuLe_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(cbDieuLe.SelectedValue != null)
                this.txtSoDiemTru.Text = bLXemThiDua.LaySoDiemTru(cbDieuLe.SelectedValue.ToString()).ToString();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            this.Them = true;
            this.panelTT.Enabled = true;
            this.btnSua.Enabled = false;
            this.btnXoa.Enabled = false;
            this.btnLuu.Enabled = true;
            this.btnHuy.Enabled = true;
            this.numSoLanViPham.Value = 1;
            this.numSoLanViPham.Enabled = false;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            this.Them = false;
            this.panelTT.Enabled = true;
            this.btnThem.Enabled = false;
            this.btnXoa.Enabled = false;
            this.btnLuu.Enabled = true;
            this.btnHuy.Enabled = true;
            this.numSoLanViPham.Enabled = true;
            this.cbDieuLe.Enabled = false;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (bLXemThiDua.XoaDanhGia(this.txtLop.Text, cbDieuLe.SelectedValue.ToString(), ref err))
            {
                MessageBox.Show("Xóa thành công");
                this.LoadData();
            }
            else
                MessageBox.Show(err);
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            if(Them)
            {
                if (bLXemThiDua.ThemDanhGia(this.txtLop.Text, cbDieuLe.SelectedValue.ToString(), ref err))
                {
                    MessageBox.Show("Thêm thành công");
                    this.LoadData();
                }
                else
                    MessageBox.Show(err);
            }
            else
            {
                if (bLXemThiDua.SuaDanhGia(this.txtLop.Text, cbDieuLe.SelectedValue.ToString(), (int)numSoLanViPham.Value, ref err))
                {
                    MessageBox.Show("Sửa thành công");
                    this.LoadData();
                }
                else
                    MessageBox.Show(err);
            }
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.cbDieuLe.Enabled = true;
            this.LoadData();
        }

        private void dgvChiTietNoiQuy_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvChiTietNoiQuy.CurrentCell != null)
            {
                // Thứ tự dòng hiện hành
                int r = dgvChiTietNoiQuy.CurrentCell.RowIndex;
                if (!dgvChiTietNoiQuy.Rows[r].Cells.Cast<DataGridViewCell>().Any(c => c.Value == null))
                {
                    // Chuyển thông tin lên panel
                    this.cbDieuLe.SelectedValue =
                    dgvChiTietNoiQuy.Rows[r].Cells[1].Value.ToString();
                    string slvp = dgvChiTietNoiQuy.Rows[r].Cells[2].Value.ToString();
                    if (slvp != null && slvp.Length > 0)
                        this.numSoLanViPham.Value = decimal.Parse(slvp);
                    else
                        this.numSoLanViPham.Value = 1;
                }
            }
        }
    }
}
