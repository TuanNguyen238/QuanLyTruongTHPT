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
    public partial class XemPhanHoi : UserControl
    {
        BLXemPhanHoi blXemPhanHoi = null;
        string maHS = "";
        public XemPhanHoi(string maGV, DBMain db)
        {
            InitializeComponent();
            this.blXemPhanHoi = new BLXemPhanHoi(maGV, db);
        }

        private void XemPhanHoi_Load(object sender, EventArgs e)
        {
            this.dgvPhanHoi.ReadOnly = true;
            this.LoadData();
        }

        public void LoadData()
        {
            DataSet ds = new DataSet();
            ds = blXemPhanHoi.XemPhanHoi();
            DataTable dt = new DataTable();
            dt = ds.Tables[0];
            dgvPhanHoi.DataSource = dt;
            dgvPhanHoi.Columns[0].HeaderText = "Mã học sinh";
            dgvPhanHoi.Columns[1].HeaderText = "Họ tên";
            dgvPhanHoi.Columns[2].HeaderText = "Lớp";
            dgvPhanHoi.Columns[3].HeaderText = "Nội dung phản hồi";
        }

        private void dgvPhanHoi_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvPhanHoi.CurrentCell != null)
            {
                // Thứ tự dòng hiện hành
                int r = dgvPhanHoi.CurrentCell.RowIndex;
                if (!dgvPhanHoi.Rows[r].Cells.Cast<DataGridViewCell>().Any(c => c.Value == null))
                {
                    this.maHS = dgvPhanHoi.Rows[r].Cells[0].Value.ToString();
                }
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            string err = "";
            if (this.blXemPhanHoi.XoaPhanHoi(maHS, ref err))
                MessageBox.Show("Xóa thành công");
            else
                MessageBox.Show(err);
            this.LoadData();
        }
    }
}
