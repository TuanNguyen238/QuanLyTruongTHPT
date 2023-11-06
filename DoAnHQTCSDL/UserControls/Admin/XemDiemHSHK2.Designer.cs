namespace DoAnHQTCSDL.UserControls.Admin
{
    partial class XemDiemHSHK2
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
            this.dgvXemDiemHSHK2 = new System.Windows.Forms.DataGridView();
            this.labelDiemHK1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvXemDiemHSHK2)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvXemDiemHSHK2
            // 
            this.dgvXemDiemHSHK2.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvXemDiemHSHK2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvXemDiemHSHK2.Location = new System.Drawing.Point(14, 102);
            this.dgvXemDiemHSHK2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dgvXemDiemHSHK2.Name = "dgvXemDiemHSHK2";
            this.dgvXemDiemHSHK2.RowHeadersWidth = 62;
            this.dgvXemDiemHSHK2.RowTemplate.Height = 28;
            this.dgvXemDiemHSHK2.Size = new System.Drawing.Size(724, 311);
            this.dgvXemDiemHSHK2.TabIndex = 1;
            // 
            // labelDiemHK1
            // 
            this.labelDiemHK1.AutoSize = true;
            this.labelDiemHK1.Font = new System.Drawing.Font("Segoe UI Semibold", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelDiemHK1.Location = new System.Drawing.Point(231, 46);
            this.labelDiemHK1.Name = "labelDiemHK1";
            this.labelDiemHK1.Size = new System.Drawing.Size(263, 23);
            this.labelDiemHK1.TabIndex = 68;
            this.labelDiemHK1.Text = "Bảng điểm của học sinh học kỳ 2";
            // 
            // XemDiemHSHK2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.labelDiemHK1);
            this.Controls.Add(this.dgvXemDiemHSHK2);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "XemDiemHSHK2";
            this.Size = new System.Drawing.Size(756, 451);
            this.Load += new System.EventHandler(this.XemDiemHSHK2_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvXemDiemHSHK2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvXemDiemHSHK2;
        private System.Windows.Forms.Label labelDiemHK1;
    }
}
