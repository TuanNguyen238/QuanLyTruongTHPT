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
        public XemPhanHoi(string maGV, DBMain db)
        {
            InitializeComponent();
            this.blXemPhanHoi = new BLXemPhanHoi(maGV, db);
        }

        private void XemPhanHoi_Load(object sender, EventArgs e)
        {
            this.dgvPhanHoi.ReadOnly = true;
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
    }
}
