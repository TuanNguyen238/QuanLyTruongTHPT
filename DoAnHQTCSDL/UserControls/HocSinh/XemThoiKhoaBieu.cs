using DoAnHQTCSDL.DB;
using DoAnHQTCSDL.BS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DoAnHQTCSDL.BS.HocSinh;

namespace DoAnHQTCSDL.UserControls.HocSinh
{
    public partial class XemThoiKhoaBieu : UserControl
    {
        BLXemTKB blXemTKB = null;
        public XemThoiKhoaBieu(string tenLop, DBMain db)
        {
            InitializeComponent();
            this.blXemTKB = new BLXemTKB(tenLop, db);
            this.cbKy.Items.Add("1");
            this.cbKy.Items.Add("2");
            this.cbKy.DropDownStyle = ComboBoxStyle.DropDownList;
            this.txtLop.Text = tenLop;
        }

        private void XemThoiKhoaBieu_Load(object sender, EventArgs e)
        {
            this.cbKy.SelectedIndex = 0;
            this.txtLop.ReadOnly = true;
            this.dgvXemTKB.ReadOnly = true;
            this.LoadData();
        }

        private void LoadData()
        {
            DataSet ds = new DataSet();
            ds = this.blXemTKB.LayTKB(int.Parse(this.cbKy.SelectedItem.ToString()));
            DataTable dt = ds.Tables[0];
            this.dgvXemTKB.DataSource = dt;
            this.dgvXemTKB.Columns[0].HeaderText = "Tiết";
            this.dgvXemTKB.Columns[1].HeaderText = "Thứ 2";
            this.dgvXemTKB.Columns[2].HeaderText = "Thứ 3";
            this.dgvXemTKB.Columns[3].HeaderText = "Thứ 4";
            this.dgvXemTKB.Columns[4].HeaderText = "Thứ 5";
            this.dgvXemTKB.Columns[5].HeaderText = "Thứ 6";
            this.dgvXemTKB.Columns[6].HeaderText = "Thứ 7";
        }

        private void cbKy_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.LoadData();
        }

        private void dgvXemTKB_ColumnAdded(object sender, DataGridViewColumnEventArgs e)
        {
            e.Column.SortMode = DataGridViewColumnSortMode.NotSortable;
        }
    }
}
