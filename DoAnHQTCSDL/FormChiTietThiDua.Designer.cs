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
            this.txtLop.Location = new System.Drawing.Point(107, 43);
            this.txtLop.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtLop.Name = "txtLop";
            this.txtLop.PasswordChar = '\0';
            this.txtLop.PlaceholderText = "";
            this.txtLop.SelectedText = "";
            this.txtLop.Size = new System.Drawing.Size(140, 22);
            this.txtLop.TabIndex = 94;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.ForeColor = System.Drawing.Color.CadetBlue;
            this.label8.Location = new System.Drawing.Point(21, 43);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(39, 20);
            this.label8.TabIndex = 93;
            this.label8.Text = "Lớp:";
            // 
            // dgvChiTietNoiQuy
            // 
            this.dgvChiTietNoiQuy.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvChiTietNoiQuy.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvChiTietNoiQuy.Location = new System.Drawing.Point(11, 100);
            this.dgvChiTietNoiQuy.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dgvChiTietNoiQuy.Name = "dgvChiTietNoiQuy";
            this.dgvChiTietNoiQuy.RowHeadersWidth = 62;
            this.dgvChiTietNoiQuy.RowTemplate.Height = 28;
            this.dgvChiTietNoiQuy.Size = new System.Drawing.Size(763, 241);
            this.dgvChiTietNoiQuy.TabIndex = 92;
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
            this.btnThoat.Location = new System.Drawing.Point(641, 359);
            this.btnThoat.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(132, 39);
            this.btnThoat.TabIndex = 97;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // FormChiTietThiDua
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(791, 415);
            this.Controls.Add(this.btnThoat);
            this.Controls.Add(this.txtLop);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.dgvChiTietNoiQuy);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "FormChiTietThiDua";
            this.Text = "FormChiTietThiDua";
            this.Load += new System.EventHandler(this.FormChiTietThiDua_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvChiTietNoiQuy)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtLop;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.DataGridView dgvChiTietNoiQuy;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnThoat;
    }
}