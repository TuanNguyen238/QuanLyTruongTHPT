namespace DoAnHQTCSDL.UserControls
{
    partial class XemPhanHoi
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
            this.dgvPhanHoi = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPhanHoi)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvPhanHoi
            // 
            this.dgvPhanHoi.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvPhanHoi.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvPhanHoi.Location = new System.Drawing.Point(19, 130);
            this.dgvPhanHoi.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dgvPhanHoi.Name = "dgvPhanHoi";
            this.dgvPhanHoi.RowHeadersWidth = 62;
            this.dgvPhanHoi.RowTemplate.Height = 28;
            this.dgvPhanHoi.Size = new System.Drawing.Size(705, 398);
            this.dgvPhanHoi.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 28F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.CadetBlue;
            this.label1.Location = new System.Drawing.Point(118, 34);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(500, 62);
            this.label1.TabIndex = 95;
            this.label1.Text = "Các phản hồi đã nhận";
            // 
            // XemPhanHoi
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgvPhanHoi);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "XemPhanHoi";
            this.Size = new System.Drawing.Size(768, 668);
            this.Load += new System.EventHandler(this.XemPhanHoi_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvPhanHoi)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvPhanHoi;
        private System.Windows.Forms.Label label1;
    }
}
