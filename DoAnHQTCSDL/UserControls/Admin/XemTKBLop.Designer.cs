namespace DoAnHQTCSDL.UserControls.Admin
{
    partial class XemTKBLop
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
            this.dgvTKB = new System.Windows.Forms.DataGridView();
            this.Tiet = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Thu2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Thu3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Thu4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Thu5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Thu6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Thu7 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cbNam = new Siticone.Desktop.UI.WinForms.SiticoneComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.siticoneComboBox1 = new Siticone.Desktop.UI.WinForms.SiticoneComboBox();
            this.label4 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTKB)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvTKB
            // 
            this.dgvTKB.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvTKB.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvTKB.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Tiet,
            this.Thu2,
            this.Thu3,
            this.Thu4,
            this.Thu5,
            this.Thu6,
            this.Thu7});
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvTKB.DefaultCellStyle = dataGridViewCellStyle2;
            this.dgvTKB.Location = new System.Drawing.Point(14, 181);
            this.dgvTKB.Name = "dgvTKB";
            this.dgvTKB.RowHeadersWidth = 62;
            this.dgvTKB.RowTemplate.Height = 28;
            this.dgvTKB.Size = new System.Drawing.Size(814, 560);
            this.dgvTKB.TabIndex = 1;
            // 
            // Tiet
            // 
            this.Tiet.HeaderText = "Tiết";
            this.Tiet.MinimumWidth = 8;
            this.Tiet.Name = "Tiet";
            // 
            // Thu2
            // 
            this.Thu2.HeaderText = "Thứ 2";
            this.Thu2.MinimumWidth = 8;
            this.Thu2.Name = "Thu2";
            // 
            // Thu3
            // 
            this.Thu3.HeaderText = "Thứ 3";
            this.Thu3.MinimumWidth = 8;
            this.Thu3.Name = "Thu3";
            // 
            // Thu4
            // 
            this.Thu4.HeaderText = "Thứ 4";
            this.Thu4.MinimumWidth = 8;
            this.Thu4.Name = "Thu4";
            // 
            // Thu5
            // 
            this.Thu5.HeaderText = "Thứ 5";
            this.Thu5.MinimumWidth = 8;
            this.Thu5.Name = "Thu5";
            // 
            // Thu6
            // 
            this.Thu6.HeaderText = "Thứ 6";
            this.Thu6.MinimumWidth = 8;
            this.Thu6.Name = "Thu6";
            // 
            // Thu7
            // 
            this.Thu7.HeaderText = "Thứ 7";
            this.Thu7.MinimumWidth = 8;
            this.Thu7.Name = "Thu7";
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
            this.cbNam.Location = new System.Drawing.Point(267, 101);
            this.cbNam.Name = "cbNam";
            this.cbNam.Size = new System.Drawing.Size(100, 36);
            this.cbNam.StartIndex = 0;
            this.cbNam.TabIndex = 102;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold);
            this.label2.ForeColor = System.Drawing.Color.CadetBlue;
            this.label2.Location = new System.Drawing.Point(138, 105);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(123, 32);
            this.label2.TabIndex = 101;
            this.label2.Text = "Năm học:";
            // 
            // siticoneComboBox1
            // 
            this.siticoneComboBox1.BackColor = System.Drawing.Color.Transparent;
            this.siticoneComboBox1.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.siticoneComboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.siticoneComboBox1.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.siticoneComboBox1.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.siticoneComboBox1.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.siticoneComboBox1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.siticoneComboBox1.ItemHeight = 30;
            this.siticoneComboBox1.Items.AddRange(new object[] {
            "10A1",
            "10A2",
            "10A3"});
            this.siticoneComboBox1.Location = new System.Drawing.Point(267, 34);
            this.siticoneComboBox1.Name = "siticoneComboBox1";
            this.siticoneComboBox1.Size = new System.Drawing.Size(154, 36);
            this.siticoneComboBox1.TabIndex = 103;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold);
            this.label4.ForeColor = System.Drawing.Color.CadetBlue;
            this.label4.Location = new System.Drawing.Point(138, 34);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(63, 32);
            this.label4.TabIndex = 94;
            this.label4.Text = "Lớp:";
            // 
            // XemTKBLop
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.siticoneComboBox1);
            this.Controls.Add(this.cbNam);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.dgvTKB);
            this.Name = "XemTKBLop";
            this.Size = new System.Drawing.Size(843, 822);
            ((System.ComponentModel.ISupportInitialize)(this.dgvTKB)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvTKB;
        private System.Windows.Forms.DataGridViewTextBoxColumn Tiet;
        private System.Windows.Forms.DataGridViewTextBoxColumn Thu2;
        private System.Windows.Forms.DataGridViewTextBoxColumn Thu3;
        private System.Windows.Forms.DataGridViewTextBoxColumn Thu4;
        private System.Windows.Forms.DataGridViewTextBoxColumn Thu5;
        private System.Windows.Forms.DataGridViewTextBoxColumn Thu6;
        private System.Windows.Forms.DataGridViewTextBoxColumn Thu7;
        private Siticone.Desktop.UI.WinForms.SiticoneComboBox cbNam;
        private System.Windows.Forms.Label label2;
        private Siticone.Desktop.UI.WinForms.SiticoneComboBox siticoneComboBox1;
        private System.Windows.Forms.Label label4;
    }
}
