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
            this.siticoneTextBox3 = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // rdCaNam
            // 
            this.rdCaNam.AutoSize = true;
            this.rdCaNam.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdCaNam.Location = new System.Drawing.Point(730, 33);
            this.rdCaNam.Name = "rdCaNam";
            this.rdCaNam.Size = new System.Drawing.Size(106, 32);
            this.rdCaNam.TabIndex = 6;
            this.rdCaNam.TabStop = true;
            this.rdCaNam.Text = "Cả Năm";
            this.rdCaNam.UseVisualStyleBackColor = true;
            this.rdCaNam.CheckedChanged += new System.EventHandler(this.rdCaNam_CheckedChanged);
            // 
            // rdHK2
            // 
            this.rdHK2.AutoSize = true;
            this.rdHK2.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdHK2.Location = new System.Drawing.Point(547, 33);
            this.rdHK2.Name = "rdHK2";
            this.rdHK2.Size = new System.Drawing.Size(114, 32);
            this.rdHK2.TabIndex = 5;
            this.rdHK2.TabStop = true;
            this.rdHK2.Text = "Học Kỳ 2";
            this.rdHK2.UseVisualStyleBackColor = true;
            this.rdHK2.CheckedChanged += new System.EventHandler(this.rdHK2_CheckedChanged);
            // 
            // rdHK1
            // 
            this.rdHK1.AutoSize = true;
            this.rdHK1.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdHK1.Location = new System.Drawing.Point(353, 33);
            this.rdHK1.Name = "rdHK1";
            this.rdHK1.Size = new System.Drawing.Size(114, 32);
            this.rdHK1.TabIndex = 4;
            this.rdHK1.TabStop = true;
            this.rdHK1.Text = "Học Kỳ 1";
            this.rdHK1.UseVisualStyleBackColor = true;
            this.rdHK1.CheckedChanged += new System.EventHandler(this.rdHK1_CheckedChanged);
            // 
            // panelDiem
            // 
            this.panelDiem.Location = new System.Drawing.Point(42, 100);
            this.panelDiem.Name = "panelDiem";
            this.panelDiem.Size = new System.Drawing.Size(1023, 601);
            this.panelDiem.TabIndex = 7;
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
            this.siticoneTextBox3.Location = new System.Drawing.Point(143, 33);
            this.siticoneTextBox3.Name = "siticoneTextBox3";
            this.siticoneTextBox3.PasswordChar = '\0';
            this.siticoneTextBox3.PlaceholderText = "";
            this.siticoneTextBox3.SelectedText = "";
            this.siticoneTextBox3.Size = new System.Drawing.Size(100, 37);
            this.siticoneTextBox3.TabIndex = 98;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.CadetBlue;
            this.label4.Location = new System.Drawing.Point(74, 38);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(63, 32);
            this.label4.TabIndex = 97;
            this.label4.Text = "Lớp:";
            // 
            // XemDiem
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.siticoneTextBox3);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.panelDiem);
            this.Controls.Add(this.rdCaNam);
            this.Controls.Add(this.rdHK2);
            this.Controls.Add(this.rdHK1);
            this.Name = "XemDiem";
            this.Size = new System.Drawing.Size(1110, 758);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.RadioButton rdCaNam;
        private System.Windows.Forms.RadioButton rdHK2;
        private System.Windows.Forms.RadioButton rdHK1;
        private System.Windows.Forms.Panel panelDiem;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox siticoneTextBox3;
        private System.Windows.Forms.Label label4;
    }
}
