namespace DoAnHQTCSDL.UserControls.HocSinh
{
    partial class PhanHoi
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
            this.btnHuy = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.btnGui = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.txtPhanHoi = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.cbMGV = new Siticone.Desktop.UI.WinForms.SiticoneComboBox();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnHuy
            // 
            this.btnHuy.BorderColor = System.Drawing.Color.CadetBlue;
            this.btnHuy.BorderRadius = 5;
            this.btnHuy.BorderThickness = 3;
            this.btnHuy.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnHuy.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnHuy.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnHuy.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnHuy.FillColor = System.Drawing.Color.White;
            this.btnHuy.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnHuy.ForeColor = System.Drawing.Color.CadetBlue;
            this.btnHuy.Location = new System.Drawing.Point(663, 581);
            this.btnHuy.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnHuy.Name = "btnHuy";
            this.btnHuy.Size = new System.Drawing.Size(110, 48);
            this.btnHuy.TabIndex = 8;
            this.btnHuy.Text = "Hủy";
            this.btnHuy.Click += new System.EventHandler(this.btnHuy_Click);
            // 
            // btnGui
            // 
            this.btnGui.BorderRadius = 5;
            this.btnGui.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnGui.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnGui.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnGui.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnGui.FillColor = System.Drawing.Color.CadetBlue;
            this.btnGui.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnGui.ForeColor = System.Drawing.Color.White;
            this.btnGui.Image = global::DoAnHQTCSDL.Properties.Resources.paper_plane;
            this.btnGui.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnGui.Location = new System.Drawing.Point(814, 581);
            this.btnGui.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnGui.Name = "btnGui";
            this.btnGui.Size = new System.Drawing.Size(110, 48);
            this.btnGui.TabIndex = 7;
            this.btnGui.Text = "Gửi";
            this.btnGui.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.btnGui.Click += new System.EventHandler(this.btnGui_Click);
            // 
            // txtPhanHoi
            // 
            this.txtPhanHoi.BorderRadius = 9;
            this.txtPhanHoi.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtPhanHoi.DefaultText = "";
            this.txtPhanHoi.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtPhanHoi.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtPhanHoi.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtPhanHoi.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtPhanHoi.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtPhanHoi.Font = new System.Drawing.Font("Palatino Linotype", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPhanHoi.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtPhanHoi.Location = new System.Drawing.Point(23, 260);
            this.txtPhanHoi.Margin = new System.Windows.Forms.Padding(5);
            this.txtPhanHoi.Multiline = true;
            this.txtPhanHoi.Name = "txtPhanHoi";
            this.txtPhanHoi.PasswordChar = '\0';
            this.txtPhanHoi.PlaceholderText = "Nhập vào nội dung phản hồi........";
            this.txtPhanHoi.SelectedText = "";
            this.txtPhanHoi.Size = new System.Drawing.Size(912, 283);
            this.txtPhanHoi.TabIndex = 6;
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.CadetBlue;
            this.panel1.Controls.Add(this.label2);
            this.panel1.Location = new System.Drawing.Point(-20, 0);
            this.panel1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1017, 119);
            this.panel1.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.CadetBlue;
            this.label2.Font = new System.Drawing.Font("Palatino Linotype", 29F);
            this.label2.ForeColor = System.Drawing.Color.White;
            this.label2.Location = new System.Drawing.Point(354, 30);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(233, 65);
            this.label2.TabIndex = 34;
            this.label2.Text = "Phản Hồi";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI Semibold", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.CadetBlue;
            this.label1.Location = new System.Drawing.Point(36, 178);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(89, 28);
            this.label1.TabIndex = 9;
            this.label1.Text = "Gửi đến:";
            // 
            // cbMGV
            // 
            this.cbMGV.BackColor = System.Drawing.Color.Transparent;
            this.cbMGV.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cbMGV.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbMGV.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cbMGV.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cbMGV.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cbMGV.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cbMGV.ItemHeight = 30;
            this.cbMGV.Items.AddRange(new object[] {
            "Anh Duy",
            "Ngoc Han"});
            this.cbMGV.Location = new System.Drawing.Point(136, 177);
            this.cbMGV.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cbMGV.Name = "cbMGV";
            this.cbMGV.Size = new System.Drawing.Size(274, 36);
            this.cbMGV.TabIndex = 10;
            // 
            // PhanHoi
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.cbMGV);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnHuy);
            this.Controls.Add(this.btnGui);
            this.Controls.Add(this.txtPhanHoi);
            this.Controls.Add(this.panel1);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "PhanHoi";
            this.Size = new System.Drawing.Size(962, 677);
            this.Load += new System.EventHandler(this.PhanHoi_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Siticone.Desktop.UI.WinForms.SiticoneButton btnHuy;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnGui;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtPhanHoi;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private Siticone.Desktop.UI.WinForms.SiticoneComboBox cbMGV;
    }
}
