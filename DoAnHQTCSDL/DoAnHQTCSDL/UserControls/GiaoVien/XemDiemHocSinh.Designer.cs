namespace DoAnHQTCSDL.UserControls
{
    partial class XemDiemHocSinh
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
            this.rdCaNam = new System.Windows.Forms.RadioButton();
            this.rdHK2 = new System.Windows.Forms.RadioButton();
            this.rdHK1 = new System.Windows.Forms.RadioButton();
            this.btnCapNhat = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.btnTimKiem = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.siticoneTextBox1 = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panelDiem = new System.Windows.Forms.Panel();
            this.siticoneTextBox3 = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // rdCaNam
            // 
            this.rdCaNam.AutoSize = true;
            this.rdCaNam.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdCaNam.Location = new System.Drawing.Point(619, 73);
            this.rdCaNam.Name = "rdCaNam";
            this.rdCaNam.Size = new System.Drawing.Size(106, 32);
            this.rdCaNam.TabIndex = 10;
            this.rdCaNam.TabStop = true;
            this.rdCaNam.Text = "Cả Năm";
            this.rdCaNam.UseVisualStyleBackColor = true;
            this.rdCaNam.CheckedChanged += new System.EventHandler(this.rdCaNam_CheckedChanged);
            // 
            // rdHK2
            // 
            this.rdHK2.AutoSize = true;
            this.rdHK2.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdHK2.Location = new System.Drawing.Point(436, 73);
            this.rdHK2.Name = "rdHK2";
            this.rdHK2.Size = new System.Drawing.Size(114, 32);
            this.rdHK2.TabIndex = 9;
            this.rdHK2.TabStop = true;
            this.rdHK2.Text = "Học Kỳ 2";
            this.rdHK2.UseVisualStyleBackColor = true;
            this.rdHK2.CheckedChanged += new System.EventHandler(this.rdHK2_CheckedChanged);
            // 
            // rdHK1
            // 
            this.rdHK1.AutoSize = true;
            this.rdHK1.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdHK1.Location = new System.Drawing.Point(242, 73);
            this.rdHK1.Name = "rdHK1";
            this.rdHK1.Size = new System.Drawing.Size(114, 32);
            this.rdHK1.TabIndex = 8;
            this.rdHK1.TabStop = true;
            this.rdHK1.Text = "Học Kỳ 1";
            this.rdHK1.UseVisualStyleBackColor = true;
            this.rdHK1.CheckedChanged += new System.EventHandler(this.rdHK1_CheckedChanged);
            // 
            // btnCapNhat
            // 
            this.btnCapNhat.BorderRadius = 5;
            this.btnCapNhat.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnCapNhat.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnCapNhat.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnCapNhat.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnCapNhat.FillColor = System.Drawing.Color.CadetBlue;
            this.btnCapNhat.Font = new System.Drawing.Font("Segoe UI Semibold", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCapNhat.ForeColor = System.Drawing.Color.White;
            this.btnCapNhat.Location = new System.Drawing.Point(351, 733);
            this.btnCapNhat.Name = "btnCapNhat";
            this.btnCapNhat.Size = new System.Drawing.Size(153, 47);
            this.btnCapNhat.TabIndex = 12;
            this.btnCapNhat.Text = "Cập Nhật";
            // 
            // btnTimKiem
            // 
            this.btnTimKiem.BackColor = System.Drawing.Color.CadetBlue;
            this.btnTimKiem.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnTimKiem.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnTimKiem.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnTimKiem.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnTimKiem.FillColor = System.Drawing.Color.CadetBlue;
            this.btnTimKiem.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTimKiem.ForeColor = System.Drawing.Color.White;
            this.btnTimKiem.Location = new System.Drawing.Point(540, 22);
            this.btnTimKiem.Name = "btnTimKiem";
            this.btnTimKiem.Size = new System.Drawing.Size(149, 37);
            this.btnTimKiem.TabIndex = 15;
            this.btnTimKiem.Text = "Tìm kiếm";
            // 
            // siticoneTextBox1
            // 
            this.siticoneTextBox1.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.siticoneTextBox1.DefaultText = "";
            this.siticoneTextBox1.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.siticoneTextBox1.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.siticoneTextBox1.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.siticoneTextBox1.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.siticoneTextBox1.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.siticoneTextBox1.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.siticoneTextBox1.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.siticoneTextBox1.IconLeft = global::DoAnHQTCSDL.Properties.Resources.search__3_;
            this.siticoneTextBox1.Location = new System.Drawing.Point(240, 19);
            this.siticoneTextBox1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.siticoneTextBox1.Name = "siticoneTextBox1";
            this.siticoneTextBox1.PasswordChar = '\0';
            this.siticoneTextBox1.PlaceholderText = "";
            this.siticoneTextBox1.SelectedText = "";
            this.siticoneTextBox1.Size = new System.Drawing.Size(242, 40);
            this.siticoneTextBox1.TabIndex = 14;
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.White;
            this.panel1.Controls.Add(this.btnTimKiem);
            this.panel1.Controls.Add(this.siticoneTextBox1);
            this.panel1.Location = new System.Drawing.Point(0, -7);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(932, 73);
            this.panel1.TabIndex = 13;
            // 
            // panelDiem
            // 
            this.panelDiem.Location = new System.Drawing.Point(3, 110);
            this.panelDiem.Name = "panelDiem";
            this.panelDiem.Size = new System.Drawing.Size(830, 598);
            this.panelDiem.TabIndex = 11;
            // 
            // siticoneTextBox3
            // 
            this.siticoneTextBox3.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.siticoneTextBox3.DefaultText = "";
            this.siticoneTextBox3.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.siticoneTextBox3.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.siticoneTextBox3.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.siticoneTextBox3.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.siticoneTextBox3.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.siticoneTextBox3.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.siticoneTextBox3.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.siticoneTextBox3.Location = new System.Drawing.Point(71, 77);
            this.siticoneTextBox3.Name = "siticoneTextBox3";
            this.siticoneTextBox3.PasswordChar = '\0';
            this.siticoneTextBox3.PlaceholderText = "";
            this.siticoneTextBox3.SelectedText = "";
            this.siticoneTextBox3.Size = new System.Drawing.Size(82, 28);
            this.siticoneTextBox3.TabIndex = 91;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.label4.ForeColor = System.Drawing.Color.CadetBlue;
            this.label4.Location = new System.Drawing.Point(27, 77);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(48, 25);
            this.label4.TabIndex = 90;
            this.label4.Text = "Lớp:";
            // 
            // XemDiemHocSinh
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.siticoneTextBox3);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.panelDiem);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.btnCapNhat);
            this.Controls.Add(this.rdCaNam);
            this.Controls.Add(this.rdHK2);
            this.Controls.Add(this.rdHK1);
            this.Name = "XemDiemHocSinh";
            this.Size = new System.Drawing.Size(836, 794);
            this.panel1.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.RadioButton rdCaNam;
        private System.Windows.Forms.RadioButton rdHK2;
        private System.Windows.Forms.RadioButton rdHK1;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnCapNhat;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnTimKiem;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox siticoneTextBox1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panelDiem;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox siticoneTextBox3;
        private System.Windows.Forms.Label label4;
    }
}
