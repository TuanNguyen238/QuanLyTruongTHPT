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
            this.txtTimKiem = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panelDiem = new System.Windows.Forms.Panel();
            this.txtLop = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cbNam = new Siticone.Desktop.UI.WinForms.SiticoneComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // rdCaNam
            // 
            this.rdCaNam.AutoSize = true;
            this.rdCaNam.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdCaNam.Location = new System.Drawing.Point(706, 84);
            this.rdCaNam.Name = "rdCaNam";
            this.rdCaNam.Size = new System.Drawing.Size(124, 36);
            this.rdCaNam.TabIndex = 10;
            this.rdCaNam.TabStop = true;
            this.rdCaNam.Text = "Cả Năm";
            this.rdCaNam.UseVisualStyleBackColor = true;
            this.rdCaNam.CheckedChanged += new System.EventHandler(this.rdCaNam_CheckedChanged);
            // 
            // rdHK2
            // 
            this.rdHK2.AutoSize = true;
            this.rdHK2.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdHK2.Location = new System.Drawing.Point(567, 84);
            this.rdHK2.Name = "rdHK2";
            this.rdHK2.Size = new System.Drawing.Size(133, 36);
            this.rdHK2.TabIndex = 9;
            this.rdHK2.TabStop = true;
            this.rdHK2.Text = "Học Kỳ 2";
            this.rdHK2.UseVisualStyleBackColor = true;
            this.rdHK2.CheckedChanged += new System.EventHandler(this.rdHK2_CheckedChanged);
            // 
            // rdHK1
            // 
            this.rdHK1.AutoSize = true;
            this.rdHK1.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdHK1.Location = new System.Drawing.Point(428, 83);
            this.rdHK1.Name = "rdHK1";
            this.rdHK1.Size = new System.Drawing.Size(133, 36);
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
            this.btnCapNhat.Location = new System.Drawing.Point(348, 743);
            this.btnCapNhat.Name = "btnCapNhat";
            this.btnCapNhat.Size = new System.Drawing.Size(153, 48);
            this.btnCapNhat.TabIndex = 12;
            this.btnCapNhat.Text = "Cập Nhật";
            // 
            // btnTimKiem
            // 
            this.btnTimKiem.BackColor = System.Drawing.Color.White;
            this.btnTimKiem.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnTimKiem.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnTimKiem.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnTimKiem.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnTimKiem.FillColor = System.Drawing.Color.CadetBlue;
            this.btnTimKiem.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTimKiem.ForeColor = System.Drawing.Color.White;
            this.btnTimKiem.Location = new System.Drawing.Point(528, 22);
            this.btnTimKiem.Name = "btnTimKiem";
            this.btnTimKiem.Size = new System.Drawing.Size(148, 37);
            this.btnTimKiem.TabIndex = 15;
            this.btnTimKiem.Text = "Tìm kiếm";
            // 
            // txtTimKiem
            // 
            this.txtTimKiem.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtTimKiem.DefaultText = "";
            this.txtTimKiem.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtTimKiem.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtTimKiem.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtTimKiem.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtTimKiem.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtTimKiem.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTimKiem.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtTimKiem.IconLeft = global::DoAnHQTCSDL.Properties.Resources.search__3_;
            this.txtTimKiem.Location = new System.Drawing.Point(242, 22);
            this.txtTimKiem.Margin = new System.Windows.Forms.Padding(6);
            this.txtTimKiem.Name = "txtTimKiem";
            this.txtTimKiem.PasswordChar = '\0';
            this.txtTimKiem.PlaceholderText = "";
            this.txtTimKiem.SelectedText = "";
            this.txtTimKiem.Size = new System.Drawing.Size(242, 40);
            this.txtTimKiem.TabIndex = 14;
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.White;
            this.panel1.Controls.Add(this.btnTimKiem);
            this.panel1.Controls.Add(this.txtTimKiem);
            this.panel1.Location = new System.Drawing.Point(0, -8);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(932, 72);
            this.panel1.TabIndex = 13;
            // 
            // panelDiem
            // 
            this.panelDiem.Location = new System.Drawing.Point(0, 142);
            this.panelDiem.Name = "panelDiem";
            this.panelDiem.Size = new System.Drawing.Size(830, 595);
            this.panelDiem.TabIndex = 11;
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
            this.txtLop.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtLop.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtLop.Location = new System.Drawing.Point(86, 86);
            this.txtLop.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txtLop.Name = "txtLop";
            this.txtLop.PasswordChar = '\0';
            this.txtLop.PlaceholderText = "";
            this.txtLop.SelectedText = "";
            this.txtLop.Size = new System.Drawing.Size(88, 34);
            this.txtLop.TabIndex = 91;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.CadetBlue;
            this.label4.Location = new System.Drawing.Point(21, 86);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(60, 31);
            this.label4.TabIndex = 90;
            this.label4.Text = "Lớp:";
            // 
            // cbNam
            // 
            this.cbNam.BackColor = System.Drawing.Color.Transparent;
            this.cbNam.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cbNam.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbNam.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cbNam.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cbNam.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cbNam.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cbNam.ItemHeight = 30;
            this.cbNam.Items.AddRange(new object[] {
            "2023"});
            this.cbNam.Location = new System.Drawing.Point(299, 86);
            this.cbNam.Name = "cbNam";
            this.cbNam.Size = new System.Drawing.Size(97, 36);
            this.cbNam.StartIndex = 0;
            this.cbNam.TabIndex = 104;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold);
            this.label1.ForeColor = System.Drawing.Color.CadetBlue;
            this.label1.Location = new System.Drawing.Point(181, 89);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(116, 31);
            this.label1.TabIndex = 103;
            this.label1.Text = "Năm học:";
            // 
            // XemDiemHocSinh
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.cbNam);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtLop);
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
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtTimKiem;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panelDiem;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtLop;
        private System.Windows.Forms.Label label4;
        private Siticone.Desktop.UI.WinForms.SiticoneComboBox cbNam;
        private System.Windows.Forms.Label label1;
    }
}
