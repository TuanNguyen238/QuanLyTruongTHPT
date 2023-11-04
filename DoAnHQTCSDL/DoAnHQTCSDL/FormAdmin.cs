using DoAnHQTCSDL.UserControls;
using DoAnHQTCSDL.UserControls.Admin;
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
    public partial class FormAdmin : Form
    {
        ChinhSuaThongTinHS chinhSuaThongTinHS = new ChinhSuaThongTinHS();
        DuyetHoSo duyetHoSo = new DuyetHoSo();
        NoiQuy noiQuy = new NoiQuy();
        XemDiemHS xemDiemHS = new XemDiemHS();
        XemLichDayGV xemLichDayGV = new XemLichDayGV();
        XemTKBLop xemTKBLop = new XemTKBLop();
        XemThiDuaLop xemThiDuaLop = new XemThiDuaLop();
        
        public FormAdmin()
        {
            InitializeComponent();
        }

        private void btnDangXuat_Click(object sender, EventArgs e)
        {
            if (System.Windows.Forms.MessageBox.Show("Bạn có muốn thoát không?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                this.Hide();
                FormDangNhap formDangNhap = new FormDangNhap();
                formDangNhap.ShowDialog();
            }

            else
            {
                FormAdmin formAdmin = new FormAdmin();
                formAdmin.ShowDialog();
            }
        }

        private void btnChinhSuaTT_Click(object sender, EventArgs e)
        {
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
            this.panelAdmin.Controls.Clear();
            this.panelAdmin.Controls.Add(xemTKBLop);
        }

        private void btnXemLichDay_Click(object sender, EventArgs e)
        {
            this.panelAdmin.Controls.Clear();
            this.panelAdmin.Controls.Add(xemLichDayGV);
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
    }
}
