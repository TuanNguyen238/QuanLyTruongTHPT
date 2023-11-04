using DoAnHQTCSDL.DB;
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
    public partial class XemDiem : UserControl
    {
        XemDiemHK1 xemDiemHK1 = null;
        XemDiemHK2 xemDiemHK2 = null;
        XemDiemCaNam xemDiemCaNam = null;
        int namHoc = 0;
        public XemDiem(string maHS, string tenLop, DBMain db)
        {
            InitializeComponent();
            xemDiemHK1 = new XemDiemHK1(maHS, db);
            xemDiemHK2 = new XemDiemHK2(maHS, db);
            xemDiemCaNam = new XemDiemCaNam(maHS, db);
            this.cbNam.Items.Add("2023");
            this.txtLop.Text = tenLop;
        }

        private void rdHK1_CheckedChanged(object sender, EventArgs e)
        {
            this.PanelXemDiem();
        }


        private void rdHK2_CheckedChanged(object sender, EventArgs e)
        {
            this.PanelXemDiem();
        }
        private void rdCaNam_CheckedChanged(object sender, EventArgs e)
        {
            this.PanelXemDiem();
        }

        private void XemDiem_Load(object sender, EventArgs e)
        {
            this.cbNam.SelectedIndex = 0;
            this.txtLop.ReadOnly = true;
            this.cbNam.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private void cbNam_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.namHoc = int.Parse(this.cbNam.SelectedItem.ToString());
            this.PanelXemDiem();
        }

        private void PanelXemDiem()
        {
            panelDiem.Controls.Clear();
            if (rdHK1.Checked)
            {
                xemDiemHK1.SetNamHoc(namHoc);
                panelDiem.Controls.Add(xemDiemHK1);
                xemDiemHK1.Visible = true;
            }
            
            else if (rdHK2.Checked)
            {
                xemDiemHK2.SetNamHoc(namHoc);
                panelDiem.Controls.Add(xemDiemHK2);
                xemDiemHK2.Visible = true;
            }
            else if (rdCaNam.Checked)
            {
                xemDiemCaNam.SetNamHoc(namHoc);
                panelDiem.Controls.Add(xemDiemCaNam);
                xemDiemCaNam.Visible = true;
            }
        }
    }
}
