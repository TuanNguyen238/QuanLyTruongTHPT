namespace DoAnHQTCSDL
{
    partial class FormGiaoVien
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
            this.label2 = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.btnDangXuat = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.btnPhanHoi = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.btnXemThiDua = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.btnXemTKB = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.btnXemDiem = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.btnChinhSua = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.label1 = new System.Windows.Forms.Label();
            this.panelGiaoVien = new System.Windows.Forms.Panel();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.CadetBlue;
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.pictureBox1);
            this.panel1.Controls.Add(this.btnDangXuat);
            this.panel1.Controls.Add(this.btnPhanHoi);
            this.panel1.Controls.Add(this.btnXemThiDua);
            this.panel1.Controls.Add(this.btnXemTKB);
            this.panel1.Controls.Add(this.btnXemDiem);
            this.panel1.Controls.Add(this.btnChinhSua);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Location = new System.Drawing.Point(-18, -3);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(430, 834);
            this.panel1.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Cooper Black", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.White;
            this.label2.Location = new System.Drawing.Point(147, 35);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(197, 55);
            this.label2.TabIndex = 8;
            this.label2.Text = "Edumy";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Cursor = System.Windows.Forms.Cursors.Default;
            this.pictureBox1.Image = global::DoAnHQTCSDL.Properties.Resources.koala;
            this.pictureBox1.Location = new System.Drawing.Point(36, 23);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(105, 92);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 7;
            this.pictureBox1.TabStop = false;
            // 
            // btnDangXuat
            // 
            this.btnDangXuat.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnDangXuat.BorderColor = System.Drawing.Color.White;
            this.btnDangXuat.ButtonMode = Siticone.Desktop.UI.WinForms.Enums.ButtonMode.RadioButton;
            this.btnDangXuat.CheckedState.BorderColor = System.Drawing.Color.CadetBlue;
            this.btnDangXuat.CheckedState.CustomBorderColor = System.Drawing.Color.Black;
            this.btnDangXuat.CheckedState.FillColor = System.Drawing.Color.CadetBlue;
            this.btnDangXuat.CheckedState.ForeColor = System.Drawing.Color.Black;
            this.btnDangXuat.CheckedState.Image = global::DoAnHQTCSDL.Properties.Resources.power;
            this.btnDangXuat.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnDangXuat.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnDangXuat.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnDangXuat.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnDangXuat.FillColor = System.Drawing.Color.CadetBlue;
            this.btnDangXuat.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDangXuat.ForeColor = System.Drawing.Color.White;
            this.btnDangXuat.Image = global::DoAnHQTCSDL.Properties.Resources.power__1_;
            this.btnDangXuat.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnDangXuat.ImageOffset = new System.Drawing.Point(15, 0);
            this.btnDangXuat.ImageSize = new System.Drawing.Size(25, 25);
            this.btnDangXuat.Location = new System.Drawing.Point(-2, 763);
            this.btnDangXuat.Name = "btnDangXuat";
            this.btnDangXuat.Size = new System.Drawing.Size(416, 71);
            this.btnDangXuat.TabIndex = 5;
            this.btnDangXuat.Text = "Đăng xuất";
            this.btnDangXuat.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnDangXuat.TextOffset = new System.Drawing.Point(15, 0);
            this.btnDangXuat.Click += new System.EventHandler(this.btnDangXuat_Click);
            // 
            // btnPhanHoi
            // 
            this.btnPhanHoi.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnPhanHoi.BorderColor = System.Drawing.Color.White;
            this.btnPhanHoi.ButtonMode = Siticone.Desktop.UI.WinForms.Enums.ButtonMode.RadioButton;
            this.btnPhanHoi.CheckedState.BorderColor = System.Drawing.Color.Chartreuse;
            this.btnPhanHoi.CheckedState.CustomBorderColor = System.Drawing.Color.White;
            this.btnPhanHoi.CheckedState.FillColor = System.Drawing.Color.White;
            this.btnPhanHoi.CheckedState.ForeColor = System.Drawing.Color.Teal;
            this.btnPhanHoi.CheckedState.Image = global::DoAnHQTCSDL.Properties.Resources.megaphone__1_;
            this.btnPhanHoi.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnPhanHoi.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnPhanHoi.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnPhanHoi.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnPhanHoi.FillColor = System.Drawing.Color.CadetBlue;
            this.btnPhanHoi.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnPhanHoi.ForeColor = System.Drawing.Color.White;
            this.btnPhanHoi.Image = global::DoAnHQTCSDL.Properties.Resources.megaphone;
            this.btnPhanHoi.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnPhanHoi.ImageOffset = new System.Drawing.Point(15, 0);
            this.btnPhanHoi.ImageSize = new System.Drawing.Size(25, 25);
            this.btnPhanHoi.Location = new System.Drawing.Point(-2, 405);
            this.btnPhanHoi.Name = "btnPhanHoi";
            this.btnPhanHoi.Size = new System.Drawing.Size(430, 58);
            this.btnPhanHoi.TabIndex = 4;
            this.btnPhanHoi.Text = "Phản hồi";
            this.btnPhanHoi.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnPhanHoi.TextOffset = new System.Drawing.Point(15, 0);
            this.btnPhanHoi.Click += new System.EventHandler(this.btnPhanHoi_Click);
            // 
            // btnXemThiDua
            // 
            this.btnXemThiDua.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnXemThiDua.BorderColor = System.Drawing.Color.White;
            this.btnXemThiDua.ButtonMode = Siticone.Desktop.UI.WinForms.Enums.ButtonMode.RadioButton;
            this.btnXemThiDua.CheckedState.BorderColor = System.Drawing.Color.Chartreuse;
            this.btnXemThiDua.CheckedState.CustomBorderColor = System.Drawing.Color.White;
            this.btnXemThiDua.CheckedState.FillColor = System.Drawing.Color.White;
            this.btnXemThiDua.CheckedState.ForeColor = System.Drawing.Color.Teal;
            this.btnXemThiDua.CheckedState.Image = global::DoAnHQTCSDL.Properties.Resources.search__2_;
            this.btnXemThiDua.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnXemThiDua.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnXemThiDua.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnXemThiDua.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnXemThiDua.FillColor = System.Drawing.Color.CadetBlue;
            this.btnXemThiDua.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXemThiDua.ForeColor = System.Drawing.Color.White;
            this.btnXemThiDua.Image = global::DoAnHQTCSDL.Properties.Resources.search__1_;
            this.btnXemThiDua.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnXemThiDua.ImageOffset = new System.Drawing.Point(15, 0);
            this.btnXemThiDua.ImageSize = new System.Drawing.Size(25, 25);
            this.btnXemThiDua.Location = new System.Drawing.Point(-2, 341);
            this.btnXemThiDua.Name = "btnXemThiDua";
            this.btnXemThiDua.Size = new System.Drawing.Size(430, 58);
            this.btnXemThiDua.TabIndex = 2;
            this.btnXemThiDua.Text = "Xem thi đua";
            this.btnXemThiDua.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnXemThiDua.TextOffset = new System.Drawing.Point(15, 0);
            this.btnXemThiDua.Click += new System.EventHandler(this.btnXemThiDua_Click);
            // 
            // btnXemTKB
            // 
            this.btnXemTKB.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnXemTKB.BorderColor = System.Drawing.Color.White;
            this.btnXemTKB.ButtonMode = Siticone.Desktop.UI.WinForms.Enums.ButtonMode.RadioButton;
            this.btnXemTKB.CheckedState.BorderColor = System.Drawing.Color.Chartreuse;
            this.btnXemTKB.CheckedState.CustomBorderColor = System.Drawing.Color.White;
            this.btnXemTKB.CheckedState.FillColor = System.Drawing.Color.White;
            this.btnXemTKB.CheckedState.ForeColor = System.Drawing.Color.Teal;
            this.btnXemTKB.CheckedState.Image = global::DoAnHQTCSDL.Properties.Resources.calendar__1_;
            this.btnXemTKB.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnXemTKB.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnXemTKB.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnXemTKB.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnXemTKB.FillColor = System.Drawing.Color.CadetBlue;
            this.btnXemTKB.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXemTKB.ForeColor = System.Drawing.Color.White;
            this.btnXemTKB.Image = global::DoAnHQTCSDL.Properties.Resources.calendar;
            this.btnXemTKB.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnXemTKB.ImageOffset = new System.Drawing.Point(15, 0);
            this.btnXemTKB.ImageSize = new System.Drawing.Size(25, 25);
            this.btnXemTKB.Location = new System.Drawing.Point(-2, 277);
            this.btnXemTKB.Name = "btnXemTKB";
            this.btnXemTKB.Size = new System.Drawing.Size(430, 58);
            this.btnXemTKB.TabIndex = 3;
            this.btnXemTKB.Text = "Xem thời khóa biểu";
            this.btnXemTKB.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnXemTKB.TextOffset = new System.Drawing.Point(15, 0);
            this.btnXemTKB.Click += new System.EventHandler(this.btnXemTKB_Click);
            // 
            // btnXemDiem
            // 
            this.btnXemDiem.ButtonMode = Siticone.Desktop.UI.WinForms.Enums.ButtonMode.RadioButton;
            this.btnXemDiem.CheckedState.BorderColor = System.Drawing.Color.CadetBlue;
            this.btnXemDiem.CheckedState.CustomBorderColor = System.Drawing.Color.White;
            this.btnXemDiem.CheckedState.FillColor = System.Drawing.Color.White;
            this.btnXemDiem.CheckedState.ForeColor = System.Drawing.Color.Teal;
            this.btnXemDiem.CheckedState.Image = global::DoAnHQTCSDL.Properties.Resources.edit1;
            this.btnXemDiem.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnXemDiem.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnXemDiem.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnXemDiem.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnXemDiem.FillColor = System.Drawing.Color.CadetBlue;
            this.btnXemDiem.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXemDiem.ForeColor = System.Drawing.Color.White;
            this.btnXemDiem.Image = global::DoAnHQTCSDL.Properties.Resources.edit__1_;
            this.btnXemDiem.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnXemDiem.ImageOffset = new System.Drawing.Point(15, 0);
            this.btnXemDiem.ImageSize = new System.Drawing.Size(25, 25);
            this.btnXemDiem.Location = new System.Drawing.Point(-2, 211);
            this.btnXemDiem.Name = "btnXemDiem";
            this.btnXemDiem.Size = new System.Drawing.Size(430, 62);
            this.btnXemDiem.TabIndex = 2;
            this.btnXemDiem.Text = "Xem điểm học sinh";
            this.btnXemDiem.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnXemDiem.TextOffset = new System.Drawing.Point(15, 0);
            this.btnXemDiem.Click += new System.EventHandler(this.btnXemDiem_Click);
            // 
            // btnChinhSua
            // 
            this.btnChinhSua.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnChinhSua.BorderColor = System.Drawing.Color.White;
            this.btnChinhSua.ButtonMode = Siticone.Desktop.UI.WinForms.Enums.ButtonMode.RadioButton;
            this.btnChinhSua.CheckedState.BorderColor = System.Drawing.Color.Chartreuse;
            this.btnChinhSua.CheckedState.CustomBorderColor = System.Drawing.Color.White;
            this.btnChinhSua.CheckedState.FillColor = System.Drawing.Color.White;
            this.btnChinhSua.CheckedState.ForeColor = System.Drawing.Color.Teal;
            this.btnChinhSua.CheckedState.Image = global::DoAnHQTCSDL.Properties.Resources.search__2_;
            this.btnChinhSua.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnChinhSua.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnChinhSua.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnChinhSua.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnChinhSua.FillColor = System.Drawing.Color.CadetBlue;
            this.btnChinhSua.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnChinhSua.ForeColor = System.Drawing.Color.White;
            this.btnChinhSua.Image = global::DoAnHQTCSDL.Properties.Resources.search__1_;
            this.btnChinhSua.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnChinhSua.ImageOffset = new System.Drawing.Point(15, 0);
            this.btnChinhSua.ImageSize = new System.Drawing.Size(25, 25);
            this.btnChinhSua.Location = new System.Drawing.Point(-2, 147);
            this.btnChinhSua.Name = "btnChinhSua";
            this.btnChinhSua.Size = new System.Drawing.Size(430, 58);
            this.btnChinhSua.TabIndex = 1;
            this.btnChinhSua.Text = "Chỉnh sửa thông tin học sinh";
            this.btnChinhSua.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnChinhSua.TextOffset = new System.Drawing.Point(15, 0);
            this.btnChinhSua.Click += new System.EventHandler(this.btnChinhSua_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 20F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(114, 23);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(0, 54);
            this.label1.TabIndex = 0;
            // 
            // panelGiaoVien
            // 
            this.panelGiaoVien.Location = new System.Drawing.Point(403, -3);
            this.panelGiaoVien.Name = "panelGiaoVien";
            this.panelGiaoVien.Size = new System.Drawing.Size(847, 835);
            this.panelGiaoVien.TabIndex = 5;
            // 
            // FormGiaoVien
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1250, 831);
            this.Controls.Add(this.panelGiaoVien);
            this.Controls.Add(this.panel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "FormGiaoVien";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FormGiaoVien";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnXemDiem;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnChinhSua;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panelGiaoVien;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnXemTKB;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnXemThiDua;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnPhanHoi;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnDangXuat;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label2;
    }
}