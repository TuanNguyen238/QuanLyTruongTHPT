namespace DoAnHQTCSDL.UserControls
{
    partial class XemDiem
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
            this.panelDiem = new System.Windows.Forms.Panel();
            this.txtLop = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cbNam = new Siticone.Desktop.UI.WinForms.SiticoneComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // rdCaNam
            // 
            this.rdCaNam.AutoSize = true;
            this.rdCaNam.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdCaNam.Location = new System.Drawing.Point(811, 26);
            this.rdCaNam.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.rdCaNam.Name = "rdCaNam";
            this.rdCaNam.Size = new System.Drawing.Size(102, 32);
            this.rdCaNam.TabIndex = 6;
            this.rdCaNam.TabStop = true;
            this.rdCaNam.Text = "Cả Năm";
            this.rdCaNam.UseVisualStyleBackColor = true;
            this.rdCaNam.CheckedChanged += new System.EventHandler(this.rdCaNam_CheckedChanged);
            // 
            // rdHK2
            // 
            this.rdHK2.AutoSize = true;
            this.rdHK2.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdHK2.Location = new System.Drawing.Point(649, 26);
            this.rdHK2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.rdHK2.Name = "rdHK2";
            this.rdHK2.Size = new System.Drawing.Size(110, 32);
            this.rdHK2.TabIndex = 5;
            this.rdHK2.TabStop = true;
            this.rdHK2.Text = "Học Kỳ 2";
            this.rdHK2.UseVisualStyleBackColor = true;
            this.rdHK2.CheckedChanged += new System.EventHandler(this.rdHK2_CheckedChanged);
            // 
            // rdHK1
            // 
            this.rdHK1.AutoSize = true;
            this.rdHK1.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdHK1.Location = new System.Drawing.Point(475, 26);
            this.rdHK1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.rdHK1.Name = "rdHK1";
            this.rdHK1.Size = new System.Drawing.Size(110, 32);
            this.rdHK1.TabIndex = 4;
            this.rdHK1.TabStop = true;
            this.rdHK1.Text = "Học Kỳ 1";
            this.rdHK1.UseVisualStyleBackColor = true;
            this.rdHK1.CheckedChanged += new System.EventHandler(this.rdHK1_CheckedChanged);
            // 
            // panelDiem
            // 
            this.panelDiem.Location = new System.Drawing.Point(37, 80);
            this.panelDiem.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.panelDiem.Name = "panelDiem";
            this.panelDiem.Size = new System.Drawing.Size(884, 553);
            this.panelDiem.TabIndex = 7;
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
            this.txtLop.Location = new System.Drawing.Point(126, 26);
            this.txtLop.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtLop.Name = "txtLop";
            this.txtLop.PasswordChar = '\0';
            this.txtLop.PlaceholderText = "";
            this.txtLop.SelectedText = "";
            this.txtLop.Size = new System.Drawing.Size(89, 30);
            this.txtLop.TabIndex = 98;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.CadetBlue;
            this.label4.Location = new System.Drawing.Point(66, 27);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(52, 28);
            this.label4.TabIndex = 97;
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
            this.cbNam.Location = new System.Drawing.Point(344, 22);
            this.cbNam.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cbNam.Name = "cbNam";
            this.cbNam.Size = new System.Drawing.Size(103, 36);
            this.cbNam.StartIndex = 0;
            this.cbNam.TabIndex = 102;
            this.cbNam.SelectedIndexChanged += new System.EventHandler(this.cbNam_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.CadetBlue;
            this.label2.Location = new System.Drawing.Point(236, 27);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(102, 28);
            this.label2.TabIndex = 101;
            this.label2.Text = "Năm học:";
            // 
            // XemDiem
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.cbNam);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtLop);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.panelDiem);
            this.Controls.Add(this.rdCaNam);
            this.Controls.Add(this.rdHK2);
            this.Controls.Add(this.rdHK1);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "XemDiem";
            this.Size = new System.Drawing.Size(962, 677);
            this.Load += new System.EventHandler(this.XemDiem_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.RadioButton rdCaNam;
        private System.Windows.Forms.RadioButton rdHK2;
        private System.Windows.Forms.RadioButton rdHK1;
        private System.Windows.Forms.Panel panelDiem;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtLop;
        private System.Windows.Forms.Label label4;
        private Siticone.Desktop.UI.WinForms.SiticoneComboBox cbNam;
        private System.Windows.Forms.Label label2;
    }
}
