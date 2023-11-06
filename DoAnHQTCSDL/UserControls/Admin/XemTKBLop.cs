using DoAnHQTCSDL.BS.Admin;
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

namespace DoAnHQTCSDL.UserControls.Admin
{
    public partial class XemTKBLop : UserControl
    {
        BLXemTKBTruong blXemTKBTruong = null;
        public XemTKBLop(DBMain db)
        {
            InitializeComponent();
            blXemTKBTruong = new BLXemTKBTruong(db);
            cbKy.Items.Clear();
            cbKy.Items.Add("1");
            cbKy.Items.Add("2");
            cbKy.SelectedIndex = 0;
            cbKy.DropDownStyle = ComboBoxStyle.DropDownList;
            cbLop.DataSource = blXemTKBTruong.TraDanhSachLop().Tables[0];
            cbLop.DisplayMember = "TenLop";
            cbLop.ValueMember = "TenLop";
            cbLop.SelectedIndex = 0;
            cbLop.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private void XemTKBLop_Load(object sender, EventArgs e)
        {
            dgvTKB.ReadOnly = true;
            this.LoadData();
        }

        public void LoadData()
        {
            DataSet ds = new DataSet();
            ds = this.blXemTKBTruong.LayTKBLop(cbLop.SelectedValue.ToString(), int.Parse(cbKy.SelectedItem.ToString()));
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

        private void cbLop_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.LoadData();
        }

        private void cbKy_SelectedIndexChanged(object sender, EventArgs e)
        {
            //this.LoadData();
        }
    }
}
