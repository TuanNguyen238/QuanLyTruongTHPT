namespace DoAnHQTCSDL.UserControls.Admin
{
    partial class XemThiDuaLop
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
            this.dgvXemThiDua = new System.Windows.Forms.DataGridView();
            this.TenLop = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DiemTongKet = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.XepHang = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label1 = new System.Windows.Forms.Label();
            this.btnXemChiTiet = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            ((System.ComponentModel.ISupportInitialize)(this.dgvXemThiDua)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvXemThiDua
            // 
            this.dgvXemThiDua.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvXemThiDua.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvXemThiDua.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.TenLop,
            this.DiemTongKet,
            this.XepHang});
            this.dgvXemThiDua.Location = new System.Drawing.Point(26, 155);
            this.dgvXemThiDua.Name = "dgvXemThiDua";
            this.dgvXemThiDua.RowHeadersWidth = 62;
            this.dgvXemThiDua.RowTemplate.Height = 28;
            this.dgvXemThiDua.Size = new System.Drawing.Size(839, 466);
            this.dgvXemThiDua.TabIndex = 0;
            // 
            // TenLop
            // 
            this.TenLop.HeaderText = "Lớp";
            this.TenLop.MinimumWidth = 8;
            this.TenLop.Name = "TenLop";
            // 
            // DiemTongKet
            // 
            this.DiemTongKet.HeaderText = "Điểm Tổng Kết";
            this.DiemTongKet.MinimumWidth = 8;
            this.DiemTongKet.Name = "DiemTongKet";
            // 
            // XepHang
            // 
            this.XepHang.HeaderText = "Xếp Hạng";
            this.XepHang.MinimumWidth = 8;
            this.XepHang.Name = "XepHang";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 16F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.CadetBlue;
            this.label1.Location = new System.Drawing.Point(166, 52);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(541, 45);
            this.label1.TabIndex = 66;
            this.label1.Text = "Xếp hạng thi đua của tất cả các lớp";
            // 
            // btnXemChiTiet
            // 
            this.btnXemChiTiet.BackColor = System.Drawing.Color.CadetBlue;
            this.btnXemChiTiet.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnXemChiTiet.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnXemChiTiet.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnXemChiTiet.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnXemChiTiet.FillColor = System.Drawing.Color.CadetBlue;
            this.btnXemChiTiet.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXemChiTiet.ForeColor = System.Drawing.Color.White;
            this.btnXemChiTiet.Location = new System.Drawing.Point(319, 671);
            this.btnXemChiTiet.Name = "btnXemChiTiet";
            this.btnXemChiTiet.Size = new System.Drawing.Size(204, 46);
            this.btnXemChiTiet.TabIndex = 97;
            this.btnXemChiTiet.Text = "Xem Chi Tiết";
            this.btnXemChiTiet.Click += new System.EventHandler(this.btnXemChiTiet_Click);
            // 
            // XemThiDuaLop
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.btnXemChiTiet);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgvXemThiDua);
            this.Name = "XemThiDuaLop";
            this.Size = new System.Drawing.Size(898, 821);
            ((System.ComponentModel.ISupportInitialize)(this.dgvXemThiDua)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvXemThiDua;
        private System.Windows.Forms.DataGridViewTextBoxColumn TenLop;
        private System.Windows.Forms.DataGridViewTextBoxColumn DiemTongKet;
        private System.Windows.Forms.DataGridViewTextBoxColumn XepHang;
        private System.Windows.Forms.Label label1;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnXemChiTiet;
    }
}
