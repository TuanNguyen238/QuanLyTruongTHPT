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
        public PhanHoi(string maHS, DBMain db)
        {
            InitializeComponent();
            blPhanHoi = new BLPhanHoi(maHS, db);
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            cbMGV.ResetText();
            txtPhanHoi.ResetText();
        }

        private void btnGui_Click(object sender, EventArgs e)
        {
            string err = "";
            if (blPhanHoi.GuiPhanHoi(cbMGV.SelectedValue.ToString(), txtPhanHoi.Text, ref err))
            {
                txtPhanHoi.ResetText();
                MessageBox.Show("Gửi phản hồi thành công!");
            }
            else
                MessageBox.Show(err);
        }

        private void PhanHoi_Load(object sender, EventArgs e)
        {
            DataSet ds = blPhanHoi.LayMaGiaoVien();
            DataTable dt = ds.Tables[0];
            cbMGV.DataSource = dt;
            cbMGV.DisplayMember = "HoTen";
            cbMGV.ValueMember = "MaNguoiDung";
            cbMGV.DropDownStyle = ComboBoxStyle.DropDownList;
        }
    }
}
