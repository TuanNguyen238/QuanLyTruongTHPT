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
    public partial class XemThiDuaLop : UserControl
    {
        public XemThiDuaLop()
        {
            InitializeComponent();
        }

        private void btnXemChiTiet_Click(object sender, EventArgs e)
        {
            FormChiTietThiDua formChiTietThiDua = new FormChiTietThiDua();
            formChiTietThiDua.ShowDialog();
        }
    }
}
