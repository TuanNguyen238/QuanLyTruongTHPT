namespace DoAnHQTCSDL.UserControls.Admin
{
    partial class DuyetHoSo
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvDuyetHoSo = new System.Windows.Forms.DataGridView();
            this.MaHoSo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.HoTen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TruongHocCu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DiemTuyenSinh = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label1 = new System.Windows.Forms.Label();
            this.btnDuyetHoSo = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDuyetHoSo)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvDuyetHoSo
            // 
            this.dgvDuyetHoSo.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvDuyetHoSo.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dgvDuyetHoSo.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvDuyetHoSo.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.MaHoSo,
            this.HoTen,
            this.TruongHocCu,
            this.DiemTuyenSinh});
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Segoe UI", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvDuyetHoSo.DefaultCellStyle = dataGridViewCellStyle2;
            this.dgvDuyetHoSo.Location = new System.Drawing.Point(22, 135);
            this.dgvDuyetHoSo.Name = "dgvDuyetHoSo";
            this.dgvDuyetHoSo.RowHeadersWidth = 62;
            this.dgvDuyetHoSo.RowTemplate.Height = 28;
            this.dgvDuyetHoSo.Size = new System.Drawing.Size(798, 519);
            this.dgvDuyetHoSo.TabIndex = 0;
            // 
            // MaHoSo
            // 
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Segoe UI", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.MaHoSo.DefaultCellStyle = dataGridViewCellStyle1;
            this.MaHoSo.HeaderText = "Mã Hồ Sơ";
            this.MaHoSo.MinimumWidth = 8;
            this.MaHoSo.Name = "MaHoSo";
            // 
            // HoTen
            // 
            this.HoTen.HeaderText = "Họ Tên";
            this.HoTen.MinimumWidth = 8;
            this.HoTen.Name = "HoTen";
            // 
            // TruongHocCu
            // 
            this.TruongHocCu.HeaderText = "Trường Học Cũ";
            this.TruongHocCu.MinimumWidth = 8;
            this.TruongHocCu.Name = "TruongHocCu";
            // 
            // DiemTuyenSinh
            // 
            this.DiemTuyenSinh.HeaderText = "Điểm Tuyển Sinh";
            this.DiemTuyenSinh.MinimumWidth = 8;
            this.DiemTuyenSinh.Name = "DiemTuyenSinh";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 20F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.CadetBlue;
            this.label1.Location = new System.Drawing.Point(31, 46);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(771, 54);
            this.label1.TabIndex = 63;
            this.label1.Text = "Danh sách các hồ sơ tuyển sinh đã nhận";
            // 
            // btnDuyetHoSo
            // 
            this.btnDuyetHoSo.BackColor = System.Drawing.Color.White;
            this.btnDuyetHoSo.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnDuyetHoSo.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnDuyetHoSo.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnDuyetHoSo.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnDuyetHoSo.FillColor = System.Drawing.Color.CadetBlue;
            this.btnDuyetHoSo.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDuyetHoSo.ForeColor = System.Drawing.Color.White;
            this.btnDuyetHoSo.Location = new System.Drawing.Point(304, 707);
            this.btnDuyetHoSo.Name = "btnDuyetHoSo";
            this.btnDuyetHoSo.Size = new System.Drawing.Size(212, 37);
            this.btnDuyetHoSo.TabIndex = 65;
            this.btnDuyetHoSo.Text = "Duyệt Hồ Sơ";
            this.btnDuyetHoSo.Click += new System.EventHandler(this.btnDuyetHoSo_Click);
            // 
            // DuyetHoSo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.btnDuyetHoSo);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgvDuyetHoSo);
            this.Name = "DuyetHoSo";
            this.Size = new System.Drawing.Size(843, 821);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDuyetHoSo)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvDuyetHoSo;
        private System.Windows.Forms.Label label1;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnDuyetHoSo;
        private System.Windows.Forms.DataGridViewTextBoxColumn MaHoSo;
        private System.Windows.Forms.DataGridViewTextBoxColumn HoTen;
        private System.Windows.Forms.DataGridViewTextBoxColumn TruongHocCu;
        private System.Windows.Forms.DataGridViewTextBoxColumn DiemTuyenSinh;
    }
}
