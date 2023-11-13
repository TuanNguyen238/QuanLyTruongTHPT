namespace DoAnHQTCSDL.UserControls.Admin
{
    partial class DuyetHoSo
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvDuyetHoSo = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.btnThemVaoLop = new Siticone.Desktop.UI.WinForms.SiticoneButton();
            this.cbLop = new Siticone.Desktop.UI.WinForms.SiticoneComboBox();
            this.label4 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDuyetHoSo)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvDuyetHoSo
            // 
            this.dgvDuyetHoSo.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvDuyetHoSo.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dgvDuyetHoSo.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Segoe UI", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvDuyetHoSo.DefaultCellStyle = dataGridViewCellStyle2;
            this.dgvDuyetHoSo.Location = new System.Drawing.Point(20, 108);
            this.dgvDuyetHoSo.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dgvDuyetHoSo.Name = "dgvDuyetHoSo";
            this.dgvDuyetHoSo.RowHeadersWidth = 62;
            this.dgvDuyetHoSo.RowTemplate.Height = 28;
            this.dgvDuyetHoSo.Size = new System.Drawing.Size(709, 415);
            this.dgvDuyetHoSo.TabIndex = 0;
            this.dgvDuyetHoSo.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvDuyetHoSo_CellClick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 20F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.CadetBlue;
            this.label1.Location = new System.Drawing.Point(28, 37);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(649, 46);
            this.label1.TabIndex = 63;
            this.label1.Text = "Danh sách các hồ sơ tuyển sinh đã nhận";
            // 
            // btnThemVaoLop
            // 
            this.btnThemVaoLop.BackColor = System.Drawing.Color.White;
            this.btnThemVaoLop.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThemVaoLop.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThemVaoLop.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThemVaoLop.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThemVaoLop.FillColor = System.Drawing.Color.CadetBlue;
            this.btnThemVaoLop.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThemVaoLop.ForeColor = System.Drawing.Color.White;
            this.btnThemVaoLop.Location = new System.Drawing.Point(541, 572);
            this.btnThemVaoLop.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnThemVaoLop.Name = "btnThemVaoLop";
            this.btnThemVaoLop.Size = new System.Drawing.Size(188, 30);
            this.btnThemVaoLop.TabIndex = 65;
            this.btnThemVaoLop.Text = "Thêm Vào Lớp";
            this.btnThemVaoLop.Click += new System.EventHandler(this.btnThemVaoLop_Click);
            // 
            // cbLop
            // 
            this.cbLop.BackColor = System.Drawing.Color.Transparent;
            this.cbLop.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cbLop.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbLop.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cbLop.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cbLop.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cbLop.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cbLop.ItemHeight = 30;
            this.cbLop.Location = new System.Drawing.Point(375, 566);
            this.cbLop.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cbLop.Name = "cbLop";
            this.cbLop.Size = new System.Drawing.Size(137, 36);
            this.cbLop.TabIndex = 105;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold);
            this.label4.ForeColor = System.Drawing.Color.CadetBlue;
            this.label4.Location = new System.Drawing.Point(289, 566);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(52, 28);
            this.label4.TabIndex = 104;
            this.label4.Text = "Lớp:";
            // 
            // DuyetHoSo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.cbLop);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btnThemVaoLop);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgvDuyetHoSo);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "DuyetHoSo";
            this.Size = new System.Drawing.Size(749, 657);
            this.Load += new System.EventHandler(this.DuyetHoSo_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDuyetHoSo)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvDuyetHoSo;
        private System.Windows.Forms.Label label1;
        private Siticone.Desktop.UI.WinForms.SiticoneButton btnThemVaoLop;
        private Siticone.Desktop.UI.WinForms.SiticoneComboBox cbLop;
        private System.Windows.Forms.Label label4;
    }
}
