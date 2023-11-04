namespace DoAnHQTCSDL.UserControls.GiaoVien
{
    partial class XemDiemHK2
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
            this.dgvHK2 = new System.Windows.Forms.DataGridView();
            this.MaHS = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TenMon = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DiemKTTXuyen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DiemKTGiuaKy = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DiemCuoiKy = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TBM = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.labelDiemHK2 = new System.Windows.Forms.Label();
            this.txtHanhKiem = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtDanhHieu = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtXepHang = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.txtDiemTongKet = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.txtMaHS = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.txtDiemKTGK = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.txtDiemCK = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.txtTBM = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.txtDiemKTTX = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.txtMon = new Siticone.Desktop.UI.WinForms.SiticoneTextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.panelTT = new System.Windows.Forms.Panel();
            this.panelTK = new System.Windows.Forms.Panel();
            ((System.ComponentModel.ISupportInitialize)(this.dgvHK2)).BeginInit();
            this.panelTK.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgvHK2
            // 
            this.dgvHK2.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvHK2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvHK2.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.MaHS,
            this.TenMon,
            this.DiemKTTXuyen,
            this.DiemKTGiuaKy,
            this.DiemCuoiKy,
            this.TBM});
            this.dgvHK2.Location = new System.Drawing.Point(63, 168);
            this.dgvHK2.Name = "dgvHK2";
            this.dgvHK2.RowHeadersWidth = 62;
            this.dgvHK2.RowTemplate.Height = 28;
            this.dgvHK2.Size = new System.Drawing.Size(737, 265);
            this.dgvHK2.TabIndex = 105;
            // 
            // MaHS
            // 
            this.MaHS.HeaderText = "Mã Học Sinh";
            this.MaHS.MinimumWidth = 8;
            this.MaHS.Name = "MaHS";
            // 
            // TenMon
            // 
            this.TenMon.HeaderText = "Môn Học";
            this.TenMon.MinimumWidth = 8;
            this.TenMon.Name = "TenMon";
            // 
            // DiemKTTXuyen
            // 
            this.DiemKTTXuyen.HeaderText = "Điểm KT Thường Xuyên";
            this.DiemKTTXuyen.MinimumWidth = 8;
            this.DiemKTTXuyen.Name = "DiemKTTXuyen";
            // 
            // DiemKTGiuaKy
            // 
            this.DiemKTGiuaKy.HeaderText = "Điểm KT Giữa Kỳ";
            this.DiemKTGiuaKy.MinimumWidth = 8;
            this.DiemKTGiuaKy.Name = "DiemKTGiuaKy";
            // 
            // DiemCuoiKy
            // 
            this.DiemCuoiKy.HeaderText = "Điểm Cuối Kỳ";
            this.DiemCuoiKy.MinimumWidth = 8;
            this.DiemCuoiKy.Name = "DiemCuoiKy";
            // 
            // TBM
            // 
            this.TBM.HeaderText = "TBM";
            this.TBM.MinimumWidth = 8;
            this.TBM.Name = "TBM";
            // 
            // labelDiemHK2
            // 
            this.labelDiemHK2.AutoSize = true;
            this.labelDiemHK2.Font = new System.Drawing.Font("Segoe UI Semibold", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelDiemHK2.Location = new System.Drawing.Point(265, 134);
            this.labelDiemHK2.Name = "labelDiemHK2";
            this.labelDiemHK2.Size = new System.Drawing.Size(314, 28);
            this.labelDiemHK2.TabIndex = 104;
            this.labelDiemHK2.Text = "Bảng điểm các môn học học kỳ 2";
            // 
            // txtHanhKiem
            // 
            this.txtHanhKiem.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtHanhKiem.DefaultText = "";
            this.txtHanhKiem.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtHanhKiem.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtHanhKiem.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtHanhKiem.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtHanhKiem.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtHanhKiem.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtHanhKiem.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtHanhKiem.Location = new System.Drawing.Point(544, 9);
            this.txtHanhKiem.Name = "txtHanhKiem";
            this.txtHanhKiem.PasswordChar = '\0';
            this.txtHanhKiem.PlaceholderText = "";
            this.txtHanhKiem.SelectedText = "";
            this.txtHanhKiem.Size = new System.Drawing.Size(139, 37);
            this.txtHanhKiem.TabIndex = 118;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.label1.ForeColor = System.Drawing.Color.CadetBlue;
            this.label1.Location = new System.Drawing.Point(391, 14);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(111, 25);
            this.label1.TabIndex = 117;
            this.label1.Text = "Hạnh Kiểm:";
            // 
            // txtDanhHieu
            // 
            this.txtDanhHieu.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtDanhHieu.DefaultText = "";
            this.txtDanhHieu.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtDanhHieu.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtDanhHieu.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtDanhHieu.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtDanhHieu.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtDanhHieu.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtDanhHieu.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtDanhHieu.Location = new System.Drawing.Point(177, 57);
            this.txtDanhHieu.Name = "txtDanhHieu";
            this.txtDanhHieu.PasswordChar = '\0';
            this.txtDanhHieu.PlaceholderText = "";
            this.txtDanhHieu.SelectedText = "";
            this.txtDanhHieu.Size = new System.Drawing.Size(139, 37);
            this.txtDanhHieu.TabIndex = 116;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.label2.ForeColor = System.Drawing.Color.CadetBlue;
            this.label2.Location = new System.Drawing.Point(5, 63);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(107, 25);
            this.label2.TabIndex = 115;
            this.label2.Text = "Danh Hiệu:";
            // 
            // txtXepHang
            // 
            this.txtXepHang.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtXepHang.DefaultText = "";
            this.txtXepHang.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtXepHang.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtXepHang.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtXepHang.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtXepHang.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtXepHang.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtXepHang.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtXepHang.Location = new System.Drawing.Point(544, 57);
            this.txtXepHang.Name = "txtXepHang";
            this.txtXepHang.PasswordChar = '\0';
            this.txtXepHang.PlaceholderText = "";
            this.txtXepHang.SelectedText = "";
            this.txtXepHang.Size = new System.Drawing.Size(139, 37);
            this.txtXepHang.TabIndex = 114;
            // 
            // txtDiemTongKet
            // 
            this.txtDiemTongKet.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtDiemTongKet.DefaultText = "";
            this.txtDiemTongKet.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtDiemTongKet.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtDiemTongKet.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtDiemTongKet.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtDiemTongKet.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtDiemTongKet.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtDiemTongKet.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtDiemTongKet.Location = new System.Drawing.Point(177, 9);
            this.txtDiemTongKet.Name = "txtDiemTongKet";
            this.txtDiemTongKet.PasswordChar = '\0';
            this.txtDiemTongKet.PlaceholderText = "";
            this.txtDiemTongKet.SelectedText = "";
            this.txtDiemTongKet.Size = new System.Drawing.Size(139, 37);
            this.txtDiemTongKet.TabIndex = 113;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.label7.ForeColor = System.Drawing.Color.CadetBlue;
            this.label7.Location = new System.Drawing.Point(391, 63);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(101, 25);
            this.label7.TabIndex = 112;
            this.label7.Text = "Xếp Hạng:";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.label9.ForeColor = System.Drawing.Color.CadetBlue;
            this.label9.Location = new System.Drawing.Point(5, 14);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(144, 25);
            this.label9.TabIndex = 111;
            this.label9.Text = "Điểm Tổng Kết:";
            // 
            // txtMaHS
            // 
            this.txtMaHS.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtMaHS.DefaultText = "";
            this.txtMaHS.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtMaHS.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtMaHS.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMaHS.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMaHS.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMaHS.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtMaHS.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMaHS.Location = new System.Drawing.Point(285, 20);
            this.txtMaHS.Name = "txtMaHS";
            this.txtMaHS.PasswordChar = '\0';
            this.txtMaHS.PlaceholderText = "";
            this.txtMaHS.SelectedText = "";
            this.txtMaHS.Size = new System.Drawing.Size(158, 28);
            this.txtMaHS.TabIndex = 132;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.label10.ForeColor = System.Drawing.Color.CadetBlue;
            this.label10.Location = new System.Drawing.Point(58, 19);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(125, 25);
            this.label10.TabIndex = 131;
            this.label10.Text = "Mã Học Sinh:";
            // 
            // txtDiemKTGK
            // 
            this.txtDiemKTGK.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtDiemKTGK.DefaultText = "";
            this.txtDiemKTGK.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtDiemKTGK.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtDiemKTGK.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtDiemKTGK.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtDiemKTGK.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtDiemKTGK.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtDiemKTGK.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtDiemKTGK.Location = new System.Drawing.Point(652, 18);
            this.txtDiemKTGK.Name = "txtDiemKTGK";
            this.txtDiemKTGK.PasswordChar = '\0';
            this.txtDiemKTGK.PlaceholderText = "";
            this.txtDiemKTGK.SelectedText = "";
            this.txtDiemKTGK.Size = new System.Drawing.Size(158, 28);
            this.txtDiemKTGK.TabIndex = 130;
            // 
            // txtDiemCK
            // 
            this.txtDiemCK.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtDiemCK.DefaultText = "";
            this.txtDiemCK.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtDiemCK.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtDiemCK.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtDiemCK.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtDiemCK.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtDiemCK.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtDiemCK.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtDiemCK.Location = new System.Drawing.Point(652, 52);
            this.txtDiemCK.Name = "txtDiemCK";
            this.txtDiemCK.PasswordChar = '\0';
            this.txtDiemCK.PlaceholderText = "";
            this.txtDiemCK.SelectedText = "";
            this.txtDiemCK.Size = new System.Drawing.Size(158, 28);
            this.txtDiemCK.TabIndex = 129;
            // 
            // txtTBM
            // 
            this.txtTBM.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtTBM.DefaultText = "";
            this.txtTBM.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtTBM.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtTBM.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtTBM.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtTBM.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtTBM.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtTBM.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtTBM.Location = new System.Drawing.Point(652, 86);
            this.txtTBM.Name = "txtTBM";
            this.txtTBM.PasswordChar = '\0';
            this.txtTBM.PlaceholderText = "";
            this.txtTBM.SelectedText = "";
            this.txtTBM.Size = new System.Drawing.Size(158, 28);
            this.txtTBM.TabIndex = 128;
            // 
            // txtDiemKTTX
            // 
            this.txtDiemKTTX.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtDiemKTTX.DefaultText = "";
            this.txtDiemKTTX.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtDiemKTTX.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtDiemKTTX.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtDiemKTTX.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtDiemKTTX.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtDiemKTTX.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtDiemKTTX.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtDiemKTTX.Location = new System.Drawing.Point(285, 90);
            this.txtDiemKTTX.Name = "txtDiemKTTX";
            this.txtDiemKTTX.PasswordChar = '\0';
            this.txtDiemKTTX.PlaceholderText = "";
            this.txtDiemKTTX.SelectedText = "";
            this.txtDiemKTTX.Size = new System.Drawing.Size(158, 28);
            this.txtDiemKTTX.TabIndex = 127;
            // 
            // txtMon
            // 
            this.txtMon.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtMon.DefaultText = "";
            this.txtMon.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtMon.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtMon.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMon.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMon.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMon.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtMon.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMon.Location = new System.Drawing.Point(285, 55);
            this.txtMon.Name = "txtMon";
            this.txtMon.PasswordChar = '\0';
            this.txtMon.PlaceholderText = "";
            this.txtMon.SelectedText = "";
            this.txtMon.Size = new System.Drawing.Size(158, 28);
            this.txtMon.TabIndex = 126;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.label6.ForeColor = System.Drawing.Color.CadetBlue;
            this.label6.Location = new System.Drawing.Point(471, 20);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(160, 25);
            this.label6.TabIndex = 125;
            this.label6.Text = "Điểm KT Giữa Kỳ:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.label5.ForeColor = System.Drawing.Color.CadetBlue;
            this.label5.Location = new System.Drawing.Point(470, 55);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(130, 25);
            this.label5.TabIndex = 124;
            this.label5.Text = "Điểm Cuối Kỳ:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.label4.ForeColor = System.Drawing.Color.CadetBlue;
            this.label4.Location = new System.Drawing.Point(470, 89);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(155, 25);
            this.label4.TabIndex = 123;
            this.label4.Text = "Trung Bình Môn:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.label3.ForeColor = System.Drawing.Color.CadetBlue;
            this.label3.Location = new System.Drawing.Point(58, 89);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(220, 25);
            this.label3.TabIndex = 122;
            this.label3.Text = "Điểm KT Thường Xuyên:";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.ForeColor = System.Drawing.Color.CadetBlue;
            this.label8.Location = new System.Drawing.Point(58, 55);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(95, 25);
            this.label8.TabIndex = 121;
            this.label8.Text = "Môn Học:";
            // 
            // panelTT
            // 
            this.panelTT.Location = new System.Drawing.Point(52, 3);
            this.panelTT.Name = "panelTT";
            this.panelTT.Size = new System.Drawing.Size(775, 128);
            this.panelTT.TabIndex = 133;
            // 
            // panelTK
            // 
            this.panelTK.Controls.Add(this.txtHanhKiem);
            this.panelTK.Controls.Add(this.label1);
            this.panelTK.Controls.Add(this.txtDanhHieu);
            this.panelTK.Controls.Add(this.label2);
            this.panelTK.Controls.Add(this.txtXepHang);
            this.panelTK.Controls.Add(this.txtDiemTongKet);
            this.panelTK.Controls.Add(this.label7);
            this.panelTK.Controls.Add(this.label9);
            this.panelTK.Location = new System.Drawing.Point(62, 448);
            this.panelTK.Name = "panelTK";
            this.panelTK.Size = new System.Drawing.Size(737, 116);
            this.panelTK.TabIndex = 134;
            // 
            // XemDiemHK2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.panelTK);
            this.Controls.Add(this.txtMaHS);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.txtDiemKTGK);
            this.Controls.Add(this.txtDiemCK);
            this.Controls.Add(this.txtTBM);
            this.Controls.Add(this.txtDiemKTTX);
            this.Controls.Add(this.txtMon);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.dgvHK2);
            this.Controls.Add(this.labelDiemHK2);
            this.Controls.Add(this.panelTT);
            this.Name = "XemDiemHK2";
            this.Size = new System.Drawing.Size(830, 567);
            ((System.ComponentModel.ISupportInitialize)(this.dgvHK2)).EndInit();
            this.panelTK.ResumeLayout(false);
            this.panelTK.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvHK2;
        private System.Windows.Forms.Label labelDiemHK2;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtHanhKiem;
        private System.Windows.Forms.Label label1;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtDanhHieu;
        private System.Windows.Forms.Label label2;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtXepHang;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtDiemTongKet;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.DataGridViewTextBoxColumn MaHS;
        private System.Windows.Forms.DataGridViewTextBoxColumn TenMon;
        private System.Windows.Forms.DataGridViewTextBoxColumn DiemKTTXuyen;
        private System.Windows.Forms.DataGridViewTextBoxColumn DiemKTGiuaKy;
        private System.Windows.Forms.DataGridViewTextBoxColumn DiemCuoiKy;
        private System.Windows.Forms.DataGridViewTextBoxColumn TBM;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtMaHS;
        private System.Windows.Forms.Label label10;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtDiemKTGK;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtDiemCK;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtTBM;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtDiemKTTX;
        private Siticone.Desktop.UI.WinForms.SiticoneTextBox txtMon;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Panel panelTT;
        private System.Windows.Forms.Panel panelTK;
    }
}
