using DoAnHQTCSDL.DB;
using DoAnHQTCSDL.UserControls.GiaoVien;
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
        XemDiemLopHK1 xemDiemLopHK1 = null;
        XemDiemLopHK2 xemDiemLopHK2 = null;
        XemDiemLopCaNam xemDiemLopCaNam = null;
        int namHoc = 0;
        public XemDiemHocSinh(string maGV, string tenLop, DBMain db)
        {
            InitializeComponent();
            xemDiemLopHK1 = new XemDiemLopHK1(tenLop, db);
            xemDiemLopHK2 = new XemDiemLopHK2(tenLop, db);
            xemDiemLopCaNam = new XemDiemLopCaNam(tenLop, db);
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

        private void XemDiemHocSinh_Load(object sender, EventArgs e)
        {
            this.cbNam.SelectedIndex = 0;
            this.txtLop.ReadOnly = true;
            this.btnLuu.Enabled = false;
            this.btnHuy.Enabled = false;
            this.btnCapNhat.Enabled = true;
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
                xemDiemLopHK1.SetNamHoc(namHoc);
                panelDiem.Controls.Add(xemDiemLopHK1);
                xemDiemLopHK1.Visible = true;
            }

            else if (rdHK2.Checked)
            {
                xemDiemLopHK2.SetNamHoc(namHoc);
                panelDiem.Controls.Add(xemDiemLopHK2);
                xemDiemLopHK2.Visible = true;
            }
            else if (rdCaNam.Checked)
            {
                xemDiemLopCaNam.SetNamHoc(namHoc);
                panelDiem.Controls.Add(xemDiemLopCaNam);
                xemDiemLopCaNam.Visible = true;
            }
        }
    }
}
