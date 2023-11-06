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
            this.label1 = new System.Windows.Forms.Label();
            this.btnXemChiTiet = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            ((System.ComponentModel.ISupportInitialize)(this.dgvXemThiDua)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvXemThiDua
            // 
            this.dgvXemThiDua.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvXemThiDua.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvXemThiDua.Location = new System.Drawing.Point(23, 124);
            this.dgvXemThiDua.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dgvXemThiDua.Name = "dgvXemThiDua";
            this.dgvXemThiDua.RowHeadersWidth = 62;
            this.dgvXemThiDua.RowTemplate.Height = 28;
            this.dgvXemThiDua.Size = new System.Drawing.Size(746, 373);
            this.dgvXemThiDua.TabIndex = 0;
            this.dgvXemThiDua.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvXemThiDua_CellClick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 16F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.CadetBlue;
            this.label1.Location = new System.Drawing.Point(148, 42);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(462, 37);
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
            this.btnXemChiTiet.Location = new System.Drawing.Point(284, 537);
            this.btnXemChiTiet.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnXemChiTiet.Name = "btnXemChiTiet";
            this.btnXemChiTiet.Size = new System.Drawing.Size(181, 37);
            this.btnXemChiTiet.TabIndex = 97;
            this.btnXemChiTiet.Text = "Xem Chi Tiết";
            this.btnXemChiTiet.Click += new System.EventHandler(this.btnXemChiTiet_Click);
            // 
            // XemThiDuaLop
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.btnXemChiTiet);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgvXemThiDua);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "XemThiDuaLop";
            this.Size = new System.Drawing.Size(798, 657);
            this.Load += new System.EventHandler(this.XemThiDuaLop_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvXemThiDua)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvXemThiDua;
        private System.Windows.Forms.Label label1;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnXemChiTiet;
    }
}
