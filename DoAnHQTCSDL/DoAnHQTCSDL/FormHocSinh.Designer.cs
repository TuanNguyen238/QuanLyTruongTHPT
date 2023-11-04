namespace DoAnHQTCSDL
{
    partial class FormHocSinh
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
            this.btnPhanHoi = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.btnDangXuat = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.btnXemDiem = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.btnThoiKhoaBieu = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.btnXemThongTin = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.label1 = new System.Windows.Forms.Label();
            this.panelHocSinh = new System.Windows.Forms.Panel();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.CadetBlue;
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.btnPhanHoi);
            this.panel1.Controls.Add(this.btnDangXuat);
            this.panel1.Controls.Add(this.btnXemDiem);
            this.panel1.Controls.Add(this.btnThoiKhoaBieu);
            this.panel1.Controls.Add(this.btnXemThongTin);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Location = new System.Drawing.Point(-5, -1);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(303, 788);
            this.panel1.TabIndex = 2;
            // 
            // btnPhanHoi
            // 
            this.btnPhanHoi.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnPhanHoi.BorderColor = System.Drawing.Color.White;
            this.btnPhanHoi.ButtonMode = Siticone.Desktop.UI.WinForms.Enums.ButtonMode.RadioButton;
            this.btnPhanHoi.CheckedState.BorderColor = System.Drawing.Color.CadetBlue;
            this.btnPhanHoi.CheckedState.CustomBorderColor = System.Drawing.Color.White;
            this.btnPhanHoi.CheckedState.FillColor = System.Drawing.Color.White;
            this.btnPhanHoi.CheckedState.ForeColor = System.Drawing.Color.Teal;
            this.btnPhanHoi.CheckedState.Image = global::DoAnHQTCSDL.Properties.Resources.megaphone__1_;
            this.btnPhanHoi.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnPhanHoi.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnPhanHoi.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnPhanHoi.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnPhanHoi.FillColor = System.Drawing.Color.CadetBlue;
            this.btnPhanHoi.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnPhanHoi.ForeColor = System.Drawing.Color.White;
            this.btnPhanHoi.Image = global::DoAnHQTCSDL.Properties.Resources.megaphone;
            this.btnPhanHoi.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnPhanHoi.ImageOffset = new System.Drawing.Point(15, 0);
            this.btnPhanHoi.ImageSize = new System.Drawing.Size(25, 25);
            this.btnPhanHoi.Location = new System.Drawing.Point(-1, 330);
            this.btnPhanHoi.Name = "btnPhanHoi";
            this.btnPhanHoi.Size = new System.Drawing.Size(313, 53);
            this.btnPhanHoi.TabIndex = 5;
            this.btnPhanHoi.Text = "Phản Hồi";
            this.btnPhanHoi.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnPhanHoi.TextOffset = new System.Drawing.Point(15, 0);
            this.btnPhanHoi.Click += new System.EventHandler(this.btnPhanHoi_Click);
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
            this.btnDangXuat.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDangXuat.ForeColor = System.Drawing.Color.White;
            this.btnDangXuat.Image = global::DoAnHQTCSDL.Properties.Resources.power__1_;
            this.btnDangXuat.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnDangXuat.ImageOffset = new System.Drawing.Point(15, 0);
            this.btnDangXuat.ImageSize = new System.Drawing.Size(25, 25);
            this.btnDangXuat.Location = new System.Drawing.Point(2, 670);
            this.btnDangXuat.Name = "btnDangXuat";
            this.btnDangXuat.Size = new System.Drawing.Size(340, 69);
            this.btnDangXuat.TabIndex = 4;
            this.btnDangXuat.Text = "Đăng xuất";
            this.btnDangXuat.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnDangXuat.TextOffset = new System.Drawing.Point(15, 0);
            this.btnDangXuat.Click += new System.EventHandler(this.btnDangXuat_Click);
            // 
            // btnXemDiem
            // 
            this.btnXemDiem.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnXemDiem.BorderColor = System.Drawing.Color.White;
            this.btnXemDiem.ButtonMode = Siticone.Desktop.UI.WinForms.Enums.ButtonMode.RadioButton;
            this.btnXemDiem.CheckedState.BorderColor = System.Drawing.Color.CadetBlue;
            this.btnXemDiem.CheckedState.CustomBorderColor = System.Drawing.Color.White;
            this.btnXemDiem.CheckedState.FillColor = System.Drawing.Color.White;
            this.btnXemDiem.CheckedState.ForeColor = System.Drawing.Color.Teal;
            this.btnXemDiem.CheckedState.Image = global::DoAnHQTCSDL.Properties.Resources.score__1_;
            this.btnXemDiem.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnXemDiem.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnXemDiem.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnXemDiem.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnXemDiem.FillColor = System.Drawing.Color.CadetBlue;
            this.btnXemDiem.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXemDiem.ForeColor = System.Drawing.Color.White;
            this.btnXemDiem.Image = global::DoAnHQTCSDL.Properties.Resources.score;
            this.btnXemDiem.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnXemDiem.ImageOffset = new System.Drawing.Point(15, 0);
            this.btnXemDiem.ImageSize = new System.Drawing.Size(25, 25);
            this.btnXemDiem.Location = new System.Drawing.Point(-1, 271);
            this.btnXemDiem.Name = "btnXemDiem";
            this.btnXemDiem.Size = new System.Drawing.Size(299, 53);
            this.btnXemDiem.TabIndex = 3;
            this.btnXemDiem.Text = "Xem điểm";
            this.btnXemDiem.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnXemDiem.TextOffset = new System.Drawing.Point(15, 0);
            this.btnXemDiem.Click += new System.EventHandler(this.btnXemDiem_Click);
            // 
            // btnThoiKhoaBieu
            // 
            this.btnThoiKhoaBieu.ButtonMode = Siticone.Desktop.UI.WinForms.Enums.ButtonMode.RadioButton;
            this.btnThoiKhoaBieu.CheckedState.BorderColor = System.Drawing.Color.CadetBlue;
            this.btnThoiKhoaBieu.CheckedState.CustomBorderColor = System.Drawing.Color.White;
            this.btnThoiKhoaBieu.CheckedState.FillColor = System.Drawing.Color.White;
            this.btnThoiKhoaBieu.CheckedState.ForeColor = System.Drawing.Color.Teal;
            this.btnThoiKhoaBieu.CheckedState.Image = global::DoAnHQTCSDL.Properties.Resources.calendar__4_;
            this.btnThoiKhoaBieu.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThoiKhoaBieu.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThoiKhoaBieu.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThoiKhoaBieu.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThoiKhoaBieu.FillColor = System.Drawing.Color.CadetBlue;
            this.btnThoiKhoaBieu.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThoiKhoaBieu.ForeColor = System.Drawing.Color.White;
            this.btnThoiKhoaBieu.Image = global::DoAnHQTCSDL.Properties.Resources.calendar__3_;
            this.btnThoiKhoaBieu.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnThoiKhoaBieu.ImageOffset = new System.Drawing.Point(15, 0);
            this.btnThoiKhoaBieu.ImageSize = new System.Drawing.Size(25, 25);
            this.btnThoiKhoaBieu.Location = new System.Drawing.Point(-1, 212);
            this.btnThoiKhoaBieu.Name = "btnThoiKhoaBieu";
            this.btnThoiKhoaBieu.Size = new System.Drawing.Size(343, 53);
            this.btnThoiKhoaBieu.TabIndex = 2;
            this.btnThoiKhoaBieu.Text = "Thời khóa biểu";
            this.btnThoiKhoaBieu.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnThoiKhoaBieu.TextOffset = new System.Drawing.Point(15, 0);
            this.btnThoiKhoaBieu.Click += new System.EventHandler(this.btnThoiKhoaBieu_Click);
            // 
            // btnXemThongTin
            // 
            this.btnXemThongTin.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnXemThongTin.BorderColor = System.Drawing.Color.White;
            this.btnXemThongTin.ButtonMode = Siticone.Desktop.UI.WinForms.Enums.ButtonMode.RadioButton;
            this.btnXemThongTin.CheckedState.BorderColor = System.Drawing.Color.CadetBlue;
            this.btnXemThongTin.CheckedState.CustomBorderColor = System.Drawing.Color.White;
            this.btnXemThongTin.CheckedState.FillColor = System.Drawing.Color.White;
            this.btnXemThongTin.CheckedState.ForeColor = System.Drawing.Color.Teal;
            this.btnXemThongTin.CheckedState.Image = global::DoAnHQTCSDL.Properties.Resources.information__1_;
            this.btnXemThongTin.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnXemThongTin.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnXemThongTin.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnXemThongTin.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnXemThongTin.DisabledState.Image = global::DoAnHQTCSDL.Properties.Resources.information_button__1_;
            this.btnXemThongTin.FillColor = System.Drawing.Color.CadetBlue;
            this.btnXemThongTin.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXemThongTin.ForeColor = System.Drawing.Color.White;
            this.btnXemThongTin.Image = global::DoAnHQTCSDL.Properties.Resources.information;
            this.btnXemThongTin.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnXemThongTin.ImageOffset = new System.Drawing.Point(15, 0);
            this.btnXemThongTin.ImageSize = new System.Drawing.Size(25, 25);
            this.btnXemThongTin.Location = new System.Drawing.Point(-1, 143);
            this.btnXemThongTin.Name = "btnXemThongTin";
            this.btnXemThongTin.Size = new System.Drawing.Size(322, 53);
            this.btnXemThongTin.TabIndex = 1;
            this.btnXemThongTin.Text = "Xem thông tin";
            this.btnXemThongTin.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnXemThongTin.TextOffset = new System.Drawing.Point(15, 0);
            this.btnXemThongTin.Click += new System.EventHandler(this.btnXemThongTin_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(66, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(179, 55);
            this.label1.TabIndex = 0;
            this.label1.Text = "Edumy";
            // 
            // panelHocSinh
            // 
            this.panelHocSinh.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.panelHocSinh.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panelHocSinh.Location = new System.Drawing.Point(293, -1);
            this.panelHocSinh.Name = "panelHocSinh";
            this.panelHocSinh.Size = new System.Drawing.Size(1110, 769);
            this.panelHocSinh.TabIndex = 3;
            // 
            // FormHocSinh
            // 
            this.ClientSize = new System.Drawing.Size(1300, 740);
            this.Controls.Add(this.panelHocSinh);
            this.Controls.Add(this.panel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "FormHocSinh";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnXemThongTin;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnThoiKhoaBieu;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnXemDiem;
        private System.Windows.Forms.Panel panelHocSinh;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnDangXuat;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnPhanHoi;
    }
}