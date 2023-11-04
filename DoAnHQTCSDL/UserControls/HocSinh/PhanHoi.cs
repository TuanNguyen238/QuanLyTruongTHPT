using DoAnHQTCSDL.BS.HocSinh;
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

namespace DoAnHQTCSDL.UserControls.HocSinh
{
    public partial class PhanHoi : UserControl
    {
        BLPhanHoi blPhanHoi = null;
        List<string> maGV = new List<string>();
        public PhanHoi(string maHS, DBMain db)
        {
            InitializeComponent();
            blPhanHoi = new BLPhanHoi(maHS, db);
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.cbMGV.ResetText();
            this.txtPhanHoi.ResetText();
        }

        private void btnGui_Click(object sender, EventArgs e)
        {

            this.txtPhanHoi.ResetText();
            MessageBox.Show("Gửi phản hồi thành công!");
        }

        private void PhanHoi_Load(object sender, EventArgs e)
        {
            DataSet ds = blPhanHoi.LayMaGiaoVien();
            DataTable dt = ds.Tables[0];
            this.cbMGV.DataSource = dt;
            this.cbMGV.DisplayMember = "HoTen";
            this.cbMGV.ValueMember = "MaNguoiDung";
            this.cbMGV.DropDownStyle = ComboBoxStyle.DropDownList;
        }
    }
}
