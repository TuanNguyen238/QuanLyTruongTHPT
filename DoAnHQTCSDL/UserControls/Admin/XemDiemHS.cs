using DoAnHQTCSDL.DB;
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

namespace DoAnHQTCSDL.UserControls.Admin
{
    public partial class XemDiemHS : UserControl
    {
        XemDiemHSHK1 xemDiemHSHK1 = null;
        XemDiemHSHK2 xemDiemHSHK2 = null;
        XemDiemHSCaNam xemDiemHSCaNam = null;
        int namHoc = 0;
        public XemDiemHS(DBMain db)
        {
            InitializeComponent();
            xemDiemHSHK1 = new XemDiemHSHK1(db);
            xemDiemHSHK2 = new XemDiemHSHK2(db);
            xemDiemHSCaNam = new XemDiemHSCaNam(db);
            this.cbNam.Items.Add("2023");
        }


        private void rdCaNam_CheckedChanged(object sender, EventArgs e)
        {
            this.PanelXemDiem();
        }

        private void rdHK2_CheckedChanged(object sender, EventArgs e)
        {
            this.PanelXemDiem();
        }

        private void rdHK1_CheckedChanged(object sender, EventArgs e)
        {
            this.PanelXemDiem();
        }

        private void PanelXemDiem()
        {
            panelDiem.Controls.Clear();
            if (rdHK1.Checked)
            {
                xemDiemHSHK1.SetNamHoc(namHoc);
                panelDiem.Controls.Add(xemDiemHSHK1);
                xemDiemHSHK1.Visible = true;
            }

            else if (rdHK2.Checked)
            {
                xemDiemHSHK2.SetNamHoc(namHoc);
                panelDiem.Controls.Add(xemDiemHSHK2);
                xemDiemHSHK2.Visible = true;
            }
            else if (rdCaNam.Checked)
            {
                xemDiemHSCaNam.SetNamHoc(namHoc);
                panelDiem.Controls.Add(xemDiemHSCaNam);
                xemDiemHSCaNam.Visible = true;
            }
        }

        private void XemDiemHS_Load(object sender, EventArgs e)
        {
            this.cbNam.SelectedIndex = 0;
            this.cbNam.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private void cbNam_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.namHoc = int.Parse(this.cbNam.SelectedItem.ToString());
            this.PanelXemDiem();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            if (rdHK1.Checked)
                xemDiemHSHK1.TimKiem(this.txtTimKiem.Text);
            else if (rdHK2.Checked)
                xemDiemHSHK2.TimKiem(this.txtTimKiem.Text);
            else if (rdCaNam.Checked)
                xemDiemHSCaNam.TimKiem(this.txtTimKiem.Text);
        }
    }
}