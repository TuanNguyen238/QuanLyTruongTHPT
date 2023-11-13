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
    public partial class XemThiDuaLop : UserControl
    {
        BLXemThiDua blXemThiDua = null;
        string tenLop = "";
        DBMain db = null;
        public XemThiDuaLop(DBMain db)
        {
            InitializeComponent();
            blXemThiDua = new BLXemThiDua(db);
            this.db = db;
        }

        private void btnXemChiTiet_Click(object sender, EventArgs e)
        {
            if (tenLop.Length > 0)
            {
                FormChiTietThiDua formChiTietThiDua = new FormChiTietThiDua(tenLop, db);
                formChiTietThiDua.ShowDialog();
            }
        }

        private void XemThiDuaLop_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = blXemThiDua.XemThiDua();
            DataTable dt = ds.Tables[0];
            dgvXemThiDua.DataSource = dt;
            dgvXemThiDua.Columns[0].HeaderText = "Tên lớp";
            dgvXemThiDua.Columns[1].HeaderText = "Điểm tổng kết";
            dgvXemThiDua.Columns[2].HeaderText = "Xếp hạng";
            dgvXemThiDua.ReadOnly = true;
            dgvXemThiDua_CellClick(null, null);
        }

        private void dgvXemThiDua_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int r = dgvXemThiDua.CurrentCell.RowIndex;
            if (!dgvXemThiDua.Rows[r].Cells.Cast<DataGridViewCell>().Any(c => c.Value == null))
            {
                // Chuyển thông tin lên panel
                this.tenLop =
                dgvXemThiDua.Rows[r].Cells[0].Value.ToString();
            }
        }
    }
}
