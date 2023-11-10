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

namespace DoAnHQTCSDL
{
    public partial class FormChiTietThiDua : Form
    {
        BLXemThiDua bLXemThiDua = null;
        public FormChiTietThiDua(string tenLop, DBMain db)
        {
            InitializeComponent();
            this.txtLop.Text = tenLop;
            this.txtLop.ReadOnly = true;
            bLXemThiDua = new BLXemThiDua(tenLop, db);
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void FormChiTietThiDua_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = bLXemThiDua.ThiDua();
            DataTable dt = new DataTable();
            dt = ds.Tables[0];
            dgvChiTietNoiQuy.DataSource = dt;
            dgvChiTietNoiQuy.Columns[0].HeaderText = "Mã nội quy";
            dgvChiTietNoiQuy.Columns[0].HeaderText = "Điều lệ vi phạm";
            dgvChiTietNoiQuy.Columns[0].HeaderText = "Số lần vi phạm";
            dgvChiTietNoiQuy.Columns[0].HeaderText = "Tổng số điểm trừ";
        }
    }
}
