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
    public partial class DuyetHoSo : UserControl
    {
        BLDuyetHoSo blDuyet = null;
        string maHoSo = "", err = "";
        public DuyetHoSo(DBMain db)
        {
            InitializeComponent();
            blDuyet = new BLDuyetHoSo(db);
            this.cbLop.DataSource = blDuyet.XemDanhSachLopNhapHoc().Tables[0];
            this.cbLop.DisplayMember = "TenLop";
            this.cbLop.ValueMember = "TenLop";
        }

        private void DuyetHoSo_Load(object sender, EventArgs e)
        {
            this.cbLop.SelectedIndex = 0;
            this.dgvDuyetHoSo.ReadOnly = true;
            this.LoadData();
        }

        private void LoadData()
        {
            DataSet ds = new DataSet();
            ds = this.blDuyet.XemDanhSachTuyenSinh();
            DataTable dt = ds.Tables[0];
            this.dgvDuyetHoSo.DataSource = dt;
            this.dgvDuyetHoSo.Columns[0].HeaderText = "Mã hồ sơ";
            this.dgvDuyetHoSo.Columns[1].HeaderText = "Họ tên";
            this.dgvDuyetHoSo.Columns[2].HeaderText = "Trường học cũ";
            this.dgvDuyetHoSo.Columns[3].HeaderText = "Điểm tuyển sinh";
            this.dgvDuyetHoSo_CellClick(null, null);
        }

        private void dgvDuyetHoSo_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvDuyetHoSo.CurrentCell != null)
            {
                // Thứ tự dòng hiện hành
                int r = dgvDuyetHoSo.CurrentCell.RowIndex;
                if (!dgvDuyetHoSo.Rows[r].Cells.Cast<DataGridViewCell>().Any(c => c.Value == null))
                {
                    this.maHoSo = dgvDuyetHoSo.Rows[r].Cells[0].Value.ToString();
                }
            }
        }

        private void btnThemVaoLop_Click(object sender, EventArgs e)
        {
            string tenLop = cbLop.SelectedValue.ToString();
            if (!string.IsNullOrEmpty(tenLop))
            {
                DialogResult rs = MessageBox.Show("Xác nhận đưa học sinh vô lớp: " + tenLop + "!!", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (rs == DialogResult.Yes)
                {
                    if (this.blDuyet.ThemHocSinh(this.maHoSo, tenLop, 2023, ref err))
                    {
                        MessageBox.Show("Đã đưa học sinh vào lớp thành công!");
                        this.LoadData();
                    }
                    else
                        MessageBox.Show(err);
                    this.LoadData();
                }
            }
        }
    }
}
