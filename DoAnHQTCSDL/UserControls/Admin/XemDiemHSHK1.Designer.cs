namespace DoAnHQTCSDL.UserControls.Admin
{
    partial class XemDiemHSHK1
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
            this.dgvXemDiemHSHK1 = new System.Windows.Forms.DataGridView();
            this.labelDiemHK1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvXemDiemHSHK1)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvXemDiemHSHK1
            // 
            this.dgvXemDiemHSHK1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvXemDiemHSHK1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvXemDiemHSHK1.Location = new System.Drawing.Point(14, 102);
            this.dgvXemDiemHSHK1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dgvXemDiemHSHK1.Name = "dgvXemDiemHSHK1";
            this.dgvXemDiemHSHK1.RowHeadersWidth = 62;
            this.dgvXemDiemHSHK1.RowTemplate.Height = 28;
            this.dgvXemDiemHSHK1.Size = new System.Drawing.Size(724, 311);
            this.dgvXemDiemHSHK1.TabIndex = 0;
            // 
            // labelDiemHK1
            // 
            this.labelDiemHK1.AutoSize = true;
            this.labelDiemHK1.Font = new System.Drawing.Font("Segoe UI Semibold", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelDiemHK1.Location = new System.Drawing.Point(231, 46);
            this.labelDiemHK1.Name = "labelDiemHK1";
            this.labelDiemHK1.Size = new System.Drawing.Size(261, 23);
            this.labelDiemHK1.TabIndex = 9;
            this.labelDiemHK1.Text = "Bảng điểm của học sinh học kỳ 1";
            // 
            // XemDiemHSHK1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.labelDiemHK1);
            this.Controls.Add(this.dgvXemDiemHSHK1);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "XemDiemHSHK1";
            this.Size = new System.Drawing.Size(756, 451);
            this.Load += new System.EventHandler(this.XemDiemHSHK1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvXemDiemHSHK1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvXemDiemHSHK1;
        private System.Windows.Forms.Label labelDiemHK1;
    }
}
