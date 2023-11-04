namespace DoAnHQTCSDL
{
    partial class FormTuyenSinh
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
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnDangKy = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.btnCapNhat = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.panelTuyenSinh = new System.Windows.Forms.Panel();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.CadetBlue;
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.pictureBox1);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.btnDangKy);
            this.panel1.Controls.Add(this.btnCapNhat);
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(303, 788);
            this.panel1.TabIndex = 3;
            // 
            // btnDangKy
            // 
            this.btnDangKy.ButtonMode = Siticone.Desktop.UI.WinForms.Enums.ButtonMode.RadioButton;
            this.btnDangKy.CheckedState.BorderColor = System.Drawing.Color.CadetBlue;
            this.btnDangKy.CheckedState.CustomBorderColor = System.Drawing.Color.White;
            this.btnDangKy.CheckedState.FillColor = System.Drawing.Color.White;
            this.btnDangKy.CheckedState.ForeColor = System.Drawing.Color.Teal;
            this.btnDangKy.CheckedState.Image = global::DoAnHQTCSDL.Properties.Resources.edit1;
            this.btnDangKy.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnDangKy.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnDangKy.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnDangKy.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnDangKy.FillColor = System.Drawing.Color.CadetBlue;
            this.btnDangKy.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDangKy.ForeColor = System.Drawing.Color.White;
            this.btnDangKy.Image = global::DoAnHQTCSDL.Properties.Resources.edit__1_;
            this.btnDangKy.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnDangKy.ImageOffset = new System.Drawing.Point(15, 0);
            this.btnDangKy.ImageSize = new System.Drawing.Size(25, 25);
            this.btnDangKy.Location = new System.Drawing.Point(-13, 218);
            this.btnDangKy.Name = "btnDangKy";
            this.btnDangKy.Size = new System.Drawing.Size(315, 61);
            this.btnDangKy.TabIndex = 2;
            this.btnDangKy.Text = "Đăng ký tuyển sinh";
            this.btnDangKy.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnDangKy.TextOffset = new System.Drawing.Point(15, 0);
            this.btnDangKy.Click += new System.EventHandler(this.btnDangKy_Click);
            // 
            // btnCapNhat
            // 
            this.btnCapNhat.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnCapNhat.BorderColor = System.Drawing.Color.White;
            this.btnCapNhat.ButtonMode = Siticone.Desktop.UI.WinForms.Enums.ButtonMode.RadioButton;
            this.btnCapNhat.CheckedState.BorderColor = System.Drawing.Color.Chartreuse;
            this.btnCapNhat.CheckedState.CustomBorderColor = System.Drawing.Color.White;
            this.btnCapNhat.CheckedState.FillColor = System.Drawing.Color.White;
            this.btnCapNhat.CheckedState.ForeColor = System.Drawing.Color.Teal;
            this.btnCapNhat.CheckedState.Image = global::DoAnHQTCSDL.Properties.Resources.search__2_;
            this.btnCapNhat.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnCapNhat.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnCapNhat.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnCapNhat.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnCapNhat.FillColor = System.Drawing.Color.CadetBlue;
            this.btnCapNhat.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCapNhat.ForeColor = System.Drawing.Color.White;
            this.btnCapNhat.Image = global::DoAnHQTCSDL.Properties.Resources.search__1_;
            this.btnCapNhat.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnCapNhat.ImageOffset = new System.Drawing.Point(15, 0);
            this.btnCapNhat.ImageSize = new System.Drawing.Size(25, 25);
            this.btnCapNhat.Location = new System.Drawing.Point(-13, 154);
            this.btnCapNhat.Name = "btnCapNhat";
            this.btnCapNhat.Size = new System.Drawing.Size(315, 58);
            this.btnCapNhat.TabIndex = 1;
            this.btnCapNhat.Text = "Cập nhật thông tin";
            this.btnCapNhat.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnCapNhat.TextOffset = new System.Drawing.Point(15, 0);
            this.btnCapNhat.Click += new System.EventHandler(this.btnCapNhat_Click);
            // 
            // panelTuyenSinh
            // 
            this.panelTuyenSinh.Location = new System.Drawing.Point(301, -8);
            this.panelTuyenSinh.Name = "panelTuyenSinh";
            this.panelTuyenSinh.Size = new System.Drawing.Size(927, 792);
            this.panelTuyenSinh.TabIndex = 4;
            // 
            // pictureBox1
            // 
            this.pictureBox1.Cursor = System.Windows.Forms.Cursors.Default;
            this.pictureBox1.Image = global::DoAnHQTCSDL.Properties.Resources.koala;
            this.pictureBox1.Location = new System.Drawing.Point(5, 21);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(78, 67);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 10;
            this.pictureBox1.TabStop = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Cooper Black", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(83, 33);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(197, 55);
            this.label1.TabIndex = 9;
            this.label1.Text = "Edumy";
            // 
            // FormTuyenSinh
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1191, 753);
            this.Controls.Add(this.panelTuyenSinh);
            this.Controls.Add(this.panel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "FormTuyenSinh";
            this.Text = "FormTuyenSinh";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnDangKy;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnCapNhat;
        private System.Windows.Forms.Panel panelTuyenSinh;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label1;
    }
}