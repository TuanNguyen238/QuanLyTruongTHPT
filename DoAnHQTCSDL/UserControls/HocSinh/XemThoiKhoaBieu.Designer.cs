﻿namespace DoAnHQTCSDL.UserControls.HocSinh
{
    partial class XemThoiKhoaBieu
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvXemTKB = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.txtLop = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.lbLop = new System.Windows.Forms.Label();
            this.lbHK = new System.Windows.Forms.Label();
            this.cbKy = new Siticone.Desktop.UI.WinForms.SiticoneComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvXemTKB)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvXemTKB
            // 
            this.dgvXemTKB.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvXemTKB.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvXemTKB.DefaultCellStyle = dataGridViewCellStyle1;
            this.dgvXemTKB.Location = new System.Drawing.Point(21, 188);
            this.dgvXemTKB.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dgvXemTKB.Name = "dgvXemTKB";
            this.dgvXemTKB.RowHeadersWidth = 62;
            this.dgvXemTKB.RowTemplate.Height = 28;
            this.dgvXemTKB.Size = new System.Drawing.Size(919, 427);
            this.dgvXemTKB.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 42F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.CadetBlue;
            this.label1.Location = new System.Drawing.Point(131, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(604, 93);
            this.label1.TabIndex = 97;
            this.label1.Text = "THỜI KHÓA BIỂU";
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
            this.txtLop.Location = new System.Drawing.Point(88, 128);
            this.txtLop.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtLop.Name = "txtLop";
            this.txtLop.PasswordChar = '\0';
            this.txtLop.PlaceholderText = "";
            this.txtLop.SelectedText = "";
            this.txtLop.Size = new System.Drawing.Size(89, 30);
            this.txtLop.TabIndex = 96;
            // 
            // lbLop
            // 
            this.lbLop.AutoSize = true;
            this.lbLop.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbLop.ForeColor = System.Drawing.Color.CadetBlue;
            this.lbLop.Location = new System.Drawing.Point(30, 130);
            this.lbLop.Name = "lbLop";
            this.lbLop.Size = new System.Drawing.Size(52, 28);
            this.lbLop.TabIndex = 95;
            this.lbLop.Text = "Lớp:";
            // 
            // lbHK
            // 
            this.lbHK.AutoSize = true;
            this.lbHK.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbHK.ForeColor = System.Drawing.Color.CadetBlue;
            this.lbHK.Location = new System.Drawing.Point(252, 126);
            this.lbHK.Name = "lbHK";
            this.lbHK.Size = new System.Drawing.Size(80, 28);
            this.lbHK.TabIndex = 99;
            this.lbHK.Text = "Kỳ học:";
            // 
            // cbKy
            // 
            this.cbKy.BackColor = System.Drawing.Color.Transparent;
            this.cbKy.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cbKy.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbKy.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cbKy.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cbKy.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cbKy.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cbKy.ItemHeight = 30;
            this.cbKy.Location = new System.Drawing.Point(338, 122);
            this.cbKy.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cbKy.Name = "cbKy";
            this.cbKy.Size = new System.Drawing.Size(89, 36);
            this.cbKy.Sorted = true;
            this.cbKy.TabIndex = 102;
            // 
            // XemThoiKhoaBieu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.cbKy);
            this.Controls.Add(this.lbHK);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtLop);
            this.Controls.Add(this.lbLop);
            this.Controls.Add(this.dgvXemTKB);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "XemThoiKhoaBieu";
            this.Size = new System.Drawing.Size(962, 677);
            this.Load += new System.EventHandler(this.XemThoiKhoaBieu_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvXemTKB)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvXemTKB;
        private System.Windows.Forms.Label label1;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtLop;
        private System.Windows.Forms.Label lbLop;
        private System.Windows.Forms.Label lbHK;
        private Siticone.Desktop.UI.WinForms.SiticoneComboBox cbKy;
    }
}
