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
    public partial class XemPhanCong : UserControl
    {
        BLPhanCong blPhanCong = null;
        public XemPhanCong(DBMain db)
        {
            InitializeComponent();
            blPhanCong = new BLPhanCong(db);
        }

        private void XemPhanCong_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = blPhanCong.XemPhanCong();
            DataTable dt = ds.Tables[0];
            dgvPhanCong.DataSource = dt;
            dgvPhanCong.Columns[0].HeaderText = "Mã giáo viên";
            dgvPhanCong.Columns[1].HeaderText = "Họ tên";
            dgvPhanCong.Columns[2].HeaderText = "Mã môn";
            dgvPhanCong.Columns[3].HeaderText = "Tên môn";
            dgvPhanCong_CellClick(null, null);
            panelDay.Enabled = false;
        }

        private void dgvPhanCong_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int r = dgvPhanCong.CurrentCell.RowIndex;
            if (!dgvPhanCong.Rows[r].Cells.Cast<DataGridViewCell>().Any(c => c.Value == null))
            {
                // Chuyển thông tin lên panel
                this.txtMaGV.Text =
                dgvPhanCong.Rows[r].Cells[0].Value.ToString();
                this.txtHoTen.Text =
                dgvPhanCong.Rows[r].Cells[1].Value.ToString();
                this.txtMon.Text =
                dgvPhanCong.Rows[r].Cells[2].Value.ToString();
                this.txtTenMon.Text =
                dgvPhanCong.Rows[r].Cells[3].Value.ToString();
            }
        }
    }
}
