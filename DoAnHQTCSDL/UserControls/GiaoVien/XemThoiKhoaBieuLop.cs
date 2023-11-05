using DoAnHQTCSDL.BS.GiaoVien;
using DoAnHQTCSDL.DB;
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
    public partial class XemThoiKhoaBieuLop : UserControl
    {
        BLXemTKBLop blXemTKBLop = null;
        public XemThoiKhoaBieuLop(string tenLop, DBMain db)
        {
            InitializeComponent();
            this.blXemTKBLop = new BLXemTKBLop(tenLop, db);
            this.cbKy.Items.Add("1");
            this.cbKy.Items.Add("2");
            this.cbKy.DropDownStyle = ComboBoxStyle.DropDownList;
            this.txtLop.Text = tenLop;
        }

        private void XemThoiKhoaBieuLop_Load(object sender, EventArgs e)
        {
            this.cbKy.SelectedIndex = 0;
            this.txtLop.ReadOnly = true;
            this.dgvTKB.ReadOnly = true;
            this.LoadData();
        }

        private void LoadData()
        {
            DataSet ds = new DataSet();
            ds = this.blXemTKBLop.LayTKB(int.Parse(this.cbKy.SelectedItem.ToString()));
            DataTable dt = ds.Tables[0];
            this.dgvTKB.DataSource = dt;
            this.dgvTKB.Columns[0].HeaderText = "Tiết";
            this.dgvTKB.Columns[1].HeaderText = "Thứ 2";
            this.dgvTKB.Columns[2].HeaderText = "Thứ 3";
            this.dgvTKB.Columns[3].HeaderText = "Thứ 4";
            this.dgvTKB.Columns[4].HeaderText = "Thứ 5";
            this.dgvTKB.Columns[5].HeaderText = "Thứ 6";
            this.dgvTKB.Columns[6].HeaderText = "Thứ 7";
        }

        private void cbKy_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.LoadData();
        }
    }
}
