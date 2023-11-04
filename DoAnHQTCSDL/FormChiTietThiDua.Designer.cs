namespace DoAnHQTCSDL
{
    partial class FormChiTietThiDua
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txtLop = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.dgvChiTietNoiQuy = new System.Windows.Forms.DataGridView();
            this.MaNQ = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DieuLe = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.SoLanViPham = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TongSoDiemTru = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnThoat = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            ((System.ComponentModel.ISupportInitialize)(this.dgvChiTietNoiQuy)).BeginInit();
            this.SuspendLayout();
            // 
            // txtLop
            // 
            this.txtLop.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtLop.DefaultText = "";
            this.txtLop.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtLop.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtLop.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtLop.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtLop.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtLop.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtLop.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtLop.Location = new System.Drawing.Point(120, 54);
            this.txtLop.Name = "txtLop";
            this.txtLop.PasswordChar = '\0';
            this.txtLop.PlaceholderText = "";
            this.txtLop.SelectedText = "";
            this.txtLop.Size = new System.Drawing.Size(158, 28);
            this.txtLop.TabIndex = 94;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.ForeColor = System.Drawing.Color.CadetBlue;
            this.label8.Location = new System.Drawing.Point(24, 54);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(48, 25);
            this.label8.TabIndex = 93;
            this.label8.Text = "Lớp:";
            // 
            // dgvChiTietNoiQuy
            // 
            this.dgvChiTietNoiQuy.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvChiTietNoiQuy.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvChiTietNoiQuy.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.MaNQ,
            this.DieuLe,
            this.SoLanViPham,
            this.TongSoDiemTru});
            this.dgvChiTietNoiQuy.Location = new System.Drawing.Point(12, 125);
            this.dgvChiTietNoiQuy.Name = "dgvChiTietNoiQuy";
            this.dgvChiTietNoiQuy.RowHeadersWidth = 62;
            this.dgvChiTietNoiQuy.RowTemplate.Height = 28;
            this.dgvChiTietNoiQuy.Size = new System.Drawing.Size(858, 301);
            this.dgvChiTietNoiQuy.TabIndex = 92;
            // 
            // MaNQ
            // 
            this.MaNQ.HeaderText = "Mã Nội Quy";
            this.MaNQ.MinimumWidth = 8;
            this.MaNQ.Name = "MaNQ";
            // 
            // DieuLe
            // 
            this.DieuLe.HeaderText = "Điều Lệ Vi Phạm";
            this.DieuLe.MinimumWidth = 8;
            this.DieuLe.Name = "DieuLe";
            // 
            // SoLanViPham
            // 
            this.SoLanViPham.HeaderText = "Số Lần Vi Phạm";
            this.SoLanViPham.MinimumWidth = 8;
            this.SoLanViPham.Name = "SoLanViPham";
            // 
            // TongSoDiemTru
            // 
            this.TongSoDiemTru.HeaderText = "Tổng Số Điểm Trừ";
            this.TongSoDiemTru.MinimumWidth = 8;
            this.TongSoDiemTru.Name = "TongSoDiemTru";
            // 
            // btnThoat
            // 
            this.btnThoat.BackColor = System.Drawing.Color.CadetBlue;
            this.btnThoat.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThoat.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThoat.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThoat.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThoat.FillColor = System.Drawing.Color.CadetBlue;
            this.btnThoat.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThoat.ForeColor = System.Drawing.Color.White;
            this.btnThoat.Location = new System.Drawing.Point(721, 449);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(149, 49);
            this.btnThoat.TabIndex = 97;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // FormChiTietThiDua
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(890, 519);
            this.Controls.Add(this.btnThoat);
            this.Controls.Add(this.txtLop);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.dgvChiTietNoiQuy);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "FormChiTietThiDua";
            this.Text = "FormChiTietThiDua";
            ((System.ComponentModel.ISupportInitialize)(this.dgvChiTietNoiQuy)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtLop;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.DataGridView dgvChiTietNoiQuy;
        private System.Windows.Forms.DataGridViewTextBoxColumn MaNQ;
        private System.Windows.Forms.DataGridViewTextBoxColumn DieuLe;
        private System.Windows.Forms.DataGridViewTextBoxColumn SoLanViPham;
        private System.Windows.Forms.DataGridViewTextBoxColumn TongSoDiemTru;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnThoat;
    }
}