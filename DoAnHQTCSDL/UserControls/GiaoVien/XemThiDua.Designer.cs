namespace DoAnHQTCSDL.UserControls
{
    partial class XemThiDua
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.dgvXemThiDua = new System.Windows.Forms.DataGridView();
            this.MaNQ = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DieuLe = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.SoLanViPham = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TongSoDiemTru = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtDiemTongKet = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.txtXepHang = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.txtLop = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.panelThiDua = new System.Windows.Forms.Panel();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvXemThiDua)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(32000, 32145);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 62;
            this.dataGridView1.RowTemplate.Height = 28;
            this.dataGridView1.Size = new System.Drawing.Size(836, 632);
            this.dataGridView1.TabIndex = 0;
            // 
            // dgvXemThiDua
            // 
            this.dgvXemThiDua.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvXemThiDua.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvXemThiDua.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.MaNQ,
            this.DieuLe,
            this.SoLanViPham,
            this.TongSoDiemTru});
            this.dgvXemThiDua.Location = new System.Drawing.Point(30, 188);
            this.dgvXemThiDua.Name = "dgvXemThiDua";
            this.dgvXemThiDua.RowHeadersWidth = 62;
            this.dgvXemThiDua.RowTemplate.Height = 28;
            this.dgvXemThiDua.Size = new System.Drawing.Size(831, 302);
            this.dgvXemThiDua.TabIndex = 1;
            this.dgvXemThiDua.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView2_CellContentClick);
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
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI Black", 10F, System.Drawing.FontStyle.Bold);
            this.label1.ForeColor = System.Drawing.Color.CadetBlue;
            this.label1.Location = new System.Drawing.Point(94, 551);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(166, 28);
            this.label1.TabIndex = 2;
            this.label1.Text = "Điểm Tổng Kết:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI Black", 10F, System.Drawing.FontStyle.Bold);
            this.label2.ForeColor = System.Drawing.Color.CadetBlue;
            this.label2.Location = new System.Drawing.Point(94, 600);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(115, 28);
            this.label2.TabIndex = 3;
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
            this.txtDiemTongKet.Location = new System.Drawing.Point(274, 551);
            this.txtDiemTongKet.Name = "txtDiemTongKet";
            this.txtDiemTongKet.PasswordChar = '\0';
            this.txtDiemTongKet.PlaceholderText = "";
            this.txtDiemTongKet.SelectedText = "";
            this.txtDiemTongKet.Size = new System.Drawing.Size(234, 37);
            this.txtDiemTongKet.TabIndex = 68;
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
            this.txtXepHang.Location = new System.Drawing.Point(274, 600);
            this.txtXepHang.Name = "txtXepHang";
            this.txtXepHang.PasswordChar = '\0';
            this.txtXepHang.PlaceholderText = "";
            this.txtXepHang.SelectedText = "";
            this.txtXepHang.Size = new System.Drawing.Size(234, 37);
            this.txtXepHang.TabIndex = 69;
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
            this.txtLop.Location = new System.Drawing.Point(141, 83);
            this.txtLop.Name = "txtLop";
            this.txtLop.PasswordChar = '\0';
            this.txtLop.PlaceholderText = "";
            this.txtLop.SelectedText = "";
            this.txtLop.Size = new System.Drawing.Size(158, 42);
            this.txtLop.TabIndex = 91;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.ForeColor = System.Drawing.Color.CadetBlue;
            this.label8.Location = new System.Drawing.Point(45, 94);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(60, 31);
            this.label8.TabIndex = 90;
            this.label8.Text = "Lớp:";
            // 
            // panelThiDua
            // 
            this.panelThiDua.Location = new System.Drawing.Point(30, 529);
            this.panelThiDua.Name = "panelThiDua";
            this.panelThiDua.Size = new System.Drawing.Size(831, 133);
            this.panelThiDua.TabIndex = 92;
            // 
            // XemThiDua
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.txtLop);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.txtXepHang);
            this.Controls.Add(this.txtDiemTongKet);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgvXemThiDua);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.panelThiDua);
            this.Name = "XemThiDua";
            this.Size = new System.Drawing.Size(864, 835);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvXemThiDua)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridView dgvXemThiDua;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtDiemTongKet;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtXepHang;
        private System.Windows.Forms.DataGridViewTextBoxColumn MaNQ;
        private System.Windows.Forms.DataGridViewTextBoxColumn DieuLe;
        private System.Windows.Forms.DataGridViewTextBoxColumn SoLanViPham;
        private System.Windows.Forms.DataGridViewTextBoxColumn TongSoDiemTru;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtLop;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Panel panelThiDua;
    }
}
