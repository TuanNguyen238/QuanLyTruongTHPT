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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvTKB = new System.Windows.Forms.DataGridView();
            this.cbLop = new Siticone.Desktop.UI.WinForms.SiticoneComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.lbHK = new System.Windows.Forms.Label();
            this.cbKy = new Siticone.Desktop.UI.WinForms.SiticoneComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTKB)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvTKB
            // 
            this.dgvTKB.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvTKB.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvTKB.DefaultCellStyle = dataGridViewCellStyle1;
            this.dgvTKB.Location = new System.Drawing.Point(12, 145);
            this.dgvTKB.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dgvTKB.Name = "dgvTKB";
            this.dgvTKB.RowHeadersWidth = 62;
            this.dgvTKB.RowTemplate.Height = 28;
            this.dgvTKB.Size = new System.Drawing.Size(724, 448);
            this.dgvTKB.TabIndex = 1;
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
            this.cbLop.Location = new System.Drawing.Point(209, 27);
            this.cbLop.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cbLop.Name = "cbLop";
            this.cbLop.Size = new System.Drawing.Size(137, 36);
            this.cbLop.TabIndex = 103;
            this.cbLop.SelectedIndexChanged += new System.EventHandler(this.cbLop_SelectedIndexChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold);
            this.label4.ForeColor = System.Drawing.Color.CadetBlue;
            this.label4.Location = new System.Drawing.Point(123, 27);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(52, 28);
            this.label4.TabIndex = 94;
            this.label4.Text = "Lớp:";
            // 
            // lbHK
            // 
            this.lbHK.AutoSize = true;
            this.lbHK.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbHK.ForeColor = System.Drawing.Color.CadetBlue;
            this.lbHK.Location = new System.Drawing.Point(123, 85);
            this.lbHK.Name = "lbHK";
            this.lbHK.Size = new System.Drawing.Size(80, 28);
            this.lbHK.TabIndex = 105;
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
            this.cbKy.Location = new System.Drawing.Point(209, 85);
            this.cbKy.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cbKy.Name = "cbKy";
            this.cbKy.Size = new System.Drawing.Size(108, 36);
            this.cbKy.TabIndex = 106;
            this.cbKy.SelectedIndexChanged += new System.EventHandler(this.cbKy_SelectedIndexChanged);
            // 
            // XemTKBLop
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.cbKy);
            this.Controls.Add(this.lbHK);
            this.Controls.Add(this.cbLop);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.dgvTKB);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "XemTKBLop";
            this.Size = new System.Drawing.Size(749, 658);
            this.Load += new System.EventHandler(this.XemTKBLop_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvTKB)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvTKB;
        private Siticone.Desktop.UI.WinForms.SiticoneComboBox cbLop, cbKy;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label lbHK;
    }
}
