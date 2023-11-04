namespace DoAnHQTCSDL.UserControls.GiaoVien
{
    partial class XemDiemCaNam
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
            this.dgvCaNam = new System.Windows.Forms.DataGridView();
            this.MaHS = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TenMon = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TBM = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.labelDiemHK2 = new System.Windows.Forms.Label();
            this.txtTBM = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.txtMaHS = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.txtMon = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.panelTT = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtDiemTongKet = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.txtXepHang = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtDanhHieu = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtHanhKiem = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.panelTK = new System.Windows.Forms.Panel();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCaNam)).BeginInit();
            this.panelTT.SuspendLayout();
            this.panelTK.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgvCaNam
            // 
            this.dgvCaNam.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvCaNam.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvCaNam.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.MaHS,
            this.TenMon,
            this.TBM});
            this.dgvCaNam.Location = new System.Drawing.Point(38, 175);
            this.dgvCaNam.Name = "dgvCaNam";
            this.dgvCaNam.RowHeadersWidth = 62;
            this.dgvCaNam.RowTemplate.Height = 28;
            this.dgvCaNam.Size = new System.Drawing.Size(789, 275);
            this.dgvCaNam.TabIndex = 81;
            // 
            // MaHS
            // 
            this.MaHS.HeaderText = "Mã Học Sinh";
            this.MaHS.MinimumWidth = 8;
            this.MaHS.Name = "MaHS";
            // 
            // TenMon
            // 
            this.TenMon.HeaderText = "Môn Học";
            this.TenMon.MinimumWidth = 8;
            this.TenMon.Name = "TenMon";
            // 
            // TBM
            // 
            this.TBM.HeaderText = "TBM";
            this.TBM.MinimumWidth = 8;
            this.TBM.Name = "TBM";
            // 
            // labelDiemHK2
            // 
            this.labelDiemHK2.AutoSize = true;
            this.labelDiemHK2.Font = new System.Drawing.Font("Segoe UI Semibold", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelDiemHK2.Location = new System.Drawing.Point(251, 121);
            this.labelDiemHK2.Name = "labelDiemHK2";
            this.labelDiemHK2.Size = new System.Drawing.Size(368, 28);
            this.labelDiemHK2.TabIndex = 80;
            this.labelDiemHK2.Text = "Bảng điểm các môn học học kỳ cả năm";
            // 
            // txtTBM
            // 
            this.txtTBM.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtTBM.DefaultText = "";
            this.txtTBM.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtTBM.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtTBM.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtTBM.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtTBM.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtTBM.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtTBM.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtTBM.Location = new System.Drawing.Point(584, 10);
            this.txtTBM.Name = "txtTBM";
            this.txtTBM.PasswordChar = '\0';
            this.txtTBM.PlaceholderText = "";
            this.txtTBM.SelectedText = "";
            this.txtTBM.Size = new System.Drawing.Size(158, 28);
            this.txtTBM.TabIndex = 106;
            // 
            // txtMaHS
            // 
            this.txtMaHS.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtMaHS.DefaultText = "";
            this.txtMaHS.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtMaHS.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtMaHS.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMaHS.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMaHS.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMaHS.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtMaHS.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMaHS.Location = new System.Drawing.Point(153, 6);
            this.txtMaHS.Name = "txtMaHS";
            this.txtMaHS.PasswordChar = '\0';
            this.txtMaHS.PlaceholderText = "";
            this.txtMaHS.SelectedText = "";
            this.txtMaHS.Size = new System.Drawing.Size(158, 28);
            this.txtMaHS.TabIndex = 105;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.label5.ForeColor = System.Drawing.Color.CadetBlue;
            this.label5.Location = new System.Drawing.Point(407, 10);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(155, 25);
            this.label5.TabIndex = 104;
            this.label5.Text = "Trung Bình Môn:";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.ForeColor = System.Drawing.Color.CadetBlue;
            this.label8.Location = new System.Drawing.Point(9, 6);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(125, 25);
            this.label8.TabIndex = 103;
            this.label8.Text = "Mã Học Sinh:";
            // 
            // txtMon
            // 
            this.txtMon.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtMon.DefaultText = "";
            this.txtMon.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtMon.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtMon.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMon.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMon.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMon.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtMon.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMon.Location = new System.Drawing.Point(153, 49);
            this.txtMon.Name = "txtMon";
            this.txtMon.PasswordChar = '\0';
            this.txtMon.PlaceholderText = "";
            this.txtMon.SelectedText = "";
            this.txtMon.Size = new System.Drawing.Size(158, 28);
            this.txtMon.TabIndex = 112;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.ForeColor = System.Drawing.Color.CadetBlue;
            this.label6.Location = new System.Drawing.Point(9, 52);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(95, 25);
            this.label6.TabIndex = 111;
            this.label6.Text = "Môn Học:";
            // 
            // panelTT
            // 
            this.panelTT.Controls.Add(this.txtMon);
            this.panelTT.Controls.Add(this.label6);
            this.panelTT.Controls.Add(this.txtTBM);
            this.panelTT.Controls.Add(this.txtMaHS);
            this.panelTT.Controls.Add(this.label5);
            this.panelTT.Controls.Add(this.label8);
            this.panelTT.Location = new System.Drawing.Point(33, 7);
            this.panelTT.Name = "panelTT";
            this.panelTT.Size = new System.Drawing.Size(779, 100);
            this.panelTT.TabIndex = 113;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.label1.ForeColor = System.Drawing.Color.CadetBlue;
            this.label1.Location = new System.Drawing.Point(5, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(144, 25);
            this.label1.TabIndex = 76;
            this.label1.Text = "Điểm Tổng Kết:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.label2.ForeColor = System.Drawing.Color.CadetBlue;
            this.label2.Location = new System.Drawing.Point(391, 58);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(101, 25);
            this.label2.TabIndex = 77;
            this.label2.Text = "Xếp Hạng:";
            // 
            // txtDiemTongKet
            // 
            this.txtDiemTongKet.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtDiemTongKet.DefaultText = "";
            this.txtDiemTongKet.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtDiemTongKet.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtDiemTongKet.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtDiemTongKet.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtDiemTongKet.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtDiemTongKet.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtDiemTongKet.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtDiemTongKet.Location = new System.Drawing.Point(177, 4);
            this.txtDiemTongKet.Name = "txtDiemTongKet";
            this.txtDiemTongKet.PasswordChar = '\0';
            this.txtDiemTongKet.PlaceholderText = "";
            this.txtDiemTongKet.SelectedText = "";
            this.txtDiemTongKet.Size = new System.Drawing.Size(139, 37);
            this.txtDiemTongKet.TabIndex = 78;
            // 
            // txtXepHang
            // 
            this.txtXepHang.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtXepHang.DefaultText = "";
            this.txtXepHang.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtXepHang.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtXepHang.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtXepHang.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtXepHang.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtXepHang.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtXepHang.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtXepHang.Location = new System.Drawing.Point(544, 52);
            this.txtXepHang.Name = "txtXepHang";
            this.txtXepHang.PasswordChar = '\0';
            this.txtXepHang.PlaceholderText = "";
            this.txtXepHang.SelectedText = "";
            this.txtXepHang.Size = new System.Drawing.Size(139, 37);
            this.txtXepHang.TabIndex = 79;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.label3.ForeColor = System.Drawing.Color.CadetBlue;
            this.label3.Location = new System.Drawing.Point(5, 58);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(107, 25);
            this.label3.TabIndex = 107;
            this.label3.Text = "Danh Hiệu:";
            // 
            // txtDanhHieu
            // 
            this.txtDanhHieu.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtDanhHieu.DefaultText = "";
            this.txtDanhHieu.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtDanhHieu.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtDanhHieu.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtDanhHieu.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtDanhHieu.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtDanhHieu.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtDanhHieu.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtDanhHieu.Location = new System.Drawing.Point(177, 52);
            this.txtDanhHieu.Name = "txtDanhHieu";
            this.txtDanhHieu.PasswordChar = '\0';
            this.txtDanhHieu.PlaceholderText = "";
            this.txtDanhHieu.SelectedText = "";
            this.txtDanhHieu.Size = new System.Drawing.Size(139, 37);
            this.txtDanhHieu.TabIndex = 108;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.label4.ForeColor = System.Drawing.Color.CadetBlue;
            this.label4.Location = new System.Drawing.Point(391, 9);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(111, 25);
            this.label4.TabIndex = 109;
            this.label4.Text = "Hạnh Kiểm:";
            // 
            // txtHanhKiem
            // 
            this.txtHanhKiem.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtHanhKiem.DefaultText = "";
            this.txtHanhKiem.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtHanhKiem.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtHanhKiem.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtHanhKiem.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtHanhKiem.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtHanhKiem.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtHanhKiem.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtHanhKiem.Location = new System.Drawing.Point(544, 4);
            this.txtHanhKiem.Name = "txtHanhKiem";
            this.txtHanhKiem.PasswordChar = '\0';
            this.txtHanhKiem.PlaceholderText = "";
            this.txtHanhKiem.SelectedText = "";
            this.txtHanhKiem.Size = new System.Drawing.Size(139, 37);
            this.txtHanhKiem.TabIndex = 110;
            // 
            // panelTK
            // 
            this.panelTK.Controls.Add(this.txtHanhKiem);
            this.panelTK.Controls.Add(this.label4);
            this.panelTK.Controls.Add(this.txtDanhHieu);
            this.panelTK.Controls.Add(this.label3);
            this.panelTK.Controls.Add(this.txtXepHang);
            this.panelTK.Controls.Add(this.txtDiemTongKet);
            this.panelTK.Controls.Add(this.label2);
            this.panelTK.Controls.Add(this.label1);
            this.panelTK.Location = new System.Drawing.Point(27, 465);
            this.panelTK.Name = "panelTK";
            this.panelTK.Size = new System.Drawing.Size(799, 101);
            this.panelTK.TabIndex = 114;
            // 
            // XemDiemCaNam
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.panelTK);
            this.Controls.Add(this.panelTT);
            this.Controls.Add(this.dgvCaNam);
            this.Controls.Add(this.labelDiemHK2);
            this.Name = "XemDiemCaNam";
            this.Size = new System.Drawing.Size(830, 567);
            ((System.ComponentModel.ISupportInitialize)(this.dgvCaNam)).EndInit();
            this.panelTT.ResumeLayout(false);
            this.panelTT.PerformLayout();
            this.panelTK.ResumeLayout(false);
            this.panelTK.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvCaNam;
        private System.Windows.Forms.Label labelDiemHK2;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtTBM;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtMaHS;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.DataGridViewTextBoxColumn MaHS;
        private System.Windows.Forms.DataGridViewTextBoxColumn TenMon;
        private System.Windows.Forms.DataGridViewTextBoxColumn TBM;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtMon;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Panel panelTT;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtDiemTongKet;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtXepHang;
        private System.Windows.Forms.Label label3;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtDanhHieu;
        private System.Windows.Forms.Label label4;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtHanhKiem;
        private System.Windows.Forms.Panel panelTK;
    }
}
