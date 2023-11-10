namespace DoAnHQTCSDL.UserControls.Admin
{
    partial class XemDiemHS
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
            this.panelDiem = new System.Windows.Forms.Panel();
            this.rdCaNam = new System.Windows.Forms.RadioButton();
            this.rdHK2 = new System.Windows.Forms.RadioButton();
            this.rdHK1 = new System.Windows.Forms.RadioButton();
            this.btnTimKiem = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.txtTimKiem = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.cbNam = new Siticone.Desktop.UI.WinForms.SiticoneComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // panelDiem
            // 
            this.panelDiem.BackColor = System.Drawing.Color.White;
            this.panelDiem.Location = new System.Drawing.Point(0, 153);
            this.panelDiem.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.panelDiem.Name = "panelDiem";
            this.panelDiem.Size = new System.Drawing.Size(747, 452);
            this.panelDiem.TabIndex = 11;
            // 
            // rdCaNam
            // 
            this.rdCaNam.AutoSize = true;
            this.rdCaNam.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdCaNam.Location = new System.Drawing.Point(625, 96);
            this.rdCaNam.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.rdCaNam.Name = "rdCaNam";
            this.rdCaNam.Size = new System.Drawing.Size(102, 32);
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
            this.rdHK2.Location = new System.Drawing.Point(466, 96);
            this.rdHK2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.rdHK2.Name = "rdHK2";
            this.rdHK2.Size = new System.Drawing.Size(110, 32);
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
            this.rdHK1.Location = new System.Drawing.Point(304, 96);
            this.rdHK1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.rdHK1.Name = "rdHK1";
            this.rdHK1.Size = new System.Drawing.Size(110, 32);
            this.rdHK1.TabIndex = 8;
            this.rdHK1.TabStop = true;
            this.rdHK1.Text = "Học Kỳ 1";
            this.rdHK1.UseVisualStyleBackColor = true;
            this.rdHK1.CheckedChanged += new System.EventHandler(this.rdHK1_CheckedChanged);
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
            this.btnTimKiem.Location = new System.Drawing.Point(435, 39);
            this.btnTimKiem.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnTimKiem.Name = "btnTimKiem";
            this.btnTimKiem.Size = new System.Drawing.Size(132, 30);
            this.btnTimKiem.TabIndex = 67;
            this.btnTimKiem.Text = "Tìm kiếm";
            this.btnTimKiem.Click += new System.EventHandler(this.btnTimKiem_Click);
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
            this.txtTimKiem.Location = new System.Drawing.Point(168, 37);
            this.txtTimKiem.Margin = new System.Windows.Forms.Padding(5);
            this.txtTimKiem.Name = "txtTimKiem";
            this.txtTimKiem.PasswordChar = '\0';
            this.txtTimKiem.PlaceholderText = "";
            this.txtTimKiem.SelectedText = "";
            this.txtTimKiem.Size = new System.Drawing.Size(215, 32);
            this.txtTimKiem.TabIndex = 66;
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
            this.cbNam.Location = new System.Drawing.Point(148, 96);
            this.cbNam.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cbNam.Name = "cbNam";
            this.cbNam.Size = new System.Drawing.Size(110, 36);
            this.cbNam.TabIndex = 102;
            this.cbNam.SelectedIndexChanged += new System.EventHandler(this.cbNam_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.CadetBlue;
            this.label2.Location = new System.Drawing.Point(20, 96);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(102, 28);
            this.label2.TabIndex = 101;
            this.label2.Text = "Năm học:";
            // 
            // XemDiemHS
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.cbNam);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnTimKiem);
            this.Controls.Add(this.txtTimKiem);
            this.Controls.Add(this.panelDiem);
            this.Controls.Add(this.rdCaNam);
            this.Controls.Add(this.rdHK2);
            this.Controls.Add(this.rdHK1);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "XemDiemHS";
            this.Size = new System.Drawing.Size(749, 658);
            this.Load += new System.EventHandler(this.XemDiemHS_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panelDiem;
        private System.Windows.Forms.RadioButton rdCaNam;
        private System.Windows.Forms.RadioButton rdHK2;
        private System.Windows.Forms.RadioButton rdHK1;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnTimKiem;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtTimKiem;
        private Siticone.Desktop.UI.WinForms.SiticoneComboBox cbNam;
        private System.Windows.Forms.Label label2;
    }
}
