﻿namespace DoAnHQTCSDL.UserControls.Admin
{
    partial class XemDiemHSCaNam
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
            this.dgvDiemHSCaNam = new System.Windows.Forms.DataGridView();
            this.MaHS = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TenLop = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.HoTen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DiemTB = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.HanhKiem = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DanhHieu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.XepHang = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.labelDiemHK1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDiemHSCaNam)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvDiemHSCaNam
            // 
            this.dgvDiemHSCaNam.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvDiemHSCaNam.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvDiemHSCaNam.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.MaHS,
            this.TenLop,
            this.HoTen,
            this.DiemTB,
            this.HanhKiem,
            this.DanhHieu,
            this.XepHang});
            this.dgvDiemHSCaNam.Location = new System.Drawing.Point(16, 128);
            this.dgvDiemHSCaNam.Name = "dgvDiemHSCaNam";
            this.dgvDiemHSCaNam.RowHeadersWidth = 62;
            this.dgvDiemHSCaNam.RowTemplate.Height = 28;
            this.dgvDiemHSCaNam.Size = new System.Drawing.Size(814, 389);
            this.dgvDiemHSCaNam.TabIndex = 1;
            // 
            // MaHS
            // 
            this.MaHS.HeaderText = "Mã Học Sinh";
            this.MaHS.MinimumWidth = 8;
            this.MaHS.Name = "MaHS";
            // 
            // TenLop
            // 
            this.TenLop.HeaderText = "Lớp";
            this.TenLop.MinimumWidth = 8;
            this.TenLop.Name = "TenLop";
            // 
            // HoTen
            // 
            this.HoTen.HeaderText = "Họ Tên";
            this.HoTen.MinimumWidth = 8;
            this.HoTen.Name = "HoTen";
            // 
            // DiemTB
            // 
            this.DiemTB.HeaderText = "Trung Bình Môn";
            this.DiemTB.MinimumWidth = 8;
            this.DiemTB.Name = "DiemTB";
            // 
            // HanhKiem
            // 
            this.HanhKiem.HeaderText = "Hạnh Kiểm";
            this.HanhKiem.MinimumWidth = 8;
            this.HanhKiem.Name = "HanhKiem";
            // 
            // DanhHieu
            // 
            this.DanhHieu.HeaderText = "Danh Hiệu";
            this.DanhHieu.MinimumWidth = 8;
            this.DanhHieu.Name = "DanhHieu";
            // 
            // XepHang
            // 
            this.XepHang.HeaderText = "Xếp Hạng";
            this.XepHang.MinimumWidth = 8;
            this.XepHang.Name = "XepHang";
            // 
            // labelDiemHK1
            // 
            this.labelDiemHK1.AutoSize = true;
            this.labelDiemHK1.Font = new System.Drawing.Font("Segoe UI Semibold", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelDiemHK1.Location = new System.Drawing.Point(260, 58);
            this.labelDiemHK1.Name = "labelDiemHK1";
            this.labelDiemHK1.Size = new System.Drawing.Size(301, 28);
            this.labelDiemHK1.TabIndex = 68;
            this.labelDiemHK1.Text = "Bảng điểm của học sinh cả năm";
            // 
            // XemDiemHSCaNam
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.labelDiemHK1);
            this.Controls.Add(this.dgvDiemHSCaNam);
            this.Name = "XemDiemHSCaNam";
            this.Size = new System.Drawing.Size(850, 564);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDiemHSCaNam)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvDiemHSCaNam;
        private System.Windows.Forms.DataGridViewTextBoxColumn MaHS;
        private System.Windows.Forms.DataGridViewTextBoxColumn TenLop;
        private System.Windows.Forms.DataGridViewTextBoxColumn HoTen;
        private System.Windows.Forms.DataGridViewTextBoxColumn DiemTB;
        private System.Windows.Forms.DataGridViewTextBoxColumn HanhKiem;
        private System.Windows.Forms.DataGridViewTextBoxColumn DanhHieu;
        private System.Windows.Forms.DataGridViewTextBoxColumn XepHang;
        private System.Windows.Forms.Label labelDiemHK1;
    }
}
