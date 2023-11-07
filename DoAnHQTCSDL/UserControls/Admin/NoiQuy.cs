using DoAnHQTCSDL.BS.Admin;
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

namespace DoAnHQTCSDL.UserControls.Admin
{
    public partial class NoiQuy : UserControl
    {
        BLXemNoiQuy blXemNoiQuy = null;
        DBMain db = null;
<<<<<<< HEAD
        public NoiQuy(string maNQL, DBMain db)
        {
            InitializeComponent();
            blXemNoiQuy = new BLXemNoiQuy(maNQL, db);
=======
        public NoiQuy(DBMain db)
        {
            InitializeComponent();
            blXemNoiQuy = new BLXemNoiQuy(db);
>>>>>>> 233702d88936b669d8075c61ef05eac83fff3fc2
            this.db = db;
        }

        private void NoiQuy_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = blXemNoiQuy.XemNoiQuy();
            DataTable dt = ds.Tables[0];
            dgvNoiQuy.DataSource = dt;
            dgvNoiQuy.Columns[0].HeaderText = "Người đề xuất";
            dgvNoiQuy.Columns[1].HeaderText = "Điều lệ";
            dgvNoiQuy.Columns[2].HeaderText = "Số điểm trừ";
            dgvNoiQuy.Columns[3].HeaderText = "Ngày ban hành";
            dgvNoiQuy.ReadOnly = true;
<<<<<<< HEAD
            dgvNoiQuy_CellClick(null, null);
=======
>>>>>>> 233702d88936b669d8075c61ef05eac83fff3fc2
        }

        private void dgvNoiQuy_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvNoiQuy.CurrentCell != null)
            {
                // Thứ tự dòng hiện hành
                int r = dgvNoiQuy.CurrentCell.RowIndex;
                if (!dgvNoiQuy.Rows[r].Cells.Cast<DataGridViewCell>().Any(c => c.Value == null))
                {
                    // Chuyển thông tin lên panel
                    this.txtDieuLe.Text =
<<<<<<< HEAD
                    dgvNoiQuy.Rows[r].Cells[1].Value.ToString();
                    this.txtSoDiemTru.Text =
                    dgvNoiQuy.Rows[r].Cells[2].Value.ToString();

                    DateTime date_NgBH = new DateTime();
                    Object date_NgBH_obj = dgvNoiQuy.Rows[r].Cells[3].Value.ToString();
=======
                    dgvNoiQuy.Rows[r].Cells[0].Value.ToString();
                    this.txtSoDiemTru.Text =
                    dgvNoiQuy.Rows[r].Cells[1].Value.ToString();

                    DateTime date_NgBH = new DateTime();
                    Object date_NgBH_obj = dgvNoiQuy.Rows[r].Cells[2].Value;
>>>>>>> 233702d88936b669d8075c61ef05eac83fff3fc2
                    if (!Convert.IsDBNull(date_NgBH_obj))
                        date_NgBH = DateTime.Parse(date_NgBH_obj.ToString());
                    else
                        date_NgBH = DateTime.Now;
                    this.dtNgayBanHanh.Value = date_NgBH;
                }
            }
        }
    }
}
