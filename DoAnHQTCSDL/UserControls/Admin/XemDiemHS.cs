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
    public partial class XemDiemHS : UserControl
    {
        public XemDiemHS()
        {
            InitializeComponent();
        }


        private void rdCaNam_CheckedChanged(object sender, EventArgs e)
        {
            XemDiemHSCaNam xemDiemHSCaNam = new XemDiemHSCaNam();
            panelDiem.Controls.Add(xemDiemHSCaNam);
            xemDiemHSCaNam.BringToFront();
            if (rdCaNam.Checked)
            {
                xemDiemHSCaNam.Visible = true;
            }
            else
            {
                xemDiemHSCaNam.Visible = false;
            }
        }

        private void rdHK2_CheckedChanged(object sender, EventArgs e)
        {
            XemDiemHSHK2 xemDiemHSHK2 = new XemDiemHSHK2();
            panelDiem.Controls.Add(xemDiemHSHK2);
            xemDiemHSHK2.BringToFront();
            if (rdHK2.Checked)
            {
                xemDiemHSHK2.Visible = true;
            }
            else
            {
                xemDiemHSHK2.Visible = false;
            }
        }

        private void rdHK1_CheckedChanged(object sender, EventArgs e)
        {
            XemDiemHSHK1 xemDiemHSHK1 = new XemDiemHSHK1();
            panelDiem.Controls.Add(xemDiemHSHK1);
            xemDiemHSHK1.BringToFront();
            if (rdHK1.Checked)
            {
                xemDiemHSHK1.Visible = true;
            }
            else
            {
                xemDiemHSHK1.Visible = false;
            }
        }
    }
}
