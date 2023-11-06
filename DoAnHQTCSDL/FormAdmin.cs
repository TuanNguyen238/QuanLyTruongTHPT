using DoAnHQTCSDL.BS;
using DoAnHQTCSDL.DB;
using DoAnHQTCSDL.UserControls;
using DoAnHQTCSDL.UserControls.Admin;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace DoAnHQTCSDL
{
    public partial class FormAdmin : Form
    {
        ChinhSuaThongTinHS chinhSuaThongTinHS = null;
        DuyetHoSo duyetHoSo = new DuyetHoSo();
        NoiQuy noiQuy = new NoiQuy();
        XemDiemHS xemDiemHS = new XemDiemHS();
        XemPhanCong xemPhanCong = new XemPhanCong();
        XemTKBLop xemTKBLop = null;
        XemThiDuaLop xemThiDuaLop = new XemThiDuaLop();
        BLAdmin bLAdmin = null;
        DBMain db = null;
        public FormAdmin(string username, DBMain db)
        {
            InitializeComponent();
            bLAdmin = new BLAdmin(username, db);
            this.db = db;
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

        private void btnChinhSuaTT_Click(object sender, EventArgs e)
        {
            chinhSuaThongTinHS = new ChinhSuaThongTinHS(db);
            this.panelAdmin.Controls.Clear();
            this.panelAdmin.Controls.Add(chinhSuaThongTinHS);
        }

        private void btnXemDiemHS_Click(object sender, EventArgs e)
        {
            this.panelAdmin.Controls.Clear();
            this.panelAdmin.Controls.Add(xemDiemHS);
        }

        private void btnXemTKB_Click(object sender, EventArgs e)
        {
            xemTKBLop = new XemTKBLop(db);
            this.panelAdmin.Controls.Clear();
            this.panelAdmin.Controls.Add(xemTKBLop);
        }

        private void btnXemThiDua_Click(object sender, EventArgs e)
        {
            this.panelAdmin.Controls.Clear();
            this.panelAdmin.Controls.Add(xemThiDuaLop);
        }

        private void btnNoiQuy_Click(object sender, EventArgs e)
        {
            this.panelAdmin.Controls.Clear();
            this.panelAdmin.Controls.Add(noiQuy);
        }

        private void btnDuyetHoSo_Click(object sender, EventArgs e)
        {
            this.panelAdmin.Controls.Clear();
            this.panelAdmin.Controls.Add(duyetHoSo);
        }

        private void btnXemPhanCong_Click(object sender, EventArgs e)
        {
            this.panelAdmin.Controls.Clear();
            this.panelAdmin.Controls.Add(xemPhanCong);
        }

        private void panelAdmin_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
