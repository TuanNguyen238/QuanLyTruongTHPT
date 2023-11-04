namespace DoAnHQTCSDL.UserControls.Admin
{
    partial class NoiQuy
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dgvNoiQuy = new System.Windows.Forms.DataGridView();
            this.DieuLe = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.SoDiemTru = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.NgayBanHanh = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.txtSoDiemTru = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.txtDieuLe = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.dtNgayBanHanh = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.btnThem = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.btnSua = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.btnXoa = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.panel1 = new System.Windows.Forms.Panel();
            this.siticoneButton1 = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.siticoneButton2 = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            ((System.ComponentModel.ISupportInitialize)(this.dgvNoiQuy)).BeginInit();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgvNoiQuy
            // 
            this.dgvNoiQuy.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvNoiQuy.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvNoiQuy.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.DieuLe,
            this.SoDiemTru,
            this.NgayBanHanh});
            this.dgvNoiQuy.Location = new System.Drawing.Point(12, 229);
            this.dgvNoiQuy.Name = "dgvNoiQuy";
            this.dgvNoiQuy.RowHeadersWidth = 62;
            this.dgvNoiQuy.RowTemplate.Height = 28;
            this.dgvNoiQuy.Size = new System.Drawing.Size(812, 449);
            this.dgvNoiQuy.TabIndex = 0;
            // 
            // DieuLe
            // 
            this.DieuLe.HeaderText = "Điều Lệ";
            this.DieuLe.MinimumWidth = 8;
            this.DieuLe.Name = "DieuLe";
            // 
            // SoDiemTru
            // 
            this.SoDiemTru.HeaderText = "Số Điểm Trừ";
            this.SoDiemTru.MinimumWidth = 8;
            this.SoDiemTru.Name = "SoDiemTru";
            // 
            // NgayBanHanh
            // 
            this.NgayBanHanh.HeaderText = "Ngày Ban Hành";
            this.NgayBanHanh.MinimumWidth = 8;
            this.NgayBanHanh.Name = "NgayBanHanh";
            // 
            // txtSoDiemTru
            // 
            this.txtSoDiemTru.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtSoDiemTru.DefaultText = "";
            this.txtSoDiemTru.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtSoDiemTru.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtSoDiemTru.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtSoDiemTru.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtSoDiemTru.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtSoDiemTru.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtSoDiemTru.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtSoDiemTru.Location = new System.Drawing.Point(199, 66);
            this.txtSoDiemTru.Name = "txtSoDiemTru";
            this.txtSoDiemTru.PasswordChar = '\0';
            this.txtSoDiemTru.PlaceholderText = "";
            this.txtSoDiemTru.SelectedText = "";
            this.txtSoDiemTru.Size = new System.Drawing.Size(234, 37);
            this.txtSoDiemTru.TabIndex = 69;
            // 
            // txtDieuLe
            // 
            this.txtDieuLe.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtDieuLe.DefaultText = "";
            this.txtDieuLe.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtDieuLe.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtDieuLe.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtDieuLe.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtDieuLe.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtDieuLe.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtDieuLe.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtDieuLe.Location = new System.Drawing.Point(199, 18);
            this.txtDieuLe.Name = "txtDieuLe";
            this.txtDieuLe.PasswordChar = '\0';
            this.txtDieuLe.PlaceholderText = "";
            this.txtDieuLe.SelectedText = "";
            this.txtDieuLe.Size = new System.Drawing.Size(234, 37);
            this.txtDieuLe.TabIndex = 68;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Segoe UI Black", 10F, System.Drawing.FontStyle.Bold);
            this.label9.ForeColor = System.Drawing.Color.CadetBlue;
            this.label9.Location = new System.Drawing.Point(7, 21);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(91, 28);
            this.label9.TabIndex = 67;
            this.label9.Text = "Điều Lệ:";
            // 
            // dtNgayBanHanh
            // 
            this.dtNgayBanHanh.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtNgayBanHanh.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtNgayBanHanh.Location = new System.Drawing.Point(199, 115);
            this.dtNgayBanHanh.Name = "dtNgayBanHanh";
            this.dtNgayBanHanh.Size = new System.Drawing.Size(234, 30);
            this.dtNgayBanHanh.TabIndex = 66;
            this.dtNgayBanHanh.Value = new System.DateTime(2023, 10, 26, 0, 0, 0, 0);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI Black", 10F, System.Drawing.FontStyle.Bold);
            this.label2.ForeColor = System.Drawing.Color.CadetBlue;
            this.label2.Location = new System.Drawing.Point(7, 70);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(141, 28);
            this.label2.TabIndex = 65;
            this.label2.Text = "Số Điểm Trừ:";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Segoe UI Black", 10F, System.Drawing.FontStyle.Bold);
            this.label8.ForeColor = System.Drawing.Color.CadetBlue;
            this.label8.Location = new System.Drawing.Point(7, 115);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(171, 28);
            this.label8.TabIndex = 64;
            this.label8.Text = "Ngày Ban Hành:";
            // 
            // btnThem
            // 
            this.btnThem.BackColor = System.Drawing.Color.White;
            this.btnThem.BorderRadius = 5;
            this.btnThem.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThem.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThem.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThem.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThem.FillColor = System.Drawing.Color.CadetBlue;
            this.btnThem.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThem.ForeColor = System.Drawing.Color.White;
            this.btnThem.Location = new System.Drawing.Point(38, 722);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(127, 58);
            this.btnThem.TabIndex = 70;
            this.btnThem.Text = "Thêm";
            // 
            // btnSua
            // 
            this.btnSua.BackColor = System.Drawing.Color.White;
            this.btnSua.BorderRadius = 5;
            this.btnSua.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnSua.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnSua.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnSua.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnSua.FillColor = System.Drawing.Color.CadetBlue;
            this.btnSua.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSua.ForeColor = System.Drawing.Color.White;
            this.btnSua.Location = new System.Drawing.Point(196, 722);
            this.btnSua.Name = "btnSua";
            this.btnSua.Size = new System.Drawing.Size(127, 58);
            this.btnSua.TabIndex = 71;
            this.btnSua.Text = "Sửa";
            // 
            // btnXoa
            // 
            this.btnXoa.BackColor = System.Drawing.Color.White;
            this.btnXoa.BorderRadius = 5;
            this.btnXoa.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnXoa.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnXoa.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnXoa.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnXoa.FillColor = System.Drawing.Color.CadetBlue;
            this.btnXoa.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXoa.ForeColor = System.Drawing.Color.White;
            this.btnXoa.Location = new System.Drawing.Point(355, 722);
            this.btnXoa.Name = "btnXoa";
            this.btnXoa.Size = new System.Drawing.Size(127, 58);
            this.btnXoa.TabIndex = 72;
            this.btnXoa.Text = "Xóa";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.txtSoDiemTru);
            this.panel1.Controls.Add(this.txtDieuLe);
            this.panel1.Controls.Add(this.label9);
            this.panel1.Controls.Add(this.dtNgayBanHanh);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.label8);
            this.panel1.Location = new System.Drawing.Point(12, 25);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(811, 189);
            this.panel1.TabIndex = 73;
            // 
            // siticoneButton1
            // 
            this.siticoneButton1.BackColor = System.Drawing.Color.White;
            this.siticoneButton1.BorderRadius = 5;
            this.siticoneButton1.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.siticoneButton1.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.siticoneButton1.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.siticoneButton1.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.siticoneButton1.FillColor = System.Drawing.Color.CadetBlue;
            this.siticoneButton1.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.siticoneButton1.ForeColor = System.Drawing.Color.White;
            this.siticoneButton1.Location = new System.Drawing.Point(670, 722);
            this.siticoneButton1.Name = "siticoneButton1";
            this.siticoneButton1.Size = new System.Drawing.Size(127, 58);
            this.siticoneButton1.TabIndex = 74;
            this.siticoneButton1.Text = "Hủy";
            // 
            // siticoneButton2
            // 
            this.siticoneButton2.BackColor = System.Drawing.Color.White;
            this.siticoneButton2.BorderRadius = 5;
            this.siticoneButton2.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.siticoneButton2.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.siticoneButton2.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.siticoneButton2.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.siticoneButton2.FillColor = System.Drawing.Color.CadetBlue;
            this.siticoneButton2.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.siticoneButton2.ForeColor = System.Drawing.Color.White;
            this.siticoneButton2.Location = new System.Drawing.Point(515, 722);
            this.siticoneButton2.Name = "siticoneButton2";
            this.siticoneButton2.Size = new System.Drawing.Size(127, 58);
            this.siticoneButton2.TabIndex = 75;
            this.siticoneButton2.Text = "Lưu";
            // 
            // NoiQuy
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.siticoneButton2);
            this.Controls.Add(this.siticoneButton1);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.btnXoa);
            this.Controls.Add(this.btnSua);
            this.Controls.Add(this.btnThem);
            this.Controls.Add(this.dgvNoiQuy);
            this.Name = "NoiQuy";
            this.Size = new System.Drawing.Size(843, 822);
            ((System.ComponentModel.ISupportInitialize)(this.dgvNoiQuy)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvNoiQuy;
        private System.Windows.Forms.DataGridViewTextBoxColumn DieuLe;
        private System.Windows.Forms.DataGridViewTextBoxColumn SoDiemTru;
        private System.Windows.Forms.DataGridViewTextBoxColumn NgayBanHanh;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtSoDiemTru;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtDieuLe;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.DateTimePicker dtNgayBanHanh;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label8;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnThem;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnSua;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnXoa;
        private System.Windows.Forms.Panel panel1;
        private Siticone.Desktop.UI.WinForms.SiticoneButton siticoneButton1;
        private Siticone.Desktop.UI.WinForms.SiticoneButton siticoneButton2;
    }
}
