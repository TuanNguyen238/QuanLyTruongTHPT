using DoAnHQTCSDL.DB;
using DoAnHQTCSDL.UserControls;
using DoAnHQTCSDL.UserControls.HocSinh;
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
    public partial class FormHocSinh : Form
    {
        panelXemThongTin xemThongTin = null;
        XemDiem xemDiem = null;
        UserControls.HocSinh.XemThoiKhoaBieu xemThoiKhoaBieu = null;
        PhanHoi phanHoi = null;
        string maHS = "", tenLop = "";
        DBMain db = null;
        public FormHocSinh(string username, DBMain db)
        {
            InitializeComponent();
            this.maHS = db.ExecuteQueryString("SELECT dbo.TraMaNguoiDung('" + username + "');", CommandType.Text);
            this.tenLop = db.ExecuteQueryString("SELECT dbo.TraLop('" + this.maHS + "');", CommandType.Text);
            this.db = db;
        }


        private void btnXemThongTin_Click(object sender, EventArgs e)
        {
            xemThongTin = new panelXemThongTin(this.maHS, this.db);
            this.panelHocSinh.Controls.Clear();
            this.panelHocSinh.Controls.Add(xemThongTin);
        }

        private void btnXemDiem_Click(object sender, EventArgs e)
        {
            xemDiem = new XemDiem(this.maHS, this.tenLop, this.db);
            this.panelHocSinh.Controls.Clear(); ;
            this.panelHocSinh.Controls.Add(xemDiem);
        }

        private void btnThoiKhoaBieu_Click(object sender, EventArgs e)
        {
            xemThoiKhoaBieu = new UserControls.HocSinh.XemThoiKhoaBieu(this.tenLop, this.db);
            this.panelHocSinh.Controls.Clear(); ;
            this.panelHocSinh.Controls.Add(xemThoiKhoaBieu);
        }

        private void btnDangXuat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát không?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)

            {
                this.Hide();
                FormDangNhap formDangNhap = new FormDangNhap();
                formDangNhap.ShowDialog();
            }
        }

        private void btnPhanHoi_Click(object sender, EventArgs e)
        {
            phanHoi = new PhanHoi(this.maHS, this.db);
            this.panelHocSinh.Controls.Clear(); ;
            this.panelHocSinh.Controls.Add(phanHoi);
        }

        private void panelHocSinh_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
