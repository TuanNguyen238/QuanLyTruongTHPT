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
    public partial class DuyetHoSo : UserControl
    {
        public DuyetHoSo()
        {
            InitializeComponent();
        }

        private void btnDuyetHoSo_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Duyệt thành công tất cả hồ sơ!!!");
        }
    }
}
