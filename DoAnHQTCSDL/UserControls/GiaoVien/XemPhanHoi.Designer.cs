namespace DoAnHQTCSDL.UserControls
{
    partial class XemPhanHoi
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
            this.dgvPhanHoi = new System.Windows.Forms.DataGridView();
            this.MaHS = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.HoTen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TenLop = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.NoiDungPhanHoi = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPhanHoi)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvPhanHoi
            // 
            this.dgvPhanHoi.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvPhanHoi.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvPhanHoi.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.MaHS,
            this.HoTen,
            this.TenLop,
            this.NoiDungPhanHoi});
            this.dgvPhanHoi.Location = new System.Drawing.Point(35, 163);
            this.dgvPhanHoi.Name = "dgvPhanHoi";
            this.dgvPhanHoi.RowHeadersWidth = 62;
            this.dgvPhanHoi.RowTemplate.Height = 28;
            this.dgvPhanHoi.Size = new System.Drawing.Size(818, 497);
            this.dgvPhanHoi.TabIndex = 0;
            // 
            // MaHS
            // 
            this.MaHS.FillWeight = 52.91829F;
            this.MaHS.HeaderText = "Mã Học Sinh";
            this.MaHS.MinimumWidth = 8;
            this.MaHS.Name = "MaHS";
            // 
            // HoTen
            // 
            this.HoTen.FillWeight = 68.06041F;
            this.HoTen.HeaderText = "Họ Tên";
            this.HoTen.MinimumWidth = 8;
            this.HoTen.Name = "HoTen";
            // 
            // TenLop
            // 
            this.TenLop.HeaderText = "Lớp";
            this.TenLop.MinimumWidth = 8;
            this.TenLop.Name = "TenLop";
            // 
            // NoiDungPhanHoi
            // 
            this.NoiDungPhanHoi.FillWeight = 179.0213F;
            this.NoiDungPhanHoi.HeaderText = "Nội Dung Phản Hồi";
            this.NoiDungPhanHoi.MinimumWidth = 8;
            this.NoiDungPhanHoi.Name = "NoiDungPhanHoi";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 28F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.CadetBlue;
            this.label1.Location = new System.Drawing.Point(172, 42);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(598, 74);
            this.label1.TabIndex = 95;
            this.label1.Text = "Các phản hồi đã nhận";
            // 
            // XemPhanHoi
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgvPhanHoi);
            this.Name = "XemPhanHoi";
            this.Size = new System.Drawing.Size(864, 835);
            ((System.ComponentModel.ISupportInitialize)(this.dgvPhanHoi)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvPhanHoi;
        private System.Windows.Forms.DataGridViewTextBoxColumn MaHS;
        private System.Windows.Forms.DataGridViewTextBoxColumn HoTen;
        private System.Windows.Forms.DataGridViewTextBoxColumn TenLop;
        private System.Windows.Forms.DataGridViewTextBoxColumn NoiDungPhanHoi;
        private System.Windows.Forms.Label label1;
    }
}
