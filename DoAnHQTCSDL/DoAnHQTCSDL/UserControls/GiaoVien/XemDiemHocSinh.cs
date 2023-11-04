using DoAnHQTCSDL.UserControls.GiaoVien;
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

namespace DoAnHQTCSDL.UserControls
{
    public partial class XemDiemHocSinh : UserControl
    {
        public XemDiemHocSinh()
        {
            InitializeComponent();
        }

        private void rdHK1_CheckedChanged(object sender, EventArgs e)
        {
            GiaoVien.XemDiemHK1 xemDiemHK1 = new GiaoVien.XemDiemHK1();
            panelDiem.Controls.Add(xemDiemHK1);
            xemDiemHK1.BringToFront();
            if (rdHK1.Checked)
            {
                xemDiemHK1.Visible = true;
            }
            else
            {
                xemDiemHK1.Visible = false;
            }
        }

        private void rdHK2_CheckedChanged(object sender, EventArgs e)
        {
            GiaoVien.XemDiemHK2 xemDiemHK2 = new GiaoVien.XemDiemHK2();
            panelDiem.Controls.Add(xemDiemHK2);
            xemDiemHK2.BringToFront();
            if (rdHK2.Checked)
            {
                xemDiemHK2.Visible = true;
            }
            else
            {
                xemDiemHK2.Visible = false;
            }
        }

        private void rdCaNam_CheckedChanged(object sender, EventArgs e)
        {
            GiaoVien.XemDiemCaNam xemDiemCaNam = new GiaoVien.XemDiemCaNam();
            panelDiem.Controls.Add(xemDiemCaNam);
            xemDiemCaNam.BringToFront();
            if (rdCaNam.Checked)
            {
                xemDiemCaNam.Visible = true;
            }
            else
            {
                xemDiemCaNam.Visible = false;
            }
        }

     
    }
}
