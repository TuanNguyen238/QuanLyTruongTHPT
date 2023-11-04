using DoAnHQTCSDL.UserControls;
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
    public partial class FormTuyenSinh : Form
    {
        CapNhatThongTin capNhatThongTin = new CapNhatThongTin();
        DangKyTuyenSinh dangKyTuyenSinh = new DangKyTuyenSinh();
        public FormTuyenSinh()
        {
            InitializeComponent();
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            this.panelTuyenSinh.Controls.Clear();
            this.panelTuyenSinh.Controls.Add(capNhatThongTin);
        }

        private void btnDangKy_Click(object sender, EventArgs e)
        {
            this.panelTuyenSinh.Controls.Clear();
            this.panelTuyenSinh.Controls.Add(dangKyTuyenSinh);
        }
    }
}
