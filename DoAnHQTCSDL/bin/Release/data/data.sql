USE [master]
GO
/****** Object:  Database [QuanLyTruongTrungHocPT]    Script Date: 11/21/2023 12:10:52 PM ******/
CREATE DATABASE [QuanLyTruongTrungHocPT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyTruongTrungHocPT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLyTruongTrungHocPT.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyTruongTrungHocPT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLyTruongTrungHocPT_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyTruongTrungHocPT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLyTruongTrungHocPT]
GO
/****** Object:  UserDefinedFunction [dbo].[KiemTra_LoaiNguoiDung]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Function kiểm tra loại người dùng
CREATE FUNCTION [dbo].[KiemTra_LoaiNguoiDung](@TenDN varchar(20), @MatKhau varchar(20))
RETURNS INT
AS
BEGIN
	DECLARE @LoaiNguoiDung INT = 1;
	IF EXISTS(SELECT * FROM NguoiDung WHERE TenDangNhap = @TenDN AND MatKhau = @MatKhau)
	BEGIN
    SET @LoaiNguoiDung = (SELECT LoaiNguoiDung FROM NguoiDung WHERE TenDangNhap = @TenDN);
    END;
	ELSE
	BEGIN
	SET @LoaiNguoiDung = -1;
	END;
    RETURN @LoaiNguoiDung;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[KiemTraTenNguoiDung]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[KiemTraTenNguoiDung](@TenDN varchar(20))
RETURNS INT
AS
BEGIN
	DECLARE @Status INT = 0;
	IF EXISTS(SELECT * FROM NguoiDung WHERE TenDangNhap = @TenDN)
		SET @Status = 1;
	RETURN @Status;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[KiemTraTonTaiHocSinh]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[KiemTraTonTaiHocSinh](@TenDN varchar(20))
RETURNS INT
AS
BEGIN
	DECLARE @Status INT = 0, @MaNguoiDung varchar(20);
	SET @MaNguoiDung = dbo.TraMaNguoiDung(@TenDN);
	IF EXISTS (SELECT * FROM HocSinh WHERE MaHS = @MaNguoiDung)
		SET @Status = 1;
	RETURN @Status;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[KiemTraTuyenSinh]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[KiemTraTuyenSinh](@MaHoSo varchar(20))
RETURNS INT
AS
BEGIN
	DECLARE @Status INT = 0;
	IF EXISTS(SELECT * FROM TuyenSinh WHERE MaHoSo = @MaHoSo)
		SET @Status = 1;
	RETURN @Status;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[LayDiemTuDieuLe]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[LayDiemTuDieuLe](@DieuLe nvarchar(50))
RETURNS INT
AS
BEGIN
	DECLARE @Diem INT = (SELECT SoDiemTru FROM NoiQuy WHERE DieuLe = @DieuLe)
	RETURN @Diem;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[LayNoiQuyTuDieule]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[LayNoiQuyTuDieule](@DieuLe nvarchar(50))
RETURNS varchar(20)
AS
BEGIN
	DECLARE @MaNQ varchar(20)
	SELECT @MaNQ = MaNQ FROM NoiQuy WHERE DieuLe = @DieuLe
	RETURN @MaNQ;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[LopCuaGiaoVien]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Trả về lớp của giáo viên chủ nhiệm
CREATE FUNCTION [dbo].[LopCuaGiaoVien](@MaGV varchar(20))
RETURNS varchar(20)
AS
BEGIN
	RETURN(
	SELECT TenLop
	FROM Lop
	WHERE Lop.MaGVCN = @MaGV)
END;

GO
/****** Object:  UserDefinedFunction [dbo].[TimDiemLopHocKy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[TimDiemLopHocKy](@TenLop varchar(20), @KiTu nvarchar(50), @KyHoc int, @NamHoc int)
RETURNS @BangDiem TABLE(
MaHS varchar(20),
HoTen nvarchar(50),
TenMonHoc nvarchar(20),
KTThuongXuyen float,
KTGiuaKy float,
KTCuoiKy float,
DiemTBMon float
)
AS
BEGIN
	INSERT INTO @BangDiem
	SELECT
		D.MaHS,
		H.HoTen,
		M.TenMonHoc,
		D.KTThuongXuyen,
		D.KTGiuaKy,
		D.KTCuoiKy,
		D.DiemTBMon
	FROM Diem as D INNER JOIN HocSinh as H
	ON D.MaHS = H.MaHS
	INNER JOIN MonHoc as M
	ON D.MaMH = M.MaMonHoc
	WHERE
		CONCAT(D.MaHS,
		H.HoTen,
		M.TenMonHoc,
		D.KTThuongXuyen,
		D.KTGiuaKy,
		D.KTCuoiKy,
		D.DiemTBMon)
		LIKE '%' + @KiTu + '%'
		AND H.TenLop = @TenLop AND D.HocKy = @KyHoc AND D.NamHoc = @NamHoc;
	RETURN;
END

GO
/****** Object:  UserDefinedFunction [dbo].[TimThiDuaLop]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[TimThiDuaLop](@TenLop varchar(20), @KiTu nvarchar(50))
RETURNS @ThiDuaLop TABLE(
MaNQ varchar(20),
DieuLe nvarchar(20),
SoLanViPham int,
TongDiemBiTru int
)
AS
BEGIN
	INSERT INTO @ThiDuaLop
	SELECT
		DanhGia.MaNQ,
		NoiQuy.DieuLe,
		DanhGia.SoLanViPham,
		(NoiQuy.SoDiemTru * DanhGia.SoLanViPham) AS TongDiembiTru
	FROM DanhGia
	INNER JOIN NoiQuy
	ON DanhGia.MaNQ = NoiQuy.MaNQ
	WHERE DanhGia.TenLop = @TenLop
	AND CONCAT( DanhGia.MaNQ,
		NoiQuy.DieuLe,
		DanhGia.SoLanViPham,
		(NoiQuy.SoDiemTru * DanhGia.SoLanViPham))
		LIKE '%' + @KiTu + '%'
	RETURN;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[TinhTongHocSinh]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[TinhTongHocSinh]()
RETURNS INT
AS
BEGIN
	DECLARE @Tong INT;
	SET @Tong = (SELECT COUNT(*) FROM HocSinh);
	RETURN @Tong;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[TraLop]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trả giá trị lớp từ mã học sinh
CREATE FUNCTION [dbo].[TraLop](@MaHS varchar(20))
RETURNS varchar(20)
AS
BEGIN
	DECLARE @TenLop varchar(20)
	SELECT @TenLop = TenLop
	FROM HocSinh
	WHERE MaHS = @MaHS
	RETURN @Tenlop
END;

GO
/****** Object:  UserDefinedFunction [dbo].[TraMaNguoiDung]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Trả mã người dùng dựa trên tên đăng nhập
CREATE FUNCTION [dbo].[TraMaNguoiDung](@TenDN varchar(20))
RETURNS varchar(20)
AS
BEGIN
RETURN(
	SELECT MaNguoiDung
	FROM NguoiDung
	WHERE TenDangNhap = @TenDN
)
END;

GO
/****** Object:  UserDefinedFunction [dbo].[TraSiSoLop]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[TraSiSoLop](@MaGV varchar(20))
RETURNS INT
AS
BEGIN
	DECLARE @SiSo INT = 0;
	IF EXISTS(SELECT * FROM Lop WHERE MaGVCN = @MaGV)
		SET @SiSo = (SELECT SiSoLop FROM Lop WHERE MaGVCN = @MaGV);
	RETURN @SiSo;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[TraTKB]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- Trả mã thời khóa biểu của lớp
CREATE FUNCTION [dbo].[TraTKB](@TenLop varchar(20), @KyHoc int)
RETURNS varchar(20)
AS
BEGIN
	DECLARE @MaTKB varchar(20)
	SELECT @MaTKB = MaTKB
	FROM ThoiKhoaBieu
	WHERE TenLop = @TenLop AND HocKy = @KyHoc
	RETURN @MaTKB
END;

GO
/****** Object:  UserDefinedFunction [dbo].[TraTTGiaoVien]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[TraTTGiaoVien](@MaGV varchar(20))
RETURNS @Bang TABLE(
    MaGV varchar(20),
    HoTen nvarchar(50),
    NgaySinh date,
	GioiTinh nvarchar(20),
    SDT varchar(20),
    TenLop nvarchar(20),
    TenMon nvarchar(20),
    DiaChi nvarchar(100)
)
AS
BEGIN
    DECLARE @Lop nvarchar(20) = '', @MonHoc nvarchar(20) = '';
    IF EXISTS(SELECT * FROM Lop WHERE MaGVCN = @MaGV)
        SET @Lop = (SELECT TenLop FROM Lop WHERE MaGVCN = @MaGV);
	IF EXISTS(SELECT * FROM Day WHERE MaGV = @MaGV)
		SET @MonHoc = (SELECT TenMonHoc FROM MonHoc WHERE MaMonHoc = (SELECT MaMonHoc FROM Day WHERE MaGV = @MaGV));
    INSERT INTO @Bang
    SELECT MaGV, HoTen, NgaySinh, GioiTinh, SDT, @Lop AS TenLop, @MonHoc AS TenMon, DiaChi
    FROM GiaoVien
    WHERE MaGV = @MaGV;
    RETURN;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[XemDiemCaNhanHocKy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Xem điểm học kỳ của học sinh
CREATE FUNCTION [dbo].[XemDiemCaNhanHocKy](@MaHS varchar(20), @KyHoc int, @NamHoc int)
RETURNS @BangDiem TABLE(
TenMonHoc nvarchar(20),
KTThuongXuyen float,
KTGiuaKy float,
KTCuoiKy float,
DiemTBMon float
)
AS
BEGIN
	INSERT INTO @BangDiem
    SELECT
        MonHoc.TenMonHoc,
        Diem.KTThuongXuyen,
        Diem.KTGiuaKy,
        Diem.KTCuoiKy,
        Diem.DiemTBMon
    FROM Diem
    INNER JOIN MonHoc ON Diem.MaMH = MonHoc.MaMonHoc
    WHERE Diem.MaHS = @MaHS AND Diem.HocKy = @KyHoc AND Diem.NamHoc = @NamHoc
	RETURN;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[XemDiemLopHocKy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Xem điểm của lớp trong học kỳ
CREATE FUNCTION [dbo].[XemDiemLopHocKy](@TenLop varchar(20), @HocKy int, @NamHoc int)
RETURNS @BangDiemLop TABLE(
MaHS varchar(20),
HoTen nvarchar(50),
TenMonHoc nvarchar(20),
KTThuongXuyen float,
KTGiuaKy float,
KTCuoiKy float,
DiemTBMon float
)
AS
BEGIN
	INSERT INTO @BangDiemLop
	SELECT HocSinh.MaHS,
	       HocSinh.HoTen,
	       MonHoc.TenMonHoc,
	       Diem.KTThuongXuyen,
	       Diem.KTGiuaKy,
	       Diem.KTCuoiKy,
	       Diem.DiemTBMon
	FROM HocSinh
	INNER JOIN Diem ON HocSinh.MaHS = Diem.MaHS
	INNER JOIN MonHoc ON Diem.MaMH = MonHoc.MaMonHoc
	WHERE HocSinh.TenLop = @TenLop
	      AND Diem.HocKy = @HocKy
	      AND Diem.NamHoc = @NamHoc
	RETURN;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[XemThiDuaLop]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[XemThiDuaLop](@TenLop varchar(20))
RETURNS @ThiDuaLop TABLE(
MaNQ varchar(20),
DieuLe nvarchar(50),
SoLanViPham int,
TongDiemBiTru int
)
AS
BEGIN
	INSERT INTO @ThiDuaLop
	SELECT
		DanhGia.MaNQ,
		NoiQuy.DieuLe,
		DanhGia.SoLanViPham,
		(NoiQuy.SoDiemTru * DanhGia.SoLanViPham) AS TongDiembiTru
	FROM DanhGia
	INNER JOIN NoiQuy
	ON DanhGia.MaNQ = NoiQuy.MaNQ
	WHERE DanhGia.TenLop = @TenLop
	RETURN;
END;

GO
/****** Object:  Table [dbo].[ChiTietTKB]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietTKB](
	[MaTKB] [varchar](20) NOT NULL,
	[MaMonHoc] [varchar](20) NOT NULL,
	[TenMon] [nvarchar](20) NOT NULL,
	[Thu] [nvarchar](20) NOT NULL,
	[TietBatDau] [int] NOT NULL,
	[TietKetThuc] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTKB] ASC,
	[MaMonHoc] ASC,
	[Thu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DanhGia](
	[MaNQ] [varchar](20) NOT NULL,
	[TenLop] [nvarchar](20) NOT NULL,
	[SoLanViPham] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNQ] ASC,
	[TenLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DanhHieu]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DanhHieu](
	[MaHS] [varchar](20) NOT NULL,
	[NamHoc] [int] NOT NULL,
	[HK1] [nvarchar](20) NULL,
	[HK2] [nvarchar](20) NULL,
	[CaNam] [nvarchar](20) NULL,
	[XepHang] [int] NULL,
	[DiemHK1] [float] NOT NULL,
	[DiemHK2] [float] NOT NULL,
	[DiemCaNam] [float] NOT NULL,
	[HanhKiemHK1] [nvarchar](20) NOT NULL,
	[HanhKiemHK2] [nvarchar](20) NOT NULL,
	[HanhKiemCaNam] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC,
	[NamHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Day]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Day](
	[MaGV] [varchar](20) NOT NULL,
	[MaMonHoc] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC,
	[MaMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Diem]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Diem](
	[NamHoc] [int] NOT NULL,
	[HocKy] [int] NOT NULL,
	[MaHS] [varchar](20) NOT NULL,
	[MaMH] [varchar](20) NOT NULL,
	[SoLanKTThuongXuyen] [int] NOT NULL,
	[KTThuongXuyen] [float] NOT NULL,
	[KTGiuaKy] [float] NOT NULL,
	[KTCuoiKy] [float] NOT NULL,
	[DiemTBMon] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NamHoc] ASC,
	[HocKy] ASC,
	[MaHS] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GiaoVien]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GiaoVien](
	[MaGV] [varchar](20) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](20) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SDT] [varchar](20) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HocSinh]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HocSinh](
	[MaHS] [varchar](20) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [nvarchar](20) NOT NULL,
	[TenLop] [nvarchar](20) NOT NULL,
	[SoDT] [varchar](20) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[NamHoc] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lop](
	[TenLop] [nvarchar](20) NOT NULL,
	[MaGVCN] [varchar](20) NULL,
	[SiSoLop] [int] NOT NULL,
	[NienKhoa] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMonHoc] [varchar](20) NOT NULL,
	[TenMonHoc] [nvarchar](20) NOT NULL,
	[SoTietDay] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TenMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NamHoc]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NamHoc](
	[Nam] [int] NOT NULL,
	[NgayBatDau] [date] NOT NULL,
	[NgayKetThuc] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [varchar](20) NOT NULL,
	[MaUngDung] [varchar](20) NOT NULL,
	[LoaiNguoiDung] [int] NOT NULL,
	[TenDangNhap] [varchar](20) NOT NULL,
	[MatKhau] [varchar](20) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [nvarchar](20) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[SoDT] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NguoiQuanLy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiQuanLy](
	[MaNQL] [varchar](20) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](20) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SDT] [varchar](20) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[ChucVu] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNQL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NoiQuy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NoiQuy](
	[MaNQ] [varchar](20) NOT NULL,
	[DieuLe] [nvarchar](50) NOT NULL,
	[SoDiemTru] [int] NOT NULL,
	[NamHoc] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[MaHS] [varchar](20) NOT NULL,
	[MaGV] [varchar](20) NOT NULL,
	[NoiDungPhanHoi] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC,
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuyDinh]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuyDinh](
	[MaNQL] [varchar](20) NOT NULL,
	[MaNQ] [varchar](20) NOT NULL,
	[NgayBanHanh] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThiDua]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThiDua](
	[TenLop] [nvarchar](20) NOT NULL,
	[DiemTongKet] [float] NOT NULL,
	[XepHang] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThoiKhoaBieu]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThoiKhoaBieu](
	[MaTKB] [varchar](20) NOT NULL,
	[TenLop] [nvarchar](20) NOT NULL,
	[HocKy] [int] NOT NULL,
	[Nam] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTKB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TuyenSinh]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TuyenSinh](
	[MaHoSo] [varchar](20) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](20) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SoDT] [varchar](20) NOT NULL,
	[DiemTuyenSinh] [float] NOT NULL,
	[TruongHocCu] [nvarchar](20) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UngDung]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UngDung](
	[MaUD] [varchar](20) NOT NULL,
	[TenUngDung] [nvarchar](20) NOT NULL,
	[PhienBan] [varchar](50) NOT NULL,
	[DungLuong] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaUD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[TimHocSinh]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Trả tất cả học sinh dựa trên kí tự tìm kiếm
CREATE FUNCTION [dbo].[TimHocSinh](@KiTu nvarchar(100))
RETURNS TABLE
AS
RETURN(
	SELECT MaHS, HoTen, NgaySinh, GioiTinh, SoDT, TenLop, NamHoc, DiaChi
	FROM HocSinh
	WHERE
		CONCAT(MaHS, HoTen, NgaySinh, GioiTinh, TenLop, SoDT, DiaChi, NamHoc) LIKE '%' + @KiTu + '%' 
);

GO
/****** Object:  UserDefinedFunction [dbo].[TimHocSinhTrongLop]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Tìm học sinh trong lớp với kí tự tìm kiếm
CREATE FUNCTION [dbo].[TimHocSinhTrongLop](@MaGV varchar(20), @KiTu nvarchar(100))
RETURNS TABLE
AS
RETURN(
	SELECT * FROM dbo.TimHocSinh(@KiTu)
	WHERE TenLop = (SELECT TenLop FROM Lop WHERE MaGVCN = @MaGV)
);

GO
/****** Object:  UserDefinedFunction [dbo].[LayNguoiDung]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[LayNguoiDung](@MaNguoiDung varchar(20))
RETURNS TABLE
AS
RETURN(
	SELECT HoTen, NgaySinh, GioiTinh, SoDT, TenDangNhap, MatKhau, DiaChi
	FROM NguoiDung
	WHERE MaNguoiDung = @MaNguoiDung
);

GO
/****** Object:  UserDefinedFunction [dbo].[TimDiemLopCaNam]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[TimDiemLopCaNam](@TenLop varchar(20), @NamHoc int, @KiTu nvarchar(50))
RETURNS TABLE
AS
RETURN(
    SELECT HocSinh.MaHS,
           HocSinh.HoTen,
           MonHoc.TenMonHoc,
           ROUND(AVG(Diem.DiemTBMon), 1) AS DiemTB
    FROM HocSinh
    INNER JOIN Diem ON HocSinh.MaHS = Diem.MaHS
    INNER JOIN MonHoc ON Diem.MaMH = MonHoc.MaMonHoc
    WHERE HocSinh.TenLop = @TenLop
        AND Diem.NamHoc = @NamHoc
    GROUP BY MonHoc.TenMonHoc, HocSinh.MaHS, HocSinh.HoTen
    HAVING CONCAT(HocSinh.MaHS, HocSinh.HoTen, MonHoc.TenMonHoc, ROUND(AVG(Diem.DiemTBMon), 1)) LIKE '%' + @KiTu + '%'
);

GO
/****** Object:  UserDefinedFunction [dbo].[TimDiemTruongCaNam]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[TimDiemTruongCaNam](@NamHoc int, @KiTu nvarchar(20))
RETURNS TABLE
AS
RETURN(
	SELECT 
		DanhHieu.MaHS,
		HocSinh.TenLop,
		HocSinh.HoTen,
		DanhHieu.DiemCaNam,
		DanhHieu.HanhKiemCaNam,
		DanhHieu.CaNam,
		DanhHieu.XepHang
	FROM DanhHieu
	INNER JOIN HocSinh
	ON HocSinh.MaHS = DanhHieu.MaHS
	WHERE CONCAT(DanhHieu.MaHS,
		HocSinh.TenLop,
		HocSinh.HoTen,
		DanhHieu.DiemCaNam,
		DanhHieu.HanhKiemCaNam,
		DanhHieu.CaNam,
		DanhHieu.XepHang
		) LIKE '%' + @KiTu + '%'
		AND DanhHieu.NamHoc = @NamHoc
);

GO
/****** Object:  UserDefinedFunction [dbo].[TimDiemTruongHocKy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[TimDiemTruongHocKy](@HocKy int, @NamHoc int, @KiTu nvarchar(20))
RETURNS TABLE
AS
RETURN(
	SELECT
		DanhHieu.MaHS,
		HocSinh.TenLop,
		HocSinh.HoTen,
		CASE
		WHEN @HocKy = 1 THEN DanhHieu.DiemHK1
		WHEN @HocKy = 2 THEN DanhHieu.DiemHK2
		END AS TrungBinhMon,
		CASE
		WHEN @HocKy = 1 THEN DanhHieu.HanhKiemHK1
		WHEN @HocKy = 2 THEN DanhHieu.HanhKiemHK2
		END AS HanhKiem,
		CASE
		WHEN @HocKy = 1 THEN DanhHieu.HK1
		WHEN @HocKy = 2 THEN DanhHieu.HK2
		END AS DanhHieu
	FROM DanhHieu
	INNER JOIN HocSinh
	ON HocSinh.MaHS = DanhHieu.MaHS
	WHERE
		CONCAT(DanhHieu.MaHS,
               HocSinh.TenLop,
               HocSinh.HoTen,
               CASE
                   WHEN @HocKy = 1 THEN DanhHieu.DiemHK1
                   WHEN @HocKy = 2 THEN DanhHieu.DiemHK2
               END,
               CASE
                   WHEN @HocKy = 1 THEN DanhHieu.HanhKiemHK1
                   WHEN @HocKy = 2 THEN DanhHieu.HanhKiemHK2
               END,
               CASE
                   WHEN @HocKy = 1 THEN DanhHieu.HK1
                   WHEN @HocKy = 2 THEN DanhHieu.HK2
               END
        ) LIKE '%' + @KiTu + '%'
		AND DanhHieu.NamHoc = @NamHoc
);

GO
/****** Object:  UserDefinedFunction [dbo].[TimNoiQuy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[TimNoiQuy](@KiTu nvarchar(50))
RETURNS TABLE
AS
RETURN(
SELECT
	QuyDinh.MaNQL,
	NguoiQuanLy.HoTen,
	NoiQuy.DieuLe,
	NoiQuy.SoDiemTru,
	QuyDinh.NgayBanHanh
FROM NoiQuy
INNER JOIN QuyDinh
ON NoiQuy.MaNQ = QuyDinh.MaNQ
INNER JOIN NguoiQuanLy
ON QuyDinh.MaNQL  = NguoiQuanLy.MaNQL
WHERE CONCAT(
	QuyDinh.MaNQL,
	NguoiQuanLy.HoTen,
	NoiQuy.DieuLe,
	NoiQuy.SoDiemTru,
	QuyDinh.NgayBanHanh)
	LIKE '%' + @KiTu + '%'
);

GO
/****** Object:  UserDefinedFunction [dbo].[TimPhanCong]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[TimPhanCong](@KiTu nvarchar(50))
RETURNS TABLE
AS
RETURN(
SELECT Day.MaGV, GiaoVien.HoTen, Day.MaMonHoc, MonHoc.TenMonHoc
FROM Day INNER JOIN GiaoVien
ON Day.MaGV = GiaoVien.MaGV
INNER JOIN MonHoc ON day.MaMonHoc = MonHoc.MaMonHoc
WHERE CONCAT(Day.MaGV, GiaoVien.HoTen, Day.MaMonHoc, MonHoc.TenMonHoc)
LIKE '%' + @KiTu + '%'
);

GO
/****** Object:  UserDefinedFunction [dbo].[TraDTK_XepHang_ThiDua]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[TraDTK_XepHang_ThiDua](@TenLop varchar(20))
RETURNS TABLE
AS
RETURN(
	SELECT DiemTongKet, XepHang
	FROM ThiDua
	WHERE TenLop = @TenLop
);

GO
/****** Object:  UserDefinedFunction [dbo].[XemAdmin]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[XemAdmin](@MaNQL varchar(20))
RETURNS TABLE
AS
RETURN(
	SELECT MaNQL, HoTen, NgaySinh, GioiTinh, SDT, ChucVu, DiaChi
	FROM NguoiQuanLy WHERE MaNQL = @MaNQL
);

GO
/****** Object:  UserDefinedFunction [dbo].[XemDanhHieuCaNhanCaNam]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xem danh hiệu cả năm của học sinh
CREATE FUNCTION [dbo].[XemDanhHieuCaNhanCaNam](@MaHS varchar(20), @NamHoc int)
RETURNS TABLE
AS
RETURN(
	SELECT DiemCaNam, HanhKiemCaNam, CaNam, XepHang
	FROM DanhHieu
	WHERE MaHS = @MaHS AND NamHoc = @NamHoc
);

GO
/****** Object:  UserDefinedFunction [dbo].[XemDanhHieuCaNhanHocKy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Xem danh hiệu học kỳ của học sinh
CREATE FUNCTION [dbo].[XemDanhHieuCaNhanHocKy](@MaHS varchar(20), @KyHoc int, @NamHoc int)
RETURNS TABLE
AS
RETURN(
	SELECT 
	CASE
        WHEN @KyHoc = 1 THEN DiemHK1
        WHEN @KyHoc = 2 THEN DiemHK2
    END AS DiemHocKy,
    CASE
        WHEN @KyHoc = 1 THEN HanhKiemHK1
        WHEN @KyHoc = 2 THEN HanhKiemHK2
    END AS HanhKiemHocKy,
    CASE
        WHEN @KyHoc = 1 THEN HK1
        WHEN @KyHoc = 2 THEN HK2
	END AS DanhHieuHocSinh
	FROM DanhHieu WHERE MaHS = @MaHS AND NamHoc = @NamHoc
);

GO
/****** Object:  UserDefinedFunction [dbo].[XemDiemCaNhanCaNam]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Xem điểm cả năm của học sinh
CREATE FUNCTION [dbo].[XemDiemCaNhanCaNam](@MaHS varchar(20), @NamHoc int)
RETURNS TABLE
AS
RETURN(
	SELECT MonHoc.TenMonHoc, ROUND(AVG(Diem.DiemTBMon), 1) AS DiemTrungBinhNam
    FROM Diem INNER JOIN MonHoc ON Diem.MaMH = MonHoc.MaMonHoc
    WHERE Diem.MaHS = @MaHS AND Diem.NamHoc = @NamHoc
    GROUP BY MonHoc.TenMonHoc
);

GO
/****** Object:  UserDefinedFunction [dbo].[XemDiemLopCaNam]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Xem điểm trung bình môn của lớp cả năm
CREATE FUNCTION [dbo].[XemDiemLopCaNam](@TenLop varchar(20), @NamHoc int)
RETURNS TABLE
AS
RETURN(
	SELECT HocSinh.MaHS,
	       HocSinh.HoTen,
	       MonHoc.TenMonHoc,
	       ROUND(AVG(Diem.DiemTBMon), 1) AS DiemTB
	FROM HocSinh
	INNER JOIN Diem ON HocSinh.MaHS = Diem.MaHS
	INNER JOIN MonHoc ON Diem.MaMH = MonHoc.MaMonHoc
	WHERE HocSinh.TenLop = @TenLop
	      AND Diem.NamHoc = @NamHoc
	GROUP BY MonHoc.TenMonHoc, HocSinh.MaHS, HocSinh.HoTen
);

GO
/****** Object:  UserDefinedFunction [dbo].[XemDiemTruongCaNam]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[XemDiemTruongCaNam](@NamHoc int)
RETURNS TABLE
AS
RETURN(
	SELECT 
		DanhHieu.MaHS,
		HocSinh.TenLop,
		HocSinh.HoTen,
		DanhHieu.DiemCaNam,
		DanhHieu.HanhKiemCaNam,
		DanhHieu.CaNam,
		DanhHieu.XepHang
	FROM DanhHieu
	INNER JOIN HocSinh
	ON HocSinh.MaHS = DanhHieu.MaHS
	WHERE DanhHieu.NamHoc = @NamHoc
);

GO
/****** Object:  UserDefinedFunction [dbo].[XemDiemTruongHocKy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[XemDiemTruongHocKy](@HocKy int, @NamHoc int)
RETURNS TABLE
AS
RETURN(
	SELECT 
		DanhHieu.MaHS,
		HocSinh.TenLop,
		HocSinh.HoTen,
		CASE
		WHEN @HocKy = 1 THEN DanhHieu.DiemHK1
		WHEN @HocKy = 2 THEN DanhHieu.DiemHK2
		END AS TrungBinhMon,
		CASE
		WHEN @HocKy = 1 THEN DanhHieu.HanhKiemHK1
		WHEN @HocKy = 2 THEN DanhHieu.HanhKiemHK2
		END AS HanhKiem,
		CASE
		WHEN @HocKy = 1 THEN DanhHieu.HK1
		WHEN @HocKy = 2 THEN DanhHieu.HK2
		END AS DanhHieu
	FROM DanhHieu
	INNER JOIN HocSinh
	ON HocSinh.MaHS = DanhHieu.MaHS
	WHERE DanhHieu.NamHoc = @NamHoc
);

GO
/****** Object:  UserDefinedFunction [dbo].[XemPhanHoi]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[XemPhanHoi](@MaGV varchar(20))
RETURNS TABLE
AS
RETURN(
SELECT HocSinh.MaHS, HocSinh.HoTen, HocSinh.TenLop, PhanHoi.NoiDungPhanHoi
FROM PhanHoi INNER JOIN HocSinh
ON PhanHoi.MaHS = HocSinh.MaHS
WHERE PhanHoi.MaGV = @MaGV
);

GO
/****** Object:  UserDefinedFunction [dbo].[XemTTCaNhan]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xem thông tin cá nhân của bản thân học sinh
CREATE FUNCTION [dbo].[XemTTCaNhan](@MaHS varchar(20))
RETURNS TABLE
AS
RETURN(
	SELECT MaHS, HoTen, NgaySinh, GioiTinh, SoDT, TenLop, NamHoc, DiaChi
	FROM HocSinh WHERE MaHS = @MaHS
);

GO
/****** Object:  UserDefinedFunction [dbo].[XemTTLop]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Xem thông tin học sinh của lớp
CREATE FUNCTION [dbo].[XemTTLop](@MaGV varchar(20))
RETURNS TABLE
AS
RETURN(
	SELECT HS.MaHS, HS.HoTen, HS.NgaySinh, HS.GioiTinh, HS.SoDT, HS.TenLop, HS.NamHoc, HS.DiaChi
	FROM HocSinh AS HS
	INNER JOIN Lop ON HS.TenLop = Lop.TenLop
	WHERE Lop.MaGVCN = @MaGV
);

GO
/****** Object:  View [dbo].[LayNoiQuy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[LayNoiQuy]
AS
SELECT DieuLe
FROM NoiQuy

GO
/****** Object:  View [dbo].[TraDanhSachMon]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TraDanhSachMon] AS
SELECT TenMonHoc FROM MonHoc

GO
/****** Object:  View [dbo].[TraGiaoVien]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TraGiaoVien] AS
SELECT TOP 10 MaNguoiDung, HoTen
FROM NguoiDung WHERE LoaiNguoiDung = 2;

GO
/****** Object:  View [dbo].[XemDanhSachLopNhapHoc]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[XemDanhSachLopNhapHoc]
AS
SELECT TenLop FROM Lop WHERE TenLop LIKE '%10A%';

GO
/****** Object:  View [dbo].[XemDanhSachNhapHoc]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[XemDanhSachNhapHoc]
AS
SELECT MaHoSo, HoTen, TruongHocCu, DiemTuyenSinh
FROM TuyenSinh
WHERE DiemTuyenSinh >= 26 AND MaHoSo NOT IN (SELECT MaHS FROM HocSinh)

GO
/****** Object:  View [dbo].[XemHocSinh]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---Xem học sinh của admin
CREATE VIEW [dbo].[XemHocSinh] AS
SELECT MaHS, HoTen, NgaySinh, GioiTinh, SoDT, TenLop, NamHoc, DiaChi
FROM HocSinh

GO
/****** Object:  View [dbo].[XemNoiQuy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[XemNoiQuy]
AS
SELECT
	QuyDinh.MaNQL,
	NguoiQuanLy.HoTen,
	NoiQuy.DieuLe,
	NoiQuy.SoDiemTru,
	QuyDinh.NgayBanHanh
FROM NoiQuy
INNER JOIN QuyDinh
ON NoiQuy.MaNQ = QuyDinh.MaNQ
INNER JOIN NguoiQuanLy
ON QuyDinh.MaNQL  = NguoiQuanLy.MaNQL

GO
/****** Object:  View [dbo].[XemPhanCong]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[XemPhanCong] AS
SELECT Day.MaGV, GiaoVien.HoTen, Day.MaMonHoc, MonHoc.TenMonHoc
FROM Day INNER JOIN GiaoVien
ON Day.MaGV = GiaoVien.MaGV
INNER JOIN MonHoc ON day.MaMonHoc = MonHoc.MaMonHoc

GO
/****** Object:  View [dbo].[XemThiDuaCaTruong]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[XemThiDuaCaTruong] AS
SELECT * FROM ThiDua

GO
ALTER TABLE [dbo].[ChiTietTKB]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietTKB_MaMonHoc] FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MonHoc] ([MaMonHoc])
GO
ALTER TABLE [dbo].[ChiTietTKB] CHECK CONSTRAINT [FK_ChiTietTKB_MaMonHoc]
GO
ALTER TABLE [dbo].[ChiTietTKB]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietTKB_MaTKB] FOREIGN KEY([MaTKB])
REFERENCES [dbo].[ThoiKhoaBieu] ([MaTKB])
GO
ALTER TABLE [dbo].[ChiTietTKB] CHECK CONSTRAINT [FK_ChiTietTKB_MaTKB]
GO
ALTER TABLE [dbo].[ChiTietTKB]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietTKB_TenMon] FOREIGN KEY([TenMon])
REFERENCES [dbo].[MonHoc] ([TenMonHoc])
GO
ALTER TABLE [dbo].[ChiTietTKB] CHECK CONSTRAINT [FK_ChiTietTKB_TenMon]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_MaNQ] FOREIGN KEY([MaNQ])
REFERENCES [dbo].[NoiQuy] ([MaNQ])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_MaNQ]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_TenLop] FOREIGN KEY([TenLop])
REFERENCES [dbo].[ThiDua] ([TenLop])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_TenLop]
GO
ALTER TABLE [dbo].[DanhHieu]  WITH CHECK ADD  CONSTRAINT [FK_DanhHieu_MaHS] FOREIGN KEY([MaHS])
REFERENCES [dbo].[HocSinh] ([MaHS])
GO
ALTER TABLE [dbo].[DanhHieu] CHECK CONSTRAINT [FK_DanhHieu_MaHS]
GO
ALTER TABLE [dbo].[DanhHieu]  WITH CHECK ADD  CONSTRAINT [FK_DanhHieu_NamHoc] FOREIGN KEY([NamHoc])
REFERENCES [dbo].[NamHoc] ([Nam])
GO
ALTER TABLE [dbo].[DanhHieu] CHECK CONSTRAINT [FK_DanhHieu_NamHoc]
GO
ALTER TABLE [dbo].[Day]  WITH CHECK ADD  CONSTRAINT [FK_Day_MaGV] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiaoVien] ([MaGV])
GO
ALTER TABLE [dbo].[Day] CHECK CONSTRAINT [FK_Day_MaGV]
GO
ALTER TABLE [dbo].[Day]  WITH CHECK ADD  CONSTRAINT [FK_Day_MaMonHoc] FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MonHoc] ([MaMonHoc])
GO
ALTER TABLE [dbo].[Day] CHECK CONSTRAINT [FK_Day_MaMonHoc]
GO
ALTER TABLE [dbo].[Diem]  WITH CHECK ADD  CONSTRAINT [FK_Diem_MaHS] FOREIGN KEY([MaHS])
REFERENCES [dbo].[HocSinh] ([MaHS])
GO
ALTER TABLE [dbo].[Diem] CHECK CONSTRAINT [FK_Diem_MaHS]
GO
ALTER TABLE [dbo].[Diem]  WITH CHECK ADD  CONSTRAINT [FK_Diem_MaMH] FOREIGN KEY([MaMH])
REFERENCES [dbo].[MonHoc] ([MaMonHoc])
GO
ALTER TABLE [dbo].[Diem] CHECK CONSTRAINT [FK_Diem_MaMH]
GO
ALTER TABLE [dbo].[Diem]  WITH CHECK ADD  CONSTRAINT [FK_Diem_NamHoc] FOREIGN KEY([NamHoc])
REFERENCES [dbo].[NamHoc] ([Nam])
GO
ALTER TABLE [dbo].[Diem] CHECK CONSTRAINT [FK_Diem_NamHoc]
GO
ALTER TABLE [dbo].[GiaoVien]  WITH CHECK ADD  CONSTRAINT [FK_GiaoVien_MaGV] FOREIGN KEY([MaGV])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[GiaoVien] CHECK CONSTRAINT [FK_GiaoVien_MaGV]
GO
ALTER TABLE [dbo].[HocSinh]  WITH CHECK ADD  CONSTRAINT [FK_HocSinh_MaHS] FOREIGN KEY([MaHS])
REFERENCES [dbo].[TuyenSinh] ([MaHoSo])
GO
ALTER TABLE [dbo].[HocSinh] CHECK CONSTRAINT [FK_HocSinh_MaHS]
GO
ALTER TABLE [dbo].[HocSinh]  WITH CHECK ADD  CONSTRAINT [FK_HocSinh_NamHoc] FOREIGN KEY([NamHoc])
REFERENCES [dbo].[NamHoc] ([Nam])
GO
ALTER TABLE [dbo].[HocSinh] CHECK CONSTRAINT [FK_HocSinh_NamHoc]
GO
ALTER TABLE [dbo].[HocSinh]  WITH CHECK ADD  CONSTRAINT [FK_HocSinh_TenLop] FOREIGN KEY([TenLop])
REFERENCES [dbo].[Lop] ([TenLop])
GO
ALTER TABLE [dbo].[HocSinh] CHECK CONSTRAINT [FK_HocSinh_TenLop]
GO
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD  CONSTRAINT [FK_Lop_MaGVCN] FOREIGN KEY([MaGVCN])
REFERENCES [dbo].[GiaoVien] ([MaGV])
GO
ALTER TABLE [dbo].[Lop] CHECK CONSTRAINT [FK_Lop_MaGVCN]
GO
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD  CONSTRAINT [FK_Lop_NienKhoa] FOREIGN KEY([NienKhoa])
REFERENCES [dbo].[NamHoc] ([Nam])
GO
ALTER TABLE [dbo].[Lop] CHECK CONSTRAINT [FK_Lop_NienKhoa]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_MaUngDung] FOREIGN KEY([MaUngDung])
REFERENCES [dbo].[UngDung] ([MaUD])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_MaUngDung]
GO
ALTER TABLE [dbo].[NguoiQuanLy]  WITH CHECK ADD  CONSTRAINT [FK_NguoiQuanLy_MaNQL] FOREIGN KEY([MaNQL])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[NguoiQuanLy] CHECK CONSTRAINT [FK_NguoiQuanLy_MaNQL]
GO
ALTER TABLE [dbo].[NoiQuy]  WITH CHECK ADD  CONSTRAINT [FK_NoiQuy_NamHoc] FOREIGN KEY([NamHoc])
REFERENCES [dbo].[NamHoc] ([Nam])
GO
ALTER TABLE [dbo].[NoiQuy] CHECK CONSTRAINT [FK_NoiQuy_NamHoc]
GO
ALTER TABLE [dbo].[PhanHoi]  WITH CHECK ADD  CONSTRAINT [FK_PhanHoi_MaGV] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiaoVien] ([MaGV])
GO
ALTER TABLE [dbo].[PhanHoi] CHECK CONSTRAINT [FK_PhanHoi_MaGV]
GO
ALTER TABLE [dbo].[PhanHoi]  WITH CHECK ADD  CONSTRAINT [FK_PhanHoi_MaHS] FOREIGN KEY([MaHS])
REFERENCES [dbo].[HocSinh] ([MaHS])
GO
ALTER TABLE [dbo].[PhanHoi] CHECK CONSTRAINT [FK_PhanHoi_MaHS]
GO
ALTER TABLE [dbo].[QuyDinh]  WITH CHECK ADD  CONSTRAINT [FK_QuyDinh_MaNQ] FOREIGN KEY([MaNQ])
REFERENCES [dbo].[NoiQuy] ([MaNQ])
GO
ALTER TABLE [dbo].[QuyDinh] CHECK CONSTRAINT [FK_QuyDinh_MaNQ]
GO
ALTER TABLE [dbo].[QuyDinh]  WITH CHECK ADD  CONSTRAINT [FK_QuyDinh_MaNQL] FOREIGN KEY([MaNQL])
REFERENCES [dbo].[NguoiQuanLy] ([MaNQL])
GO
ALTER TABLE [dbo].[QuyDinh] CHECK CONSTRAINT [FK_QuyDinh_MaNQL]
GO
ALTER TABLE [dbo].[ThiDua]  WITH CHECK ADD  CONSTRAINT [FK_TenLop_TenLop] FOREIGN KEY([TenLop])
REFERENCES [dbo].[Lop] ([TenLop])
GO
ALTER TABLE [dbo].[ThiDua] CHECK CONSTRAINT [FK_TenLop_TenLop]
GO
ALTER TABLE [dbo].[ThoiKhoaBieu]  WITH CHECK ADD  CONSTRAINT [FK_ThoiKhoaBieu_Nam] FOREIGN KEY([Nam])
REFERENCES [dbo].[NamHoc] ([Nam])
GO
ALTER TABLE [dbo].[ThoiKhoaBieu] CHECK CONSTRAINT [FK_ThoiKhoaBieu_Nam]
GO
ALTER TABLE [dbo].[ThoiKhoaBieu]  WITH CHECK ADD  CONSTRAINT [FK_ThoiKhoaBieu_TenLop] FOREIGN KEY([TenLop])
REFERENCES [dbo].[Lop] ([TenLop])
GO
ALTER TABLE [dbo].[ThoiKhoaBieu] CHECK CONSTRAINT [FK_ThoiKhoaBieu_TenLop]
GO
ALTER TABLE [dbo].[TuyenSinh]  WITH CHECK ADD  CONSTRAINT [FK_TuyenSinh_MaHoSo] FOREIGN KEY([MaHoSo])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[TuyenSinh] CHECK CONSTRAINT [FK_TuyenSinh_MaHoSo]
GO
ALTER TABLE [dbo].[ChiTietTKB]  WITH CHECK ADD CHECK  (([TietKetThuc]>=[TietBatDau]))
GO
ALTER TABLE [dbo].[Diem]  WITH CHECK ADD CHECK  (([KTCuoiKy]>=(0) AND [KTCuoiKy]<=(10)))
GO
ALTER TABLE [dbo].[Diem]  WITH CHECK ADD CHECK  (([KTGiuaKy]>=(0) AND [KTGiuaKy]<=(10)))
GO
ALTER TABLE [dbo].[Diem]  WITH CHECK ADD CHECK  (([KTThuongXuyen]>=(0)))
GO
ALTER TABLE [dbo].[GiaoVien]  WITH CHECK ADD CHECK  ((len([MaGV])=(6)))
GO
ALTER TABLE [dbo].[GiaoVien]  WITH CHECK ADD CHECK  ((len([SDT])=(10)))
GO
ALTER TABLE [dbo].[HocSinh]  WITH CHECK ADD CHECK  ((len([MaHS])=(6)))
GO
ALTER TABLE [dbo].[HocSinh]  WITH CHECK ADD CHECK  ((len([SoDT])=(10)))
GO
ALTER TABLE [dbo].[NamHoc]  WITH CHECK ADD CHECK  (([NgayKetThuc]>[NgayBatDau]))
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD CHECK  ((len([MaNguoiDung])=(6)))
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD CHECK  ((len([SoDT])=(10)))
GO
ALTER TABLE [dbo].[NguoiQuanLy]  WITH CHECK ADD CHECK  ((len([MaNQL])=(6)))
GO
ALTER TABLE [dbo].[ThiDua]  WITH CHECK ADD CHECK  (([DiemTongKet]<=(100)))
GO
ALTER TABLE [dbo].[TuyenSinh]  WITH CHECK ADD CHECK  (([DiemTuyenSinh]>=(0) AND [DiemTuyenSinh]<=(50)))
GO
ALTER TABLE [dbo].[TuyenSinh]  WITH CHECK ADD CHECK  ((len([MaHoSo])=(6)))
GO
ALTER TABLE [dbo].[TuyenSinh]  WITH CHECK ADD CHECK  ((len([SoDT])=(10)))
GO
/****** Object:  StoredProcedure [dbo].[CapNhatAdmin]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CapNhatAdmin]
@MaNQL varchar(20),
@HoTen nvarchar(50),
@NgaySinh date,
@GioiTinh nvarchar(20),
@SDT varchar(20),
@DiaChi nvarchar(100)
AS
BEGIN
	IF (@SDT NOT LIKE '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
	BEGIN
		RAISERROR('Số điện thoại không hợp lệ', 16, 1);
		RETURN;
	END;
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE NguoiQuanLy
			SET HoTen = @HoTen, NgaySinh = @NgaySinh, GioiTinh = @GioiTinh, SDT = @SDT, DiaChi = @DiaChi
			WHERE MaNQL = @MaNQL;
			UPDATE NguoiDung
			SET HoTen = @HoTen, NgaySinh = @NgaySinh, GioiTinh = @GioiTinh, SoDT = @SDT, DiaChi = @DiaChi
			WHERE MaNguoiDung = @MaNQL;
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		DECLARE @Err nvarchar(MAX);
		SET @Err = N'Lỗi: ' + ERROR_MESSAGE();
		RAISERROR(@Err, 16, 1);
	END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[CapNhatDiemHocKy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CapNhatDiemHocKy]
@MaHS varchar(20),
@TenMon nvarchar(20),
@HocKy int,
@NamHoc int,
@ThuongXuyen varchar(20),
@GiuaKy varchar(20),
@CuoiKy varchar(20)
AS
BEGIN
	DECLARE @MaMH varchar(20), @TXF float, @GKF float, @CKF float;
	SELECT @MaMH = MaMonHoc FROM MonHoc WHERE TenMonHoc = @TenMon;
	BEGIN TRY
		IF RTRIM(LTRIM(@ThuongXuyen)) = ''
			RAISERROR('Kiểm tra thường xuyên không được để trống', 16, 1);
		SET @TXF = TRY_CONVERT(FLOAT, @ThuongXuyen);
		IF (@TXF IS NULL)
		BEGIN
			RAISERROR('Kiểm tra thường xuyên không đúng định dạng', 16, 1);
		END
		IF RTRIM(LTRIM(@GiuaKy)) = ''
			RAISERROR('Giữa kỳ không được để trống', 16, 1);
		SET @GKF = TRY_CONVERT(FLOAT, @GiuaKy);
		IF (@GKF IS NULL)
		BEGIN
			RAISERROR('Giữa kỳ không đúng định dạng', 16, 1);
		END
		IF RTRIM(LTRIM(@GiuaKy)) = ''
			RAISERROR('Giữa kỳ không được để trống', 16, 1);
		SET @CKF = TRY_CONVERT(FLOAT, @CuoiKy);
		IF (@CKF IS NULL)
		BEGIN
			RAISERROR('Cuối kỳ không đúng định dạng', 16, 1);
		END
	END TRY
	BEGIN CATCH
		DECLARE @Err nvarchar(MAX)
		SET @Err = N'Lỗi:  ' + ERROR_MESSAGE();
		RAISERROR(@err, 16, 1);
		RETURN;
	END CATCH
	BEGIN TRANSACTION
	BEGIN TRY
		UPDATE Diem
		SET KTThuongXuyen = @ThuongXuyen, KTGiuaKy = @GiuaKy, KTCuoiKy = @CuoiKy
		WHERE MaHS = @MaHS AND MaMH = @MaMH AND HocKy = @HocKy AND NamHoc = @NamHoc;
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SET @Err = N'Lỗi:  ' + ERROR_MESSAGE();
		RAISERROR(@err, 16, 1);
	END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[CapNhatGiaoVien]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CapNhatGiaoVien]
@MaGV varchar(20),
@HoTen nvarchar(50),
@NgaySinh date,
@GioiTinh nvarchar(20),
@SDT varchar(20),
@MonHoc nvarchar(20),
@DiaChi nvarchar(100)
AS
BEGIN
	DECLARE @MaMon varchar(20);
	SELECT @MaMon = MaMonHoc FROM MonHoc WHERE TenMonHoc = @MonHoc;
	IF (@SDT NOT LIKE '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
	BEGIN
		RAISERROR('Số điện thoại không hợp lệ', 16, 1);
		RETURN;
	END;
	BEGIN TRY
		BEGIN TRANSACTION
		UPDATE GiaoVien
		SET HoTen = @HoTen, NgaySinh = @NgaySinh, GioiTinh = @GioiTinh, SDT = @SDT, DiaChi = @DiaChi
		WHERE MaGV = @MaGV;
		UPDATE Day
		SET MaMonHoc = @MaMon WHERE MaGV = @MaGV;
		UPDATE NguoiDung
		SET HoTen = @HoTen, NgaySinh = @NgaySinh, GioiTinh = @GioiTinh, SoDT = @SDT, DiaChi = @DiaChi
		WHERE MaNguoiDung = @MaGV;
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		DECLARE @Err nvarchar(MAX);
		SET @Err = N'Lỗi: ' + ERROR_MESSAGE();
		RAISERROR(@Err, 16, 1);
	END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[CapNhatHocSinh]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CapNhatHocSinh]
@MaHS varchar(20),
@HoTen nvarchar(50),
@NgaySinh date,
@GioiTinh nvarchar(20),
@SoDienThoai varchar(20),
@DiaChi nvarchar(100)
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		IF (RTRIM(LTRIM(@SoDienThoai)) = '')
		BEGIN
			RAISERROR('Số điện thoại học sinh không được để trống', 16, 1);
		END
		IF (@SoDienThoai NOT LIKE '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
		BEGIN
			RAISERROR('Số điện thoại không hợp lệ', 16, 1);
		END
		UPDATE NguoiDung
		SET HoTen = @HoTen, NgaySinh = @NgaySinh, GioiTinh = @GioiTinh, SoDT = @SoDienThoai, DiaChi = @DiaChi
		WHERE MaNguoiDung = @MaHS;
		UPDATE TuyenSinh
		SET HoTen = @HoTen, NgaySinh = @NgaySinh, GioiTinh = @GioiTinh, SoDT = @SoDienThoai, DiaChi = @DiaChi
		WHERE MaHoSo = @MaHS;
		UPDATE HocSinh
		SET HoTen = @HoTen, NgaySinh = @NgaySinh, GioiTinh = @GioiTinh, SoDT = @SoDienThoai, DiaChi = @DiaChi
		WHERE MaHS = @MaHS;
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		DECLARE @Err nvarchar(MAX)
		SET @Err = N'Lỗi:  ' + ERROR_MESSAGE();
		RAISERROR(@err, 16, 1);
	END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[CapNhatNguoiDung]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CapNhatNguoiDung]
@MaNguoiDung varchar(20),
@HoTen nvarchar(50),
@NgaySinh date,
@GioiTinh nvarchar(20),
@DiaChi nvarchar(100),
@SoDT varchar(20)
AS
BEGIN
	IF (@SoDT NOT LIKE '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
	BEGIN
		RAISERROR('Số điện thoại không hợp lệ', 16, 1);
		RETURN;
	END
	BEGIN TRY
		BEGIN TRANSACTION
		UPDATE NguoiDung
		SET HoTen = @HoTen, NgaySinh = @NgaySinh, GioiTinh = @GioiTinh, DiaChi = @DiaChi, SoDT = @SoDT
		WHERE MaNguoiDung = @MaNguoiDung
		IF EXISTS(SELECT * FROM TuyenSinh WHERE MaHoSo = @MaNguoiDung)
			UPDATE TuyenSinh
			SET HoTen = @HoTen, NgaySinh = @NgaySinh, GioiTinh = @GioiTinh, DiaChi = @DiaChi, SoDT = @SoDT
			WHERE MaHoSo = @MaNguoiDung
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		DECLARE @Err nvarchar(MAX)
		SET @Err = N'Lỗi:  ' + ERROR_MESSAGE();
		RAISERROR(@err, 16, 1);
	END CATCH					
END;

GO
/****** Object:  StoredProcedure [dbo].[CapNhatNoiQuy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CapNhatNoiQuy]
@MaNguoiSua varchar(20),
@MaNQ varchar(20),
@DieuLe nvarchar(50),
@SoDiemTru varchar(20),
@NgayBanHanh date
AS
BEGIN
	BEGIN TRY
		DECLARE @SDTru int
		SET @SDTru = TRY_CONVERT(INT, @SoDiemTru);
		IF (@SDTru IS NULL)
		BEGIN
			RAISERROR('Số điểm trừ không đúng định dạng', 16, 1);
		END
	END TRY
	BEGIN CATCH
		DECLARE @Err nvarchar(MAX)
		SET @Err = N'Lỗi: ' + ERROR_MESSAGE();
		RAISERROR(@err, 16, 1);
		RETURN;
	END CATCH
	BEGIN TRY
		BEGIN TRANSACTION
		UPDATE NoiQuy
		SET DieuLe = @DieuLe, SoDiemTru = @SoDiemTru
		WHERE MaNQ = @MaNQ
		UPDATE QuyDinh
		SET MaNQL = @MaNguoiSua WHERE MaNQ = @MaNQ
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SET @Err = N'Lỗi: ' + ERROR_MESSAGE();
		RAISERROR(@err, 16, 1);
	END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[CapNhatNoiQuyLanDau]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CapNhatNoiQuyLanDau]
@MaNguoiSua varchar(20),
@MaNQL varchar(20),
@MaNQ varchar(20),
@DieuLe nvarchar(50),
@SoDiemTru varchar(20),
@NgayBanHanh date
AS
BEGIN
	IF(@MaNguoiSua <> @MaNQL)
	BEGIN
		RAISERROR('Lỗi: Nội Quy này là do Admin khác ban hành, bạn có chắc muốn sửa?',16, 1);
		RETURN;
	END;
	EXEC CapNhatNoiQuy @MaNguoiSua, @MaNQ, @DieuLe, @SoDiemTru, @NgayBanHanh;
END;

GO
/****** Object:  StoredProcedure [dbo].[CapNhatThiDua]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CapNhatThiDua]
@SoDiemTru int,
@MaNQ varchar(20)
AS
BEGIN
	DECLARE @BangTD TABLE(
	STT int,
	TenLop varchar(20),
	SoLanViPham int
	);
	INSERT INTO @BangTD
	SELECT 
    ROW_NUMBER() OVER (ORDER BY TenLop) AS STT,
    TenLop, 
    SoLanViPham 
	FROM DanhGia 
	WHERE MaNQ = @MaNQ;
	DECLARE @STT int = 1, @TenLop varchar(20), @SoLanViPham int;
	WHILE @STT <= (SELECT COUNT(*) FROM @BangTD)
	BEGIN
		SELECT @TenLop = TenLop, @SoLanViPham = SoLanViPham
		FROM @BangTD WHERE STT = @STT
		UPDATE ThiDua
		SET DiemTongKet = DiemTongKet - @SoDiemTru * @SoLanViPham
		WHERE TenLop = @TenLop
		SET @STT = @STT + 1
	END;
END;

GO
/****** Object:  StoredProcedure [dbo].[ChonMonDay]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ChonMonDay]
@MaGV varchar(20),
@TenMon nvarchar(20)
AS
BEGIN
	BEGIN TRY
		INSERT INTO Day VALUES(@MaGV, (SELECT MaMonHoc FROM MonHoc WHERE TenMonHoc =@TenMon));
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		DECLARE @Err nvarchar(MAX);
		SET @Err = N'Lỗi: ' + ERROR_MESSAGE();
		RAISERROR(@Err, 16, 1);
	END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[DoiMatKhau]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DoiMatKhau]
@TenDangNhap varchar(20),
@SoDT varchar (10),
@MatKhau varchar(20),
@XacNhanMatKhau varchar(20)
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM NguoiDung WHERE TenDangNhap = @TenDangNhap AND SoDT = @SoDT)
	BEGIN
		RAISERROR('Số điện thoại và tên đăng nhập không trùng khớp', 16, 1);
		RETURN
	END
	IF @MatKhau <> @XacNhanMatKhau
	BEGIN
        RAISERROR('Mật khẩu không khớp.', 16, 1);
		RETURN
	END
    UPDATE NguoiDung
    SET MatKhau = @MatKhau
    WHERE TenDangNhap = @TenDangNhap;
END;

GO
/****** Object:  StoredProcedure [dbo].[GuiPhanHoi]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GuiPhanHoi]
@MaHS varchar(20),
@MaGV varchar(20),
@NoiDung nvarchar(50)
AS
BEGIN
	IF EXISTS(SELECT * FROM PhanHoi WHERE MaHS = @MaHS AND MaGV = @MaGV)
	BEGIN
		RAISERROR('Bạn đã gửi phản hồi cho giáo viên này' ,16, 1);
		RETURN;
	END;
	ELSE IF(LEN(@NoiDung) = 0)
	BEGIN
		RAISERROR('Không được để trống nội dung phản hồi' ,16, 1);
		RETURN;
	END;
	INSERT INTO PhanHoi VALUES(@MaHS, @MaGV, @NoiDung);
END;

GO
/****** Object:  StoredProcedure [dbo].[GuiTuyenSinh]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GuiTuyenSinh]
@MaHoSo varchar(20),
@DiemToan varchar(20),
@DiemVan varchar(20),
@DiemAnh varchar(20),
@TruongHocCu nvarchar(20)
AS
BEGIN
	IF EXISTS (SELECT * FROM TuyenSinh WHERE MaHoSo = @MaHoSo)
	BEGIN
		RAISERROR('Bạn đã gửi hồ sơ trước đó', 16, 1);
		RETURN;
	END;
	DECLARE @HoTen nvarchar(50), @GioiTinh nvarchar(20), @NgaySinh date, @SDT varchar(20),
	@DiaChi nvarchar(100), @DiemT FLOAT, @DiemV FLOAT, @DiemA FLOAT, @DiemTuyenSinh FLOAT
	SELECT @HoTen = HoTen, @GioiTinh = GioiTinh, @NgaySinh = NgaySinh, @SDT = SoDT, @DiaChi = DiaChi
	FROM NguoiDung WHERE MaNguoiDung = @MaHoSo;
	IF RTRIM(LTRIM(@DiemToan)) = ''
	BEGIN
		RAISERROR('Điểm Toán không được để trống', 16, 1);
		RETURN;
	END;
	SET @DiemT = TRY_CONVERT(FLOAT, @DiemToan);
	IF (@DiemT IS NULL)
	BEGIN
		RAISERROR('Điểm Toán không đúng định dạng', 16, 1);
		RETURN;
	END;
	IF RTRIM(LTRIM(@DiemVan)) = ''
	BEGIN
		RAISERROR('Điểm Văn không được để trống', 16, 1);
		RETURN;
	END;
	SET @DiemV = TRY_CONVERT(FLOAT, @DiemVan);
	IF (@DiemV IS NULL)
	BEGIN
		RAISERROR('Điểm Văn không đúng định dạng', 16, 1);
		RETURN;
	END;
	IF RTRIM(LTRIM(@DiemAnh)) = ''
	BEGIN
		RAISERROR('Điểm Anh không được để trống', 16, 1);
		RETURN;
	END;
	SET @DiemA = TRY_CONVERT(FLOAT, @DiemAnh);
	IF (@DiemA IS NULL)
	BEGIN
		RAISERROR('Điểm Anh không đúng định dạng', 16, 1);
		RETURN;
	END;
	IF RTRIM(LTRIM(@TruongHocCu)) = ''
	BEGIN
		RAISERROR('Trường học không được để trống', 16, 1);
		RETURN;
	END;
	SET @DiemTuyenSinh = @DiemT * 2 + @DiemV * 2 + @DiemA;
	INSERT INTO TuyenSinh VALUES(@MaHoSo, @HoTen, @GioiTinh, @NgaySinh, @SDT, @DiemTuyenSinh, @TruongHocCu, @DiaChi);
END;

GO
/****** Object:  StoredProcedure [dbo].[KiemTraDiemTS]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[KiemTraDiemTS]
@MaHoSo varchar(20)
AS
BEGIN
	DECLARE @Err nvarchar(100) = N'Hồ sơ không đủ điều kiện nhập học. Lý do: Điểm ', @Diem FLOAT;
	SELECT @Diem = DiemTuyenSinh FROM TuyenSinh WHERE MaHoSo = @MaHoSo;
	IF (@Diem < 26)
	BEGIN
		SET @Err = @Err + CONVERT(nvarchar(50), @Diem) + N' < 26';
		RAISERROR(@Err, 16, 1);
		RETURN;
	END;
END;

GO
/****** Object:  StoredProcedure [dbo].[SuaDanhGia]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SuaDanhGia]
@TenLop varchar(20),
@MaNQ varchar(20),
@SLVP INT
AS
BEGIN
	UPDATE DanhGia
	SET SoLanViPham = @SLVP
	WHERE MaNQ = @MaNQ AND TenLop = @TenLop;
END;

GO
/****** Object:  StoredProcedure [dbo].[Them_LoaiNguoiDung]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Them_LoaiNguoiDung]
@TenDangNhap varchar(20),
@MatKhau varchar(20),
@HoTen nvarchar(50),
@NgaySinh date,
@GioiTinh nvarchar(20),
@DiaChi nvarchar(100),
@SoDT varchar(20),
@LoaiNguoiDung int
AS
BEGIN
	IF (@SoDT NOT LIKE '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
	BEGIN
		RAISERROR('Số điện thoại không hợp lệ', 16, 1);
		RETURN;
	END
	DECLARE @MaNguoiDung varchar(20), @STT INT, @MaUngDung varchar(20);
	SELECT @STT = COUNT(*) + 1 FROM NguoiDung;
	SET @MaNguoiDung = 'ND' + RIGHT('0000' + CAST(@STT AS varchar(4)), 4);
	SELECT @MaUngDung = MaUD FROM UngDung WHERE PhienBan = (SELECT COUNT(*) FROM UngDung)
	BEGIN TRY
		
		BEGIN TRANSACTION
		INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT)
		VALUES (@MaNguoiDung,@MaUngDung,@LoaiNguoiDung,@TenDangNhap,@MatKhau,@HoTen,@NgaySinh,@GioiTinh,@DiaChi,@SoDT);
		IF(@LoaiNguoiDung = 2)
			INSERT INTO GiaoVien VALUES(@MaNguoiDung, @HoTen, @GioiTinh, @NgaySinh, @SoDT, @DiaChi);
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		DECLARE @Err nvarchar(MAX)
		SET @Err = N'Lỗi:  ' + ERROR_MESSAGE();
		RAISERROR(@Err, 16, 1);
	END CATCH					
END;													

GO
/****** Object:  StoredProcedure [dbo].[ThemAdmin]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ThemAdmin]
@TenDN varchar(20),
@MatKhau varchar(20),
@HoTen nvarchar(50),
@NgaySinh date,
@GioiTinh nvarchar(20),
@DiaChi nvarchar(100),
@SDT varchar(20)
AS
BEGIN
	IF RTRIM(LTRIM(@TenDN)) = ''
	BEGIN
		RAISERROR('Tên đăng nhập không được để trống', 16, 1);
		RETURN;
	END;
	IF RTRIM(LTRIM(@MatKhau)) = ''
	BEGIN
		RAISERROR('Mật khẩu không được để trống', 16, 1);
		RETURN;
	END;
	IF RTRIM(LTRIM(@HoTen)) = ''
	BEGIN
		RAISERROR('Họ tên không được để trống', 16, 1);
		RETURN;
	END;
	IF RTRIM(LTRIM(@DiaChi)) = ''
	BEGIN
		RAISERROR('Địa chỉ không được để trống', 16, 1);
		RETURN;
	END;
	IF (@SDT NOT LIKE '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
	BEGIN
		RAISERROR('Số điện thoại không hợp lệ', 16, 1);
		RETURN;
	END
	BEGIN TRY
		EXEC Them_LoaiNguoiDung @TenDN, @MatKhau, @HoTen, @NgaySinh, @GioiTinh, @DiaChi, @SDT, 1;
		DECLARE @MaNQL varchar(20) = '';
		SET @MaNQL = (SELECT MaNguoiDung FROM NguoiDung WHERE TenDangNhap = @TenDN);
		INSERT INTO NguoiQuanLy VALUES(@MaNQL, @HoTen, @GioiTinh, @NgaySinh, @SDT, @DiaChi, N'Ban Giám Hiệu');
	END TRY
	BEGIN CATCH
		DECLARE @Err nvarchar(MAX);
		SET @Err = N'Lỗi: ' + ERROR_MESSAGE();
		RAISERROR(@Err, 16, 1);
	END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[ThemDanhGia]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ThemDanhGia]
@TenLop varchar(20),
@MaNQ varchar(20)
AS
BEGIN
	IF EXISTS(SELECT * FROM DanhGia WHERE MaNQ = @MaNQ AND TenLop = @TenLop)
	BEGIN
		DECLARE @SoLanViPham INT = (SELECT SoLanViPham FROM DanhGia WHERE MaNQ = @MaNQ AND TenLop = @TenLop) + 1;
		EXEC SuaDanhGia @TenLop, @MaNQ, @SoLanViPham;
	END;
	ELSE
		INSERT INTO DanhGia VALUES(@MaNQ, @TenLop, 1);
END;

GO
/****** Object:  StoredProcedure [dbo].[ThemDiem_DanhHieu]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ThemDiem_DanhHieu]
@MaHS varchar(20),
@NamHoc int
AS
BEGIN
	DECLARE @MaMon varchar(20), @KyHoc int;
	SET @KyHoc = 1;
	INSERT INTO DanhHieu(MaHS,NamHoc,DiemHK1,DiemHK2,DiemCaNam,HanhKiemHK1,HanhKiemHK2,HanhKiemCaNam,HK1,HK2,CaNam,XepHang)
	VALUES (@MaHS,@NamHoc,0, 0, 0,N'Tốt',N'Tốt',N'Tốt',N'Yếu',N'Yếu',N'Yếu',1);
	WHILE @KyHoc <= 2
	BEGIN
		DECLARE @STT int;
		SET @STT = 1;
		WHILE @STT <= 13
		BEGIN
			SET @MaMon = 'MH' + RIGHT('0' + CAST(@STT AS VARCHAR(2)), 2);
			INSERT INTO Diem(NamHoc,HocKy,MaHS,MaMH,SoLanKTThuongXuyen,KTThuongXuyen,KTGiuaKy,KTCuoiKy,DiemTBMon)
			VALUES (@NamHoc, @KyHoc, @MaHS, @MaMon, 0, 0, 0, 0, 0);
			SET @STT = @STT + 1
		END;
		SET @KyHoc = @KyHoc + 1
	END;
END;

GO
/****** Object:  StoredProcedure [dbo].[ThemHocSinhVaoLop]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ThemHocSinhVaoLop]
@MaHS varchar(20),
@TenLop varchar(20),
@NamHoc int
AS
BEGIN
	DECLARE @HoTen nvarchar(50), @NgaySinh date, @GioiTinh nvarchar(20), @SoDT varchar(20), @DiaChi nvarchar(100);
	SELECT @HoTen = HoTen, @NgaySinh = NgaySinh, @GioiTinh = GioiTinh, @SoDT = SoDT, @DiaChi = DiaChi
	FROM TuyenSinh WHERE MaHoSo = @MaHS;
	BEGIN TRY
		BEGIN TRANSACTION
		INSERT INTO HocSinh VALUES(@MaHS, @HoTen, @NgaySinh, @GioiTinh, @TenLop, @SoDT, @DiaChi, @NamHoc);
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		DECLARE @Err nvarchar(MAX);
		SET @Err = N'Lỗi: ' + ERROR_MESSAGE();
		RAISERROR(@Err, 16, 1);
	END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[ThemNoiQuy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ThemNoiQuy]
@MaNQL varchar(20),
@MaNQ varchar(20),
@DieuLe nvarchar(50),
@SoDiemTru varchar(20),
@NgayBanHanh date
AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT * FROM NoiQuy WHERE MaNQ = @MaNQ)
			RAISERROR('Mã nội quy đã tồn tại', 16, 1);
		DECLARE @SDTru int
		SET @SDTru = TRY_CONVERT(INT, @SoDiemTru);
		IF (@SDTru IS NULL)
		BEGIN
			RAISERROR('Số điểm trừ không đúng định dạng', 16, 1);
		END
	END TRY
	BEGIN CATCH
		DECLARE @Err nvarchar(MAX)
		SET @Err = N'Lỗi: ' + ERROR_MESSAGE();
		RAISERROR(@err, 16, 1);
		RETURN;
	END CATCH
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO NoiQuy VALUES(@MaNQ, @DieuLe, @SDTru, 2023);
		INSERT INTO QuyDinh VALUES(@MaNQL, @MaNQ, @NgayBanHanh);
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SET @Err = N'Lỗi:  ' + ERROR_MESSAGE();
		RAISERROR(@err, 16, 1);
	END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[XemLopTrongTruong]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[XemLopTrongTruong]
AS
BEGIN
	SELECT TenLop FROM Lop
END;

GO
/****** Object:  StoredProcedure [dbo].[XemTKB]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---Xem thời khóa biểu của học sinh
CREATE PROCEDURE [dbo].[XemTKB]
@TenLop varchar(20),
@KyHoc int
AS
BEGIN
    DECLARE @TKB TABLE
    (
        Tiet int,
        Thu2 nvarchar(20),
        Thu3 nvarchar(20),
        Thu4 nvarchar(20),
        Thu5 nvarchar(20),
        Thu6 nvarchar(20),
        Thu7 nvarchar(20)
    );
    DECLARE @MaTKB varchar(20), @Tiet int = 1;
    SET @MaTKB = dbo.TraTKB(@TenLop, @KyHoc);
    
    WHILE @Tiet <= 4
    BEGIN
        DECLARE @Thu2 nvarchar(20), @Thu3 nvarchar(20), @Thu4 nvarchar(20), 
                @Thu5 nvarchar(20), @Thu6 nvarchar(20), @Thu7 nvarchar(20);

        SELECT @Thu2 = TenMon FROM ChiTietTKB WHERE MaTKB = @MaTKB AND Thu = N'Thứ 2' AND (TietBatDau = @Tiet OR TietKetThuc = @Tiet);
        SELECT @Thu3 = TenMon FROM ChiTietTKB WHERE MaTKB = @MaTKB AND Thu = N'Thứ 3' AND (TietBatDau = @Tiet OR TietKetThuc = @Tiet);
        SELECT @Thu4 = TenMon FROM ChiTietTKB WHERE MaTKB = @MaTKB AND Thu = N'Thứ 4' AND (TietBatDau = @Tiet OR TietKetThuc = @Tiet);
        SELECT @Thu5 = TenMon FROM ChiTietTKB WHERE MaTKB = @MaTKB AND Thu = N'Thứ 5' AND (TietBatDau = @Tiet OR TietKetThuc = @Tiet);
        SELECT @Thu6 = TenMon FROM ChiTietTKB WHERE MaTKB = @MaTKB AND Thu = N'Thứ 6' AND (TietBatDau = @Tiet OR TietKetThuc = @Tiet);
        SELECT @Thu7 = TenMon FROM ChiTietTKB WHERE MaTKB = @MaTKB AND Thu = N'Thứ 7' AND (TietBatDau = @Tiet OR TietKetThuc = @Tiet);
        
        INSERT INTO @TKB
        VALUES (@Tiet, @Thu2, @Thu3, @Thu4, @Thu5, @Thu6, @Thu7);
        
        SET @Tiet = @Tiet + 1;
    END;
    
    SELECT * FROM @TKB;
END;

GO
/****** Object:  StoredProcedure [dbo].[XoaDanhGia]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[XoaDanhGia]
@TenLop varchar(20),
@MaNQ varchar(20)
AS
BEGIN
	DELETE FROM DanhGia WHERE TenLop = @TenLop AND MaNQ = @MaNQ;
END;

GO
/****** Object:  StoredProcedure [dbo].[XoaHocSinh]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[XoaHocSinh]
@MaHS varchar(20)
AS
BEGIN
	BEGIN TRY
		DECLARE @TenDN varchar(20), @sqlStr varchar(MAX), @SessionID INT;
		SELECT @TenDN = TenDangNhap FROM NguoiDung WHERE MaNguoiDung = @MaHS;
		SET NOCOUNT ON;
		SELECT @SessionID = session_id FROM sys.dm_exec_sessions WHERE login_name = @TenDN;
		IF @SessionID IS NOT NULL
		BEGIN
			SET @sqlStr = 'kill ' + CONVERT(NVARCHAR(20), @SessionID);
			EXEC(@sqlStr);
		END;
		BEGIN TRANSACTION
		DELETE FROM DanhHieu WHERE MaHS = @MaHS;
		DELETE FROM Diem WHERE MaHS = @MaHS;
		DELETE FROM HocSinh WHERE MaHS = @MaHS;
		DELETE FROM TuyenSinh WHERE MaHoSo = @MaHS;
		DELETE FROM NguoiDung WHERE MaNguoiDung = @MaHS;
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		DECLARE @Err nvarchar(100);
		SET @Err = N'Lỗi: ' + ERROR_MESSAGE();
		RAISERROR(@Err, 16, 1);
	END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[XoaHoSo]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[XoaHoSo]
@MaHoSo varchar(20)
AS
BEGIN
	DECLARE @Err nvarchar(MAX);
	IF NOT EXISTS(SELECT * FROM TuyenSinh WHERE MaHoSo = @MaHoSo)
	BEGIN
		SET @Err = N'Chưa có hồ sơ nào được gửi';
		RAISERROR(@Err, 16, 1);
		RETURN;
	END;
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE FROM TuyenSinh WHERE MaHoSo = @MaHoSo;
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SET @Err = 'Lỗi: ' + ERROR_MESSAGE();
		RAISERROR(@Err, 16, 1);
	END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[XoaMoiDuLieu]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[XoaMoiDuLieu]
AS
BEGIN
	DECLARE @STT INT = 1, @TenDN varchar(20), @sqlStr varchar(100);
	DECLARE @BangDN TABLE(
	STT INT, TenDN varchar(20)
	);
	INSERT INTO @BangDN 
	SELECT ROW_NUMBER() OVER (ORDER BY MaNguoiDung) AS STT, TenDangNhap FROM NguoiDung;
	WHILE @STT <= (SELECT COUNT(*) FROM @BangDN)
	BEGIN
		SET @TenDN = (SELECT TenDN FROM @BangDN WHERE STT = @STT);
		IF EXISTS(SELECT * FROM sys.database_principals WHERE type_desc IN ('SQL_USER', 'WINDOWS_USER', 'WINDOWS_GROUP') AND name = @TenDN)
		BEGIN
			SET @sqlStr = 'DROP USER ' + @TenDN;
			EXEC (@sqlStr);
		END;
		IF EXISTS(SELECT * FROM sys.sql_logins WHERE name = @TenDN)
		BEGIN
			SET @sqlStr = 'DROP LOGIN ' + @TenDN;
			EXEC (@sqlStr);
		END;
		SET @STT = @STT + 1;
	END;
END;

GO
/****** Object:  StoredProcedure [dbo].[XoaNguoiDung]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[XoaNguoiDung]
@MaNguoiDung varchar(20)
AS
BEGIN
	IF EXISTS(SELECT * FROM TuyenSinh WHERE MaHoSo = @MaNguoiDung)
	BEGIN
		RAISERROR('Vui lòng xóa hồ sơ đã gửi', 16, 1);
		RETURN;
	END;
	DELETE FROM NguoiDung WHERE MaNguoiDung = @MaNguoiDung;
END;

GO
/****** Object:  StoredProcedure [dbo].[XoaNoiQuy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[XoaNoiQuy]
@MaNQ varchar(20)
AS
BEGIN
	IF EXISTS(SELECT * FROM DanhGia WHERE MaNQ = @MaNQ)
	BEGIN
		RAISERROR('Lỗi: Đang có lớp bị vi phạm lỗi này', 16, 1);
		RETURN;
	END;
	DELETE FROM QuyDinh WHERE MaNQ = @MaNQ;
	DELETE FROM NoiQuy WHERE MaNQ = @MaNQ;
END;

GO
/****** Object:  StoredProcedure [dbo].[XoaPhanHoi]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[XoaPhanHoi]
@MaHS varchar(20),
@MaGV varchar(20)
AS
BEGIN
	DELETE FROM PhanHoi WHERE MaGV = @MaGV AND MaHS = @MaHS;
END;

GO
/****** Object:  Trigger [dbo].[TinhDiem_ThiDua]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--c.Trigger tính điểm thi đua của lớp
CREATE TRIGGER [dbo].[TinhDiem_ThiDua]
ON [dbo].[DanhGia]
AFTER INSERT
AS
BEGIN
	Declare @newMaNQ varchar(20), @newLop nvarchar(20), @newSLVP int;
	Select @newMaNQ = new.MaNQ, @newLop = new.TenLop, @newSLVP = new.SoLanViPham
	From inserted new
	Declare @diemTru int;
	SELECT @diemTru = NoiQuy.SoDiemTru
	FROM NoiQuy
	WHERE @newMaNQ = NoiQuy.MaNQ;
	UPDATE ThiDua
	SET DiemTongKet = DiemTongKet - @diemTru*@newSLVP Where @newLop = ThiDua.TenLop;
End;

GO
/****** Object:  Trigger [dbo].[TinhDiem_ThiDua_CapNhat]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- d.Trigger cho phép update tính điểm thi đua của lớp
CREATE TRIGGER [dbo].[TinhDiem_ThiDua_CapNhat]
ON [dbo].[DanhGia]
AFTER UPDATE
AS
BEGIN
	Declare @newMaNQ varchar(20), @newLop nvarchar(20), @newSLVP int, @oldSLVP int;
	Select @newMaNQ = new.MaNQ, @newLop = new.TenLop, @newSLVP = new.SoLanViPham, @oldSLVP = old.SoLanViPham
	From inserted new, deleted old
	Declare @diemTru int;
	SELECT @diemTru = NoiQuy.SoDiemTru
	FROM NoiQuy
	WHERE @newMaNQ = NoiQuy.MaNQ;
	UPDATE ThiDua
	SET DiemTongKet = DiemTongKet - @diemTru*(@newSLVP-@oldSLVP) Where @newLop = ThiDua.TenLop;
End;

GO
/****** Object:  Trigger [dbo].[TinhDiem_ThiDua_Xoa]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- e. Trigger Xóa tính điểm thi đua khi nhập nhầm lỗi vi phạm của lớp
CREATE TRIGGER [dbo].[TinhDiem_ThiDua_Xoa]
ON [dbo].[DanhGia]
AFTER DELETE
AS
BEGIN
	Declare @oldMaNQ varchar(20), @oldTenLop nvarchar(20), @oldSLVP int;
	Select @oldMaNQ = old.MaNQ, @oldTenLop = old.TenLop, @oldSLVP = old.SoLanViPham
	From deleted old
	Declare @diemTru int;
	SELECT @diemTru = NoiQuy.SoDiemTru
	FROM NoiQuy
	WHERE @oldMaNQ = NoiQuy.MaNQ;
	UPDATE ThiDua
	SET DiemTongKet = DiemTongKet + @diemTru*@oldSLVP Where @oldTenLop = ThiDua.TenLop;
End;

GO
/****** Object:  Trigger [dbo].[TuDong_XepHangDanhHieu]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[TuDong_XepHangDanhHieu]
ON [dbo].[DanhHieu]
FOR UPDATE
AS
BEGIN
	UPDATE dh
    SET XepHang = RankedDanhHieu.NewXepHang
    FROM DanhHieu dh
    INNER JOIN (
        SELECT MaHS, DENSE_RANK() OVER (ORDER BY DiemCaNam DESC) AS NewXepHang
        FROM DanhHieu
    ) AS RankedDanhHieu
    ON dh.MaHS = RankedDanhHieu.MaHS;
	UPDATE dh
    SET HK1 = CASE
        WHEN (i.DiemHK1 >= 8 AND i.HanhKiemHK1 = N'Tốt') THEN N'Giỏi'
        WHEN (i.DiemHK1 >= 6.5 AND (i.HanhKiemHK1 = N'Tốt' OR i.HanhKiemHK1 = N'Khá')) THEN N'Khá'
        WHEN ((i.DiemHK1 >= 5 AND i.DiemHK1 < 6.5) OR i.HanhKiemHK1 = N'Trung Bình') THEN N'Trung Bình'
        ELSE N'Yếu'
	END,
    HK2 = CASE
        WHEN (i.DiemHK2 >= 8 AND i.HanhKiemHK2 = N'Tốt') THEN N'Giỏi'
        WHEN (i.DiemHK2 >= 6.5 AND (i.HanhKiemHK2 = N'Tốt' OR i.HanhKiemHK2 = N'Khá')) THEN N'Khá'
        WHEN ((i.DiemHK2 >= 5 AND i.DiemHK2 < 6.5) OR i.HanhKiemHK2 = 'Trung Bình') THEN 'Trung Bình'
        ELSE N'Yếu'
    END,
    CaNam = CASE
        WHEN (i.DiemCaNam >= 8 AND i.HanhKiemCaNam = N'Tốt') THEN N'Giỏi'
        WHEN (i.DiemCaNam >= 6.5 AND (i.HanhKiemCaNam = N'Tốt' OR i.HanhKiemCaNam = N'Khá')) THEN N'Khá'
        WHEN ((i.DiemCaNam >= 5 AND i.DiemCaNam < 6.5) OR i.HanhKiemCaNam = N'Trung Bình') THEN N'Trung Bình'
        ELSE N'Yếu'
    END
    FROM DanhHieu dh
    JOIN inserted i ON dh.MaHS = i.MaHS AND dh.NamHoc = i.NamHoc;
END;

GO
/****** Object:  Trigger [dbo].[XephangDanhHieu]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[XephangDanhHieu]
ON [dbo].[DanhHieu]
FOR INSERT, DELETE
AS
BEGIN
	UPDATE dh
    SET XepHang = RankedDanhHieu.NewXepHang
    FROM DanhHieu dh
    INNER JOIN (
        SELECT MaHS, DENSE_RANK() OVER (ORDER BY DiemCaNam DESC) AS NewXepHang
        FROM DanhHieu
    ) AS RankedDanhHieu
    ON dh.MaHS = RankedDanhHieu.MaHS;
END;

GO
/****** Object:  Trigger [dbo].[TinhDiem_Tongket]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--g. Trigger cập nhật điểm trung bình môn và điểm tổng kết
CREATE TRIGGER [dbo].[TinhDiem_Tongket]
ON [dbo].[Diem]
FOR UPDATE
AS
BEGIN
	DECLARE @maHS varchar(20), @diemTB float, @maMon varchar(20), @hocKy int, @namHoc int,
	@newKTTX float, @oldKTTX float, @newSLKTTX int, @oldSLKTTX int;
	SELECT @maHS = new.MaHS, @diemTB = new.DiemTBMon, @maMon = new.MaMH, @hocKy = new.HocKy, @namHoc = new.NamHoc, 
	@newKTTX = new.KTThuongXuyen, @oldKTTX = old.KTThuongXuyen, @newSLKTTX = new.SoLanKTThuongXuyen, @oldSLKTTX = old.SoLanKTThuongXuyen
	FROM inserted new, deleted old;
	IF(@newKTTX > @oldKTTX AND @newSLKTTX = @oldSLKTTX)
	BEGIN
		UPDATE Diem
		SET SoLanKTThuongXuyen = SoLanKTThuongXuyen + 1
		Where MaHS = @maHS and MaMH = @maMon and HocKy = @hocKy and NamHoc = @namHoc;
	END;
	UPDATE Diem
	Set DiemTBMon = ROUND((KTThuongXuyen + KTGiuaKy * 2 + KTCuoiKy * 3) / (SoLanKTThuongXuyen + 2 + 3), 1)
	Where MaHS = @maHS and MaMH = @maMon and HocKy = @hocKy and NamHoc = @namHoc;
	DECLARE @dtb float;
	SELECT @dtb = ROUND(AVG(DiemTBMon), 1)
	FROM Diem
	WHERE MaHS = @maHS and HocKy = @hocKy and NamHoc = @namHoc;
	UPDATE DanhHieu
	SET DiemHK1 = CASE WHEN @hocKy = 1 THEN @dtb ELSE DiemHK1 END,
	    DiemHK2 = CASE WHEN @hocKy = 2 THEN @dtb ELSE DiemHK2 END
	WHERE MaHS = @maHS AND NamHoc = @namHoc;

	UPDATE DanhHieu
	SET DiemCaNam = ROUND((DiemHK1 + DiemHK2 * 2) / 3, 1)
	WHERE MaHS = @maHS AND NamHoc = @namHoc;
END;

GO
/****** Object:  Trigger [dbo].[KiemTraCapNhatGiaoVien]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[KiemTraCapNhatGiaoVien]
ON [dbo].[GiaoVien]
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @MaGV varchar(20),
			@HoTen nvarchar(50),
			@SDT varchar(20),
			@DiaChi nvarchar(100);
	SELECT @HoTen = new.HoTen, @SDT = new.HoTen, @DiaChi = new.DiaChi FROM inserted new;
	IF RTRIM(LTRIM(@HoTen)) = ''
	BEGIN
		RAISERROR('Họ tên không được để trống', 16, 1);
		RETURN;
	END;
	IF EXISTS(SELECT * FROM NguoiDung WHERE SoDT = @SDT AND MaNguoiDung <> @MaGV)
	BEGIN
		RAISERROR('Số điện thoại đã có người đăng ký', 16, 1);
		RETURN;
	END;
	IF RTRIM(LTRIM(@DiaChi)) = ''
	BEGIN
		RAISERROR('Địa chỉ không được để trống', 16, 1);
		RETURN;
	END;
END;

GO
/****** Object:  Trigger [dbo].[KiemTraCapNhatHocSinh]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[KiemTraCapNhatHocSinh]
ON [dbo].[HocSinh]
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @SDT varchar(20), @MaHS varchar(20);
	SELECT @MaHS = ne.MaHS, @SDT = ne.SoDT FROM inserted ne;
	IF EXISTS(SELECT * FROM inserted WHERE RTRIM(LTRIM(HoTen)) = '')
	BEGIN
		RAISERROR('Họ Tên học sinh không được để trống', 16, 1);
		RETURN
	END
	IF EXISTS(SELECT * FROM NguoiDung WHERE SoDT = @SDT AND MaNguoiDung <> @MaHS)
	BEGIN
		RAISERROR('Số điện thoại đã tồn tại', 16, 1);
		RETURN;
	END;
	IF (RTRIM(LTRIM((SELECT DiaChi FROM inserted))) = '')
	BEGIN
		RAISERROR('Địa chỉ học sinh không được để trống', 16, 1);
		RETURN
	END
END;

GO
/****** Object:  Trigger [dbo].[ThayDoiSiSoLop]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[ThayDoiSiSoLop]
ON [dbo].[HocSinh]
FOR INSERT, DELETE
AS
BEGIN
	DECLARE @Lop varchar(20);
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        SELECT @Lop = TenLop FROM inserted;
        UPDATE Lop
        SET SiSoLop = SiSoLop + 1
        WHERE TenLop = @Lop;
    END
    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        SELECT @Lop = TenLop FROM deleted;
        UPDATE Lop
        SET SiSoLop = SiSoLop - 1
        WHERE TenLop = @Lop AND SiSoLop > 0;
    END
END

GO
/****** Object:  Trigger [dbo].[TuDong_ThemDiemVaDanhHieu]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- i. Trigger tự động thêm điểm và danh hiệu (Đạt)
CREATE TRIGGER [dbo].[TuDong_ThemDiemVaDanhHieu]
ON [dbo].[HocSinh]
FOR INSERT
AS
BEGIN
	DECLARE @newMaHS varchar(20), @newNamHoc int;
	SELECT @newMaHS = new.MaHS, @newNamHoc = new.NamHoc
	FROM inserted new;
	EXEC ThemDiem_DanhHieu @newMaHS, @newNamHoc;
END;

GO
/****** Object:  Trigger [dbo].[Them_ThiDua]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--b. Trigger đưa lớp vào danh sách thi đua của trường 
CREATE TRIGGER [dbo].[Them_ThiDua]
ON [dbo].[Lop]
FOR INSERT
AS
BEGIN
	Declare @newTenLop nvarchar(20);
	SELECT @newTenLop = ne.TenLop
	from inserted ne
	if EXISTS(SELECT * From ThiDua Where TenLop = @newTenLop)
	BEGIN
		RAISERROR('Không được nhập trùng Tên Lớp', 16, 1);
		ROLLBACK;
	END;
	else
	BEGIN
		INSERT INTO ThiDua Values(@newTenLop, 100, 1);
	END;
END;

GO
/****** Object:  Trigger [dbo].[KiemTra_NguoiDung]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[KiemTra_NguoiDung]
ON [dbo].[NguoiDung]
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @newSDT varchar(20), @newMaNguoiDung varchar(20), @newTenDN varchar(20), @newMK varchar(20),
			@newHoTen nvarchar(50), @newDiaChi nvarchar(100)
	SELECT @newSDT = SoDT, @newMaNguoiDung = MaNguoiDung, @newTenDN = TenDangNhap, @newMK = MatKhau,
	@newHoTen = HoTen, @newDiaChi = DiaChi
	FROM inserted;
	IF RTRIM(LTRIM(@newTenDN)) = ''
	BEGIN
		RAISERROR('Tên đăng nhập không được để trống', 16, 1);
		RETURN;
	END;
	IF EXISTS(SELECT * FROM NguoiDung WHERE TenDangNhap = @newTenDN AND MaNguoiDung <> @newMaNguoiDung)
	BEGIN
		RAISERROR('Tên đăng nhập đã có người sử dụng', 16, 1);
		RETURN;
	END;
	IF RTRIM(LTRIM(@newMK)) = ''
	BEGIN
		RAISERROR('Mật khẩu không được để trống', 16, 1);
		RETURN;
	END;
	IF EXISTS(SELECT * FROM NguoiDung WHERE SoDT = @newSDT AND MaNguoiDung <> @newMaNguoiDung)
	BEGIN
		RAISERROR('Số điện thoại đã có người đăng ký', 16, 1);
		RETURN;
	END;
	IF RTRIM(LTRIM(@newHoTen)) = ''
	BEGIN
		RAISERROR('Họ tên không được để trống', 16, 1);
		RETURN;
	END;
	IF RTRIM(LTRIM(@newDiaChi)) = ''
	BEGIN
		RAISERROR('Địa chỉ không được để trống', 16, 1);
		RETURN;
	END;
END;

GO
/****** Object:  Trigger [dbo].[KiemTraMatKhau]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[KiemTraMatKhau]
ON [dbo].[NguoiDung]
FOR UPDATE
AS
BEGIN
	DECLARE @newPass varchar(20), @oldPass varchar(20), @tenDN varchar(20);
	SELECT @newPass = new.MatKhau, @tenDN = new.TenDangNhap FROM inserted new;
	SELECT @oldPass = del.MatKhau FROM deleted del;
	IF(@newPass <> @oldPass)
	BEGIN
		DECLARE @sqlStr varchar(MAX);
		SET @sqlStr = 'ALTER LOGIN ' + QUOTENAME(@tenDN) + 'WITH PASSWORD = ''' + @newPass + '''';
		EXEC(@sqlStr);
	END;
END;

GO
/****** Object:  Trigger [dbo].[Them_NguoiDung]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS(SELECT * FROM sys.database_principals WHERE name = 'GiaoVien' AND type = 'R')
BEGIN
	CREATE ROLE GiaoVien
	GRANT SELECT, REFERENCES ON ChiTietTKB TO GiaoVien
	GRANT SELECT, REFERENCES ON DanhGia TO GiaoVien
	GRANT SELECT, INSERT, UPDATE, REFERENCES ON Day TO GiaoVien
	GRANT SELECT, UPDATE, REFERENCES ON DanhHieu TO GiaoVien
	GRANT SELECT, UPDATE, REFERENCES ON Diem TO GiaoVien
	GRANT SELECT, UPDATE, REFERENCES ON HocSinh TO GiaoVien
	GRANT SELECT, UPDATE, REFERENCES ON Lop TO GiaoVien
	GRANT SELECT, REFERENCES ON MonHoc TO GiaoVien
	GRANT SELECT, REFERENCES ON NamHoc TO GiaoVien
	GRANT SELECT, UPDATE, REFERENCES ON NguoiDung TO GiaoVien
	GRANT SELECT, REFERENCES ON NoiQuy TO GiaoVien
	GRANT SELECT, DELETE, REFERENCES ON PhanHoi TO GiaoVien
	GRANT SELECT, REFERENCES ON ThiDua TO GiaoVien
	GRANT SELECT, REFERENCES ON ThoiKhoaBieu TO GiaoVien
	GRANT SELECT, REFERENCES ON UngDung TO GiaoVien

	GRANT SELECT ON dbo.TraDanhSachMon TO GiaoVien

	GRANT EXECUTE ON CapNhatDiemHocKy TO GiaoVien
	GRANT EXECUTE ON CapNhatGiaoVien TO GiaoVien
	GRANT EXECUTE ON CapNhatHocSinh TO GiaoVien
	GRANT EXECUTE ON ChonMonDay TO GiaoVien
	GRANT EXECUTE ON DoiMatKhau TO GiaoVien
	GRANT EXECUTE ON XemTKB TO GiaoVien
	GRANT EXECUTE ON XoaPhanHoi TO GiaoVien

	GRANT SELECT ON dbo.TimDiemLopCaNam TO GiaoVien
	GRANT SELECT ON dbo.TimDiemLopHocKy TO GiaoVien
	GRANT SELECT ON dbo.TimHocSinh TO GiaoVien
	GRANT SELECT ON dbo.TimHocSinhTrongLop TO GiaoVien
	GRANT SELECT ON dbo.TraDTK_XepHang_ThiDua TO GiaoVien
	GRANT SELECT ON dbo.XemDanhHieuCaNhanHocKy TO GiaoVien
	GRANT SELECT ON dbo.XemDanhHieuCaNhanCaNam TO GiaoVien
	GRANT SELECT ON dbo.XemDiemLopCaNam TO GiaoVien
	GRANT SELECT ON dbo.XemDiemLopHocKy TO GiaoVien
	GRANT SELECT ON dbo.XemPhanHoi TO GiaoVien
	GRANT SELECT ON dbo.XemThiDuaLop TO GiaoVien
	GRANT SELECT ON dbo.XemTTLop TO GiaoVien
	GRANT SELECT ON dbo.TraTTGiaoVien TO GiaoVien

	GRANT EXECUTE ON dbo.LopCuaGiaoVien TO GiaoVien
	GRANT EXECUTE ON dbo.TraMaNguoiDung TO GiaoVien
	GRANT EXECUTE ON dbo.TraLop TO GiaoVien
	GRANT EXECUTE ON dbo.TraTKB TO GiaoVien
	GRANT EXECUTE ON dbo.TraSiSoLop TO GiaoVien
END;
GO

IF NOT EXISTS(SELECT * FROM sys.database_principals WHERE name = 'HocSinh' AND type = 'R')
BEGIN
	CREATE ROLE HocSinh
	GRANT SELECT, REFERENCES ON ChiTietTKB TO HocSinh
	GRANT SELECT, REFERENCES ON DanhHieu TO HocSinh
	GRANT SELECT, REFERENCES ON Diem TO HocSinh
	GRANT SELECT, REFERENCES ON GiaoVien TO HocSinh
	GRANT SELECT, REFERENCES ON HocSinh TO HocSinh
	GRANT SELECT, REFERENCES ON Lop TO HocSinh
	GRANT SELECT, REFERENCES ON MonHoc TO HocSinh
	GRANT SELECT, REFERENCES ON NamHoc TO HocSinh
	GRANT SELECT, REFERENCES ON NguoiDung TO HocSinh
	GRANT SELECT, INSERT, REFERENCES ON PhanHoi TO HocSinh
	GRANT SELECT, REFERENCES ON ThoiKhoaBieu TO HocSinh
	GRANT SELECT, REFERENCES ON TuyenSinh TO HocSinh
	GRANT SELECT, REFERENCES ON UngDung TO HocSinh

	GRANT EXECUTE ON CapNhatNguoiDung TO HocSinh
	GRANT EXECUTE ON DoiMatKhau TO HocSinh
	GRANT EXECUTE ON GuiPhanHoi TO HocSinh
	GRANT EXECUTE ON GuiTuyenSinh TO HocSinh
	GRANT EXECUTE ON KiemTraDiemTS TO HocSinh
	GRANT EXECUTE ON ThemDiem_DanhHieu TO HocSinh
	GRANT EXECUTE ON XemTKB TO HocSinh
	GRANT EXECUTE ON XoaHoSo TO HocSinh
	GRANT EXECUTE ON XoaNguoiDung TO HocSinh

	GRANT SELECT ON TraGiaoVien TO HocSinh

	GRANT SELECT ON LayNguoiDung TO HocSinh
	GRANT SELECT ON XemDanhHieuCaNhanCaNam TO HocSinh
	GRANT SELECT ON XemDanhHieuCaNhanHocKy TO HocSinh
	GRANT SELECT ON XemDiemCaNhanCaNam TO HocSinh
	GRANT SELECT ON XemDiemCaNhanHocKy TO HocSinh
	GRANT SELECT ON XemTTCaNhan TO HocSinh

	GRANT EXECUTE ON dbo.KiemTraTenNguoiDung TO HocSinh
	GRANT EXECUTE ON dbo.KiemTraTonTaiHocSinh TO HocSinh
	GRANT EXECUTE ON dbo.TraMaNguoiDung TO HocSinh
	GRANT EXECUTE ON dbo.TraTKB TO HocSinh
	GRANT EXECUTE ON dbo.TraLop TO HocSinh
	GRANT EXECUTE ON dbo.KiemTraTuyenSinh TO HocSinh
END;
GO

CREATE TRIGGER [dbo].[Them_NguoiDung]
ON [dbo].[NguoiDung]
FOR INSERT
AS
BEGIN
	DECLARE @newMaND varchar(20), @newTenDN varchar(50), @newPass varchar(20), @sqlStr nvarchar(MAX), @LoaiNguoiDung INT;
	SELECT @newMaND = MaNguoiDung, @newTenDN = TenDangNhap, @newPass = MatKhau, @LoaiNguoiDung = new.LoaiNguoiDung FROM inserted new;
	IF EXISTS(SELECT * FROM sys.database_principals WHERE type_desc IN ('SQL_USER', 'WINDOWS_USER', 'WINDOWS_GROUP') AND name = @newTenDN)
	BEGIN
		SET @sqlStr = 'DROP USER ' + @newTenDN;
		EXEC (@sqlStr);
	END;
	IF EXISTS(SELECT * FROM sys.sql_logins WHERE name = @newTenDN)
	BEGIN
		SET @sqlStr = 'DROP LOGIN ' + @newTenDN;
		EXEC (@sqlStr);
	END;
	SET @sqlStr = 'CREATE LOGIN [' + @newTenDN +'] WITH PASSWORD='''+ @newPass
	+''', DEFAULT_DATABASE=[QuanLyTruongTrungHocPT], CHECK_EXPIRATION=OFF,
	CHECK_POLICY=OFF';
	EXEC (@sqlStr);
	SET @sqlStr = 'CREATE USER ' + @newTenDN + ' FOR LOGIN ' + @newTenDN;
	EXEC(@sqlStr);
	IF(@LoaiNguoiDung = 1)
	BEGIN
		SET @sqlStr = 'ALTER SERVER ROLE sysadmin ADD MEMBER ' + QUOTENAME(@newTenDN);
		EXEC(@sqlStr);
	END;
	ELSE IF(@LoaiNguoiDung = 2)
	BEGIN
		SET @sqlStr = 'ALTER ROLE GiaoVien ADD MEMBER ' + QUOTENAME(@newTenDN);
		EXEC(@sqlStr);
	END;
	ELSE IF(@LoaiNguoiDung = 3)
	BEGIN
		SET @sqlStr = 'ALTER  ROLE HocSinh ADD MEMBER ' + QUOTENAME(@newTenDN);
		EXEC(@sqlStr);
	END;
END;

GO
/****** Object:  Trigger [dbo].[Xoa_NguoiDung]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Xoa_NguoiDung]
ON [dbo].[NguoiDung]
FOR DELETE
AS
BEGIN
	DECLARE @newTenDN varchar(20), @sqlStr nvarchar(MAX);
	SELECT @newTenDN = old.TenDangNhap FROM deleted old;
	IF EXISTS(SELECT * FROM sys.database_principals WHERE type_desc IN ('SQL_USER', 'WINDOWS_USER', 'WINDOWS_GROUP') AND name = @newTenDN)
	BEGIN
		SET @sqlStr = 'DROP USER ' + @newTenDN;
		EXEC (@sqlStr);
	END;
	IF EXISTS(SELECT * FROM sys.sql_logins WHERE name = @newTenDN)
	BEGIN
		SET @sqlStr = 'DROP LOGIN ' + @newTenDN;
		EXEC (@sqlStr);
	END;
END;

GO
/****** Object:  Trigger [dbo].[KiemTraCapNhatAdmin]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[KiemTraCapNhatAdmin]
ON [dbo].[NguoiQuanLy]
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @MaNQL varchar(20),
			@HoTen nvarchar(50),
			@SDT varchar(20),
			@DiaChi nvarchar(100);
	SELECT @HoTen = new.HoTen, @SDT = new.HoTen, @DiaChi = new.DiaChi FROM inserted new;
	IF RTRIM(LTRIM(@HoTen)) = ''
	BEGIN
		RAISERROR('Họ tên không được để trống', 16, 1);
		RETURN;
	END;
	IF EXISTS(SELECT * FROM NguoiDung WHERE SoDT = @SDT AND MaNguoiDung <> @MaNQL)
	BEGIN
		RAISERROR('Số điện thoại đã có người đăng ký', 16, 1);
		RETURN;
	END;
	IF RTRIM(LTRIM(@DiaChi)) = ''
	BEGIN
		RAISERROR('Địa chỉ không được để trống', 16, 1);
		RETURN;
	END;
END;

GO
/****** Object:  Trigger [dbo].[KiemTraCapNhatNoiQuy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[KiemTraCapNhatNoiQuy]
ON [dbo].[NoiQuy]
FOR UPDATE
AS
BEGIN
	DECLARE @DieuLe nvarchar(20), @NewSoDiemTru int, @MaNQ varchar(20), @OldSoDiemTru int
	SELECT @DieuLe = ne.DieuLe, @NewSoDiemTru = ne.SoDiemTru, @MaNQ = ne.MaNQ, @OldSoDiemTru = de.SoDiemTru
	FROM inserted ne, deleted de
	
	IF @NewSoDiemTru <> @OldSoDiemTru
	BEGIN
		DECLARE @SoDiemTru int =  @NewSoDiemTru - @OldSoDiemTru;
		EXEC CapNhatThiDua @SoDiemTru, @MaNQ;
	END;
END;

GO
/****** Object:  Trigger [dbo].[KiemTraNoiQuy]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[KiemTraNoiQuy]
ON [dbo].[NoiQuy]
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @DieuLe nvarchar(20), @MaNQ varchar(20), @SoDiemTru int
	SELECT @DieuLe = DieuLe, @MaNQ = MaNQ, @SoDiemTru = SoDiemTru FROM inserted
	IF EXISTS(SELECT * FROM NoiQuy WHERE DieuLe = @DieuLe AND MaNQ <> @MaNQ)
	BEGIN
		RAISERROR('Điều lệ đã tồn tại', 16, 1);
		RETURN;
	END;
	IF (@MaNQ NOT LIKE 'NQ[0-9][0-9]')
	BEGIN
		RAISERROR('Mã nội quy không hợp lệ', 16, 1);
		RETURN;
	END;
	IF RTRIM(LTRIM(@DieuLe)) = ''
	BEGIN
		RAISERROR('Điều lệ không được để trống', 16, 1);
		RETURN;
	END;
	IF RTRIM(LTRIM(@SoDiemTru)) = ''
	BEGIN
		RAISERROR('Số điểm trừ không được để trống', 16, 1);
		RETURN;
	END;
END;

GO
/****** Object:  Trigger [dbo].[CapNhatXepHangLop]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--f. Trigger cập nhật xếp hạng lớp
CREATE TRIGGER [dbo].[CapNhatXepHangLop]
ON [dbo].[ThiDua]
AFTER UPDATE
AS
BEGIN
    UPDATE td
    SET XepHang = RankedThiDua.NewXepHang
    FROM ThiDua td
    INNER JOIN (
        SELECT TenLop, DENSE_RANK() OVER (ORDER BY DiemTongKet DESC) AS NewXepHang
        FROM ThiDua
    ) AS RankedThiDua
    ON td.TenLop = RankedThiDua.TenLop;
END;

GO
/****** Object:  Trigger [dbo].[KiemTra_TKB]    Script Date: 11/21/2023 12:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--m. Trigger kiểm tra trùng thời khóa biểu
CREATE TRIGGER [dbo].[KiemTra_TKB]
ON [dbo].[ThoiKhoaBieu]
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @newTenLop varchar(20), @newHocKy int, @newNamHoc int, @newMaTKB varchar(20);
	SELECT @newTenLop = new.TenLop, @newHocKy = new.HocKy, @newNamHoc = new.Nam, @newMaTKB = MaTKB
	FROM inserted new;
	IF EXISTS(SELECT * FROM ThoiKhoaBieu WHERE TenLop = @newTenLop AND HocKy = @newHocKy AND Nam = @newNamHoc AND MaTKB <> @newMaTKB)
	BEGIN
		RAISERROR('Đã có thời khóa biểu của học kỳ này trong năm', 16, 1);
		ROLLBACK;
	END;
END;

GO
USE [master]
GO
ALTER DATABASE [QuanLyTruongTrungHocPT] SET  READ_WRITE 
GO
USE QuanLyTruongTrungHocPT
GO

--UngDung
INSERT INTO UngDung(MaUD,TenUngDung,PhienBan,DungLuong) VALUES ('UD001',N'Quản Lý Học Sinh','1',10.5);						
INSERT INTO UngDung(MaUD,TenUngDung,PhienBan,DungLuong) VALUES ('UD002',N'Quản Lý Học Sinh','2',12);						
INSERT INTO UngDung(MaUD,TenUngDung,PhienBan,DungLuong) VALUES ('UD003',N'Quản Lý THPT','3',8.5);						
INSERT INTO UngDung(MaUD,TenUngDung,PhienBan,DungLuong) VALUES ('UD004',N'Quản Lý THPT','4',13.2);
GO

--NguoiDung
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0001','UD004',1,'admin1','admin1',N'Nguyễn Ngọc Linh','1980/02/03',N'Nữ',N'Thủ Đức','0369731086');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0002','UD004',1,'admin2','admin2',N'Trần Văn Nam','1980/03/25',N'Nam',N'Quận 9','0909876543');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0003','UD004',2,'giaovien1','giaovien1',N'Phạm Thị Hương','1984/12/18',N'Nữ',N'Long An','0987654321');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0004','UD004',2,'giaovien2','giaovien2',N'Phan Văn Thắng','1983/06/27',N'Nam',N'Trà Vinh','0909876533');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0005','UD004',2,'giaovien3','giaovien3',N'Nguyễn Văn An','1991/08/22',N'Nam',N'Quận 7','0912345678');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0006','UD004',2,'giaovien4','giaovien4',N'Võ Thị Thanh','1996/06/27',N'Nữ',N'Quận Bình Thạnh','0965432110');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0007','UD004',3,'hocsinh1','hocsinh1',N'Phan Văn Thắng','2008/09/08',N'Nam',N'An Giang','0954321099');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0008','UD004',3,'hocsinh2','hocsinh2',N'Trần Minh Trí','2008/12/07',N'Nam',N'Thủ Đức','0862593211');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0009','UD004',3,'hocsinh3','hocsinh3',N'Lê Thị Ngọc Giang','2007/09/09',N'Nữ',N'Hậu Giang','0945678902');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0010','UD004',3,'hocsinh4','hocsinh4',N'Lê Văn Hoàng','2007/08/22',N'Nam',N'Bến Tre','0987654322');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0011','UD004',3,'hocsinh5','hocsinh5',N'Nguyễn Thảo Nguyên','2006/10/19',N'Nữ',N'Tiền Giang','0901234567');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0012','UD004',3,'hocsinh6','hocsinh6',N'Trần Nguyên Phát','2006/11/08',N'Nam',N'Bình Thạnh','0976543210');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0013','UD004',3,'hocsinh7','hocsinh7',N'Nguyễn Ngọc Tuấn','2007/11/30',N'Nam',N'Đồng Nai','0979115345');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0014','UD004',3,'hocsinh8','hocsinh8',N'Bùi Trọng Trí','2007/10/10',N'Nam',N'Quảng Ngãi','0986306331');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0015','UD004',3,'hocsinh9','hocsinh9',N'Lê Thị Thùy Duyên','2007/12/20',N'Nữ',N'Long An','0989393275');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0016','UD004',3,'hocsinh10','hocsinh10',N'Phan Ngọc Hân','2007/10/18',N'Nữ',N'Trà Vinh','0918289858');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0017','UD004',3,'hocsinh11','hocsinh11',N'Trần Thanh Hòa','2007/09/03',N'Nam',N'An Giang','0933737485');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0018','UD004',3,'hocsinh12','hocsinh12',N'Nguyễn Anh Duy','2007/01/07',N'Nam',N'Đồng Tháp','0982913919');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0019','UD004',3,'hocsinh13','hocsinh13',N'Huỳnh Đông Hên','2007/08/02',N'Nam',N'Bến Tre','0975214664');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0020','UD004',3,'hocsinh14','hocsinh14',N'Nguyễn Đặng Gia Bảo','2007/06/06',N'Nam',N'An Giang','0909714623');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0021','UD004',3,'hocsinh15','hocsinh15',N'Nguyễn Thị Anh Thư','2007/04/02',N'Nữ',N'Quận 5','0917410493');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0022','UD004',3,'hocsinh16','hocsinh16',N'Nguyễn Ngọc Lam','2007/10/20',N'Nữ',N'Nhà Bè','0903122556');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0023','UD004',3,'hocsinh17','hocsinh17',N'Lê Thanh Tùng','2007/02/16',N'Nam',N'Bình Thạnh','0908311883');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0024','UD004',3,'hocsinh18','hocsinh18',N'Nguyễn Minh Trọng','2007/05/05',N'Nam',N'Trà Vinh','0918129188');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0025','UD004',3,'hocsinh19','hocsinh19',N'Trần Thành Lộc','2007/02/01',N'Nam',N'Long An','0933484618');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0026','UD004',3,'hocsinh20','hocsinh20',N'Võ Như Ngọc','2008/03/01',N'Nữ',N'Đồng Nai','0383874672');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0027','UD004',3,'hocsinh21','hocsinh21',N'Nguyễn Văn Hậu','2008/09/10',N'Nam',N'Bến Tre','0982882201');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0028','UD004',3,'hocsinh22','hocsinh22',N'Nguyễn Thanh Như','2008/12/12',N'Nữ',N'Đồng Tháp','0908356130');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0029','UD004',3,'hocsinh23','hocsinh23',N'Thân Quốc Tú','2008/12/10',N'Nam',N'Quận 3','0988805526');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0030','UD004',3,'hocsinh24','hocsinh24',N'Huỳnh Thanh Thuận','2008/10/19',N'Nam',N'Quận 1','0918740540');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0031','UD004',3,'hocsinh25','hocsinh25',N'Nguyễn Ngọc Nhi','2008/10/07',N'Nữ',N'Quận 2','0903119131');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0032','UD004',3,'hocsinh26','hocsinh26',N'Phan Thị Thúy Vy','2008/07/07',N'Nữ',N'Quận 3','0849848889');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0033','UD004',3,'hocsinh27','hocsinh27',N'Trần Ngọc Như','2008/02/07',N'Nữ',N'Bình Thạnh','0986338854');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0034','UD004',3,'hocsinh28','hocsinh28',N'Trần Minh Khải','2008/03/02',N'Nam',N'Tiền Giang','0908248238');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0035','UD004',3,'hocsinh29','hocsinh29',N'Nguyễn Gia Huy','2008/06/01',N'Nam',N'Quận 10','0162684865');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0036','UD004',3,'hocsinh30','hocsinh30',N'Trịnh Thị Quỳnh','2008/05/23',N'Nữ',N'Thủ Đức','0919655801');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0037','UD004',3,'hocsinh31','hocsinh31',N'Nguyễn Thành Lộc','2008/09/09',N'Nam',N'Nhà Bè','0915066800');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0038','UD004',3,'hocsinh32','hocsinh32',N'Huỳnh Ngọc Mai','2008/06/03',N'Nữ',N'Quận 11','0903112536');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0039','UD004',3,'hocsinh33','hocsinh33',N'Hồ Ngọc Bảo Hân','2006/08/05',N'Nữ',N'Quận 7','0909151486');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0040','UD004',3,'hocsinh34','hocsinh34',N'Phạm Minh Bảo','2006/10/25',N'Nam',N'Trà Vinh','0919413401');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0041','UD004',3,'hocsinh35','hocsinh35',N'Bùi Thị Ngọc Khánh','2006/03/07',N'Nữ',N'Bến Tre','0905332403');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0042','UD004',3,'hocsinh36','hocsinh36',N'Nguyễn Anh Thư','2006/04/04',N'Nữ',N'Long An','0918806566');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0043','UD004',3,'hocsinh37','hocsinh37',N'Nguyễn Việt Thành','2006/01/09',N'Nam',N'Đồng Tháp','0932024158');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0044','UD004',3,'hocsinh38','hocsinh38',N'Nguyễn Thị Hồng Thắm','2006/11/03',N'Nữ',N'Vĩnh Long','0918201102');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0045','UD004',3,'hocsinh39','hocsinh39',N'Nguyễn Võ Thùy Linh','2006/12/28',N'Nữ',N'Nghệ An','0355661164');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0046','UD004',3,'hocsinh40','hocsinh40',N'Nguyễn Thị Như Ngọc','2006/09/23',N'Nữ',N'Quận 1','0943852531');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0047','UD004',3,'hocsinh41','hocsinh41',N'Vũ Thảo Nguyên','2006/01/21',N'Nữ',N'Quận 8','0937970960');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0048','UD004',3,'hocsinh42','hocsinh42',N'Nguyễn Ngọc Diệu Anh','2006/09/27',N'Nữ',N'Bình Thạnh','0913801389');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0049','UD004',3,'hocsinh43','hocsinh43',N'Nguyễn Tất Thành','2006/11/17',N'Nam',N'Bến Tre','0909834079');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0050','UD004',3,'hocsinh44','hocsinh44',N'Phạm Thị Phương Anh','2006/07/19',N'Nữ',N'Long An','0122666577');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0051','UD004',3,'hocsinh45','hocsinh45',N'Vũ Minh Chiến','2006/10/19',N'Nam',N'Tiền Giang','0989695944');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0052','UD004',3,'hocsinh46','hocsinh46',N'Nguyễn Thùy Diễm My','2006/11/2',N'Nữ',N'Tiền Giang','0973536274');
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0053','UD004',3,'hocsinh47','hocsinh47',N'Lê Thành Lộc','2006/09/09',N'Nam',N'Quận 10','0927345242');
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0054','UD004',3,'hocsinh48','hocsinh48',N'Lê Thị Ngọc Quỳnh','2006/04/02',N'Nữ',N'Thủ Đức','0757474354');
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0055','UD004',3,'hocsinh49','hocsinh49',N'Huỳnh Bảo Ngọc','2006/01/12',N'Nữ',N'Nhà Bè','0547474474');
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0056','UD004',3,'hocsinh50','hocsinh50',N'Lý Thành Danh','2006/11/12',N'Nam',N'Quận 11','0947352347');
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0057','UD004',2,'giaovien5','giaovien5',N'Hoàng Thị Thanh Nga','1990/03/03',N'Nữ',N'Quận 9','0984353544');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0058','UD004',2,'giaovien6','giaovien6',N'Trần Thị Hương','1889/10/12',N'Nữ',N'Thủ Đức','0428437848');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0059','UD004',2,'giaovien7','giaovien7',N'Đào Thị Kim Hoa','1887/10/14',N'Nữ',N'Quận 9','0772970809');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0060','UD004',2,'giaovien8','giaovien8',N'Trần Thanh Bình','1992/12/08',N'Nam',N'Quận 8','0324773746');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0061','UD004',2,'giaovien9','giaovien9',N'Trần Thị Huyên','1991/09/01',N'Nữ',N'Long An','0847485048');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0062','UD004',2,'giaovien10','giaovien10',N'Trịnh Thị Thu Bình','1993/09/02',N'Nữ',N'Quận 12','0438080097');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0063','UD004',2,'giaovien11','giaovien11',N'Đoàn Ngọc Hiền','1992/12/12',N'Nữ',N'Quận 2','0853805039');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0064','UD004',2,'giaovien12','giaovien12',N'Phạm Kim Dung','1887/07/08',N'Nữ',N'Thủ Đức','0489358090');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0065','UD004',2,'giaovien13','giaovien13',N'Bùi Phương Thảo','1990/04/03',N'Nữ',N'Quận 1','0439538588');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0066','UD004',2,'giaovien14','giaovien14',N'Đỗ Thanh Bình','1992/03/01',N'Nam',N'Nhà Bè','0435453059');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0067','UD004',2,'giaovien15','giaovien15',N'Bùi Thị Tuyết Mai','1993/04/01',N'Nữ',N'Bình Thạnh','0954684096');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0068','UD004',2,'giaovien16','giaovien16',N'Đoàn Thanh Tú','1889/03/15',N'Nam',N'Tiền Giang','0938589909');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0069','UD004',2,'giaovien17','giaovien17',N'Ngô Thanh Hoan','1885/03/05',N'Nam',N'Quận 10','0945838090');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0070','UD004',2,'giaovien18','giaovien18',N'Đỗ Thu Hiền','1887/10/29',N'Nữ',N'Quận 8','0239090569');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0071','UD004',2,'giaovien19','giaovien19',N'Phạm Thanh Nam','1889/03/26',N'Nam',N'Thủ Đức','0398895389');														
INSERT INTO NguoiDung(MaNguoiDung,MaUngDung,LoaiNguoiDung,TenDangNhap,MatKhau,HoTen,NgaySinh,GioiTinh,DiaChi,SoDT) VALUES ('ND0072','UD004',2,'giaovien20','giaovien20',N'Trần Hưng Pháp','1990/04/03',N'Nam',N'Bình Thạnh','0739090490');			
GO

--TuyenSinh
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0007',N'Phan Văn Thắng',N'Nam','2008/09/08','0954321099',40.5,N'THCS Lê Văn Chí',N'An Giang');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0008',N'Trần Minh Trí',N'Nam','2008/12/07','0862593211',35,N'THCS Mộ Đức 2',N'Thủ Đức');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0009',N'Lê Thị Ngọc Giang',N'Nữ','2007/09/09','0945678902',40.25,N'THCS Phạm Văn Đồng',N'Hậu Giang');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0010',N'Lê Văn Hoàng',N'Nam','2007/08/22','0987654322',30,N'THCS Nguyễn Công Trứ',N'Bến Tre');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0011',N'Nguyễn Thảo Nguyên',N'Nữ','2007/10/19','0901234567',30.75,N'THCS Lê Quý Đôn',N'Tiền Giang');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0012',N'Trần Nguyên Phát',N'Nam','2007/11/08','0976543210',40,N'THCS Trần Quốc Tuấn',N'Bình Thạnh');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0013',N'Nguyễn Ngọc Tuấn',N'Nam','2007/11/30','0979115345',39,N'THCS Nguyễn Công Trứ',N'Đồng Nai');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0014',N'Bùi Trọng Trí',N'Nam','2007/10/10','0986306331',39.5,N'THCS Trần Quốc Tuấn',N'Quảng Ngãi');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0015',N'Lê Thị Thùy Duyên',N'Nữ','2007/12/20','0989393275',39,N'THCS Mộ Đức 2',N'Long An');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0016',N'Phan Ngọc Hân',N'Nữ','2007/10/18','0918289858',39,N'THCS Trần Quốc Tuấn',N'Trà Vinh');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0017',N'Trần Thanh Hòa',N'Nam','2007/09/03','0933737485',31,N'THCS Lê Quý Đôn',N'An Giang');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0018',N'Nguyễn Anh Duy',N'Nam','2007/01/07','0982913919',45,N'THCS Trần Quốc Tuấn',N'Đồng Tháp');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0019',N'Huỳnh Đông Hên',N'Nam','2007/08/02','0975214664',44,N'THCS Lê Quý Đôn',N'Bến Tre');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0020',N'Nguyễn Đặng Gia Bảo',N'Nam','2007/06/06','0909714623',48,N'THCS Mộ Đức 2',N'An Giang');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0021',N'Nguyễn Thị Anh Thư',N'Nữ','2007/04/02','0917410493',34.5,N'THCS Trần Quốc Tuấn',N'Quận 5');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0022',N'Nguyễn Ngọc Lam',N'Nữ','2007/10/20','0903122556',37.75,N'THCS Mộ Đức 2',N'Nhà Bè');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0023',N'Lê Thanh Tùng',N'Nam','2007/02/16','0908311883',28.5,N'THCS Nguyễn Công Trứ',N'Bình Thạnh');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0024',N'Nguyễn Minh Trọng',N'Nam','2007/05/05','0918129188',27,N'THCS Lê Quý Đôn',N'Trà Vinh');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0025',N'Trần Thành Lộc',N'Nam','2007/02/01','0933484618',27.25,N'THCS Phạm Văn Đồng',N'Long An');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0026',N'Võ Như Ngọc',N'Nữ','2008/03/01','0383874672',46,N'THCS Phạm Văn Đồng',N'Đồng Nai');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0027',N'Nguyễn Văn Hậu',N'Nam','2008/09/10','0982882201',34,N'THCS Nguyễn Công Trứ',N'Bến Tre');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0028',N'Nguyễn Thanh Như',N'Nữ','2008/12/12','0908356130',33,N'THCS Lê Quý Đôn',N'Đồng Tháp');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0029',N'Thân Quốc Tú',N'Nam','2008/12/10','0988805526',39,N'THCS Lê Quý Đôn',N'Quận 3');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0030',N'Huỳnh Thanh Thuận',N'Nam','2008/10/19','0918740540',29.25,N'THCS Trần Quốc Tuấn',N'Quận 1');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0031',N'Nguyễn Ngọc Nhi',N'Nữ','2008/10/07','0903119131',37,N'THCS Phạm Văn Đồng',N'Quận 2');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0032',N'Phan Thị Thúy Vy',N'Nữ','2008/07/07','0849848889',28,N'THCS Trần Quốc Tuấn',N'Quận 3');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0033',N'Trần Ngọc Như',N'Nữ','2008/02/07','0986338854',44,N'THCS Phạm Văn Đồng',N'Bình Thạnh');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0034',N'Trần Minh Khải',N'Nam','2008/03/02','0908248238',43,N'THCS Mộ Đức 2',N'Tiền Giang');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0035',N'Nguyễn Gia Huy',N'Nam','2008/06/01','0162684865',46.5,N'THCS Nguyễn Công Trứ',N'Quận 10');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0036',N'Trịnh Thị Quỳnh',N'Nữ','2008/05/23','0919655801',28,N'THCS Nguyễn Công Trứ',N'Thủ Đức');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0037',N'Nguyễn Thành Lộc',N'Nam','2008/09/09','0915066800',28.75,N'THCS Nguyễn Công Trứ',N'Nhà Bè');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0038',N'Huỳnh Ngọc Mai',N'Nữ','2008/06/03','0903112536',26,N'THCS Phạm Văn Đồng',N'Quận 11');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0039',N'Hồ Ngọc Bảo Hân',N'Nữ','2006/08/05','0909151486',34,N'THCS Mộ Đức 2',N'Quận 7');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0040',N'Phạm Minh Bảo',N'Nam','2006/10/25','0919413401',35,N'THCS Trần Quốc Tuấn',N'Trà Vinh');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0041',N'Bùi Thị Ngọc Khánh',N'Nữ','2006/03/07','0905332403',36,N'THCS Phạm Văn Đồng',N'Bến Tre');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0042',N'Nguyễn Anh Thư',N'Nữ','2006/04/04','0918806566',44,N'THCS Lê Quý Đôn',N'Long An');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0043',N'Nguyễn Việt Thành',N'Nam','2006/01/09','0932024158',45,N'THCS Phạm Văn Đồng',N'Đồng Tháp');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0044',N'Nguyễn Thị Hồng Thắm',N'Nữ','2006/11/03','0918201102',46.25,N'THCS Phạm Văn Đồng',N'Vĩnh Long');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0045',N'Nguyễn Võ Thùy Linh',N'Nữ','2006/12/28','0355661164',44,N'THCS Trần Quốc Tuấn',N'Nghệ An');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0046',N'Nguyễn Thị Như Ngọc',N'Nữ','2006/09/23','0943852531',37,N'THCS Phạm Văn Đồng',N'Quận 1');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0047',N'Vũ Thảo Nguyên',N'Nữ','2006/01/21','0937970960',38,N'THCS Lê Quý Đôn',N'Quận 8');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0048',N'Nguyễn Ngọc Diệu Anh',N'Nữ','2006/09/27','0913801389',39,N'THCS Trần Quốc Tuấn',N'Bình Thạnh');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0049',N'Nguyễn Tất Thành',N'Nam','2006/11/17','0909834079',26.25,N'THCS Nguyễn Công Trứ',N'Bến Tre');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0050',N'Phạm Thị Phương Anh',N'Nữ','2006/07/19','0122666577',28,N'THCS Phạm Văn Đồng',N'Long An');												
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0051',N'Vũ Minh Chiến',N'Nam','2006/10/19','0989695944',30,N'THCS Trần Quốc Tuấn',N'Tiền Giang');
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0052',N'Nguyễn Thùy Diễm My',N'Nữ','2006/11/2','0973536274',11,N'THCS Lê Quý Đôn',N'Tiền Giang');
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0053',N'Lê Thành Lộc',N'Nam','2006/09/09','0927345242',9.75,N'THCS Trần Quốc Tuấn',N'Quận 10');
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0054',N'Lê Thị Ngọc Quỳnh',N'Nữ','2006/04/02','0757474354',20,N'THCS Nguyễn Công Trứ',N'Thủ Đức');
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0055',N'Huỳnh Bảo Ngọc',N'Nữ','2006/01/12','0547474474',5,N'THCS Phạm Văn Đồng',N'Nhà Bè');
INSERT INTO TuyenSinh(MaHoSo,HoTen,GioiTinh,NgaySinh,SoDT,DiemTuyenSinh,TruongHocCu,DiaChi) VALUES ('ND0056',N'Lý Thành Danh',N'Nam','2006/11/12','0947352347',20,N'THCS Trần Quốc Tuấn',N'Quận 11');
GO

--GiaoVien
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0057',N'Hoàng Thị Thanh Nga',N'Nữ','1990/03/03','0984353544',N'Quận 9');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0058',N'Trần Thị Hương',N'Nữ','1889/10/12','0428437848',N'Thủ Đức');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0059',N'Đào Thị Kim Hoa',N'Nữ','1887/10/14','0772970809',N'Quận 9');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0060',N'Trần Thanh Bình',N'Nam','1992/12/08','0324773746',N'Quận 8');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0061',N'Trần Thị Huyên',N'Nữ','1991/09/01','0847485048',N'Long An');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0062',N'Trịnh Thị Thu Bình',N'Nữ','1993/09/02','0438080097',N'Quận 12');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0063',N'Đoàn Ngọc Hiền',N'Nữ','1992/12/12','0853805039',N'Quận 2');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0064',N'Phạm Kim Dung',N'Nữ','1887/07/08','0489358090',N'Thủ Đức');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0065',N'Bùi Phương Thảo',N'Nữ','1990/04/03','0439538588',N'Quận 1');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0066',N'Đỗ Thanh Bình',N'Nam','1992/03/01','0435453059',N'Nhà Bè');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0067',N'Bùi Thị Tuyết Mai',N'Nữ','1993/04/01','0954684096',N'Bình Thạnh');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0068',N'Đoàn Thanh Tú',N'Nam','1889/03/15','0938589909',N'Tiền Giang');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0069',N'Ngô Thanh Hoan',N'Nam','1885/03/05','0945838090',N'Quận 10');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0070',N'Đỗ Thu Hiền',N'Nữ','1887/10/29','0239090569',N'Quận 8');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0071',N'Phạm Thanh Nam',N'Nam','1889/03/26','0398895389',N'Thủ Đức');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0072',N'Trần Hưng Pháp',N'Nam','1990/04/03','0739090490',N'Bình Thạnh');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0003',N'Phạm Thị Hương',N'Nữ','1984/12/18','0987654321',N'Long An');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0004',N'Phan Văn Thắng',N'Nam','1983/06/27','0909876533',N'Trà Vinh');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0005',N'Nguyễn Văn An',N'Nam','1991/08/22','0912345678',N'Quận 7');								
INSERT INTO GiaoVien(MaGV,HoTen,GioiTinh,NgaySinh,SDT,DiaChi) VALUES ('ND0006',N'Võ Thị Thanh',N'Nữ','1996/06/27','0965432110',N'Quận Bình Thạnh');			
GO

--NguoiQuanLy
INSERT INTO NguoiQuanLy(MaNQL,HoTen,GioiTinh,NgaySinh,SDT,DiaChi,ChucVu) VALUES ('ND0001',N'Nguyễn Ngọc Linh',N'Nữ','1980/02/03','0369731086',N'Thủ Đức',N'Hiệu Trưởng');										
INSERT INTO NguoiQuanLy(MaNQL,HoTen,GioiTinh,NgaySinh,SDT,DiaChi,ChucVu) VALUES ('ND0002',N'Trần Văn Nam',N'Nam','1980/03/25','0909876543',N'Quận 9',N'Phó Hiệu Trưởng');
GO

--NamHoc
INSERT INTO NamHoc(Nam,NgayBatDau,NgayKetThuc) VALUES (2022,'2021/8/15','2022/5/20');					
INSERT INTO NamHoc(Nam,NgayBatDau,NgayKetThuc) VALUES (2023,'2022/8/15','2023/5/23');
GO

-- Lop
INSERT INTO Lop(TenLop,MaGVCN,SiSoLop,NienKhoa) VALUES (N'10A1','ND0057',0,2023);					
INSERT INTO Lop(TenLop,MaGVCN,SiSoLop,NienKhoa) VALUES (N'10A2','ND0058',0,2023);					
INSERT INTO Lop(TenLop,MaGVCN,SiSoLop,NienKhoa) VALUES (N'10A3','ND0059',0,2023);					
INSERT INTO Lop(TenLop,MaGVCN,SiSoLop,NienKhoa) VALUES (N'11A1','ND0060',0,2023);					
INSERT INTO Lop(TenLop,MaGVCN,SiSoLop,NienKhoa) VALUES (N'11A2','ND0061',0,2023);					
INSERT INTO Lop(TenLop,MaGVCN,SiSoLop,NienKhoa) VALUES (N'11A3','ND0062',0,2023);					
INSERT INTO Lop(TenLop,MaGVCN,SiSoLop,NienKhoa) VALUES (N'12A1','ND0063',0,2023);					
INSERT INTO Lop(TenLop,MaGVCN,SiSoLop,NienKhoa) VALUES (N'12A2','ND0064',0,2023);					
INSERT INTO Lop(TenLop,MaGVCN,SiSoLop,NienKhoa) VALUES (N'12A3','ND0065',0,2023);		
GO

--Mon
INSERT INTO MonHoc(MaMonHoc,TenMonHoc,SoTietDay) VALUES ('MH01',N'Toán',68);					
INSERT INTO MonHoc(MaMonHoc,TenMonHoc,SoTietDay) VALUES ('MH02',N'Ngữ Văn',68);					
INSERT INTO MonHoc(MaMonHoc,TenMonHoc,SoTietDay) VALUES ('MH03',N'Anh Văn',34);					
INSERT INTO MonHoc(MaMonHoc,TenMonHoc,SoTietDay) VALUES ('MH04',N'Sinh Học',34);					
INSERT INTO MonHoc(MaMonHoc,TenMonHoc,SoTietDay) VALUES ('MH05',N'Lịch Sử',17);					
INSERT INTO MonHoc(MaMonHoc,TenMonHoc,SoTietDay) VALUES ('MH06',N'Địa Lý',17);					
INSERT INTO MonHoc(MaMonHoc,TenMonHoc,SoTietDay) VALUES ('MH07',N'Vật Lí',34);					
INSERT INTO MonHoc(MaMonHoc,TenMonHoc,SoTietDay) VALUES ('MH08',N'GDCD',17);					
INSERT INTO MonHoc(MaMonHoc,TenMonHoc,SoTietDay) VALUES ('MH09',N'Hóa Học',34);					
INSERT INTO MonHoc(MaMonHoc,TenMonHoc,SoTietDay) VALUES ('MH10',N'Tin Học',34);					
INSERT INTO MonHoc(MaMonHoc,TenMonHoc,SoTietDay) VALUES ('MH11',N'Thể Dục',17);					
INSERT INTO MonHoc(MaMonHoc,TenMonHoc,SoTietDay) VALUES ('MH12',N'GDQP',17);					
INSERT INTO MonHoc(MaMonHoc,TenMonHoc,SoTietDay) VALUES ('MH13',N'Công nghệ',17);	
GO

--HocSinh	
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0007',N'Phan Văn Thắng','2008/09/08',N'Nam',N'10A1','0954321099',N'An Giang',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0008',N'Trần Minh Trí','2008/12/07',N'Nam',N'10A1','0862593211',N'Thủ Đức',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0009',N'Lê Thị Ngọc Giang','2007/09/09',N'Nữ',N'11A1','0945678902',N'Hậu Giang',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0010',N'Lê Văn Hoàng','2007/08/22',N'Nam',N'11A1','0987654322',N'Bến Tre',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0011',N'Nguyễn Thảo Nguyên','2006/10/19',N'Nữ',N'12A1','0901234567',N'Tiền Giang',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0012',N'Trần Nguyên Phát','2006/11/08',N'Nam',N'12A1','0976543210',N'Bình Thạnh',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0013',N'Nguyễn Ngọc Tuấn','2007/11/30',N'Nam',N'11A1','0979115345',N'Đồng Nai',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0014',N'Bùi Trọng Trí','2007/10/10',N'Nam',N'11A1','0986306331',N'Quảng Ngãi',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0015',N'Lê Thị Thùy Duyên','2007/12/20',N'Nữ',N'11A1','0989393275',N'Long An',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0016',N'Phan Ngọc Hân','2007/10/18',N'Nữ',N'11A2','0918289858',N'Trà Vinh',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0017',N'Trần Thanh Hòa','2007/09/03',N'Nam',N'11A2','0933737485',N'An Giang',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0018',N'Nguyễn Anh Duy','2007/01/07',N'Nam',N'11A2','0982913919',N'Đồng Tháp',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0019',N'Huỳnh Đông Hên','2007/08/02',N'Nam',N'11A2','0975214664',N'Bến Tre',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0020',N'Nguyễn Đặng Gia Bảo','2007/06/06',N'Nam',N'11A2','0909714623',N'An Giang',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0021',N'Nguyễn Thị Anh Thư','2007/04/02',N'Nữ',N'11A3','0917410493',N'Quận 5',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0022',N'Nguyễn Ngọc Lam','2007/10/20',N'Nữ',N'11A3','0903122556',N'Nhà Bè',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0023',N'Lê Thanh Tùng','2007/02/16',N'Nam',N'11A3','0908311883',N'Bình Thạnh',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0024',N'Nguyễn Minh Trọng','2007/05/05',N'Nam',N'11A3','0918129188',N'Trà Vinh',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0025',N'Trần Thành Lộc','2007/02/01',N'Nam',N'11A3','0933484618',N'Long An',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0026',N'Võ Như Ngọc','2008/03/01',N'Nữ',N'10A1','0383874672',N'Đồng Nai',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0027',N'Nguyễn Văn Hậu','2008/09/10',N'Nam',N'10A1','0982882201',N'Bến Tre',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0028',N'Nguyễn Thanh Như','2008/12/12',N'Nữ',N'10A1','0908356130',N'Đồng Tháp',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0029',N'Thân Quốc Tú','2008/12/10',N'Nam',N'10A2','0988805526',N'Quận 3',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0030',N'Huỳnh Thanh Thuận','2008/10/19',N'Nam',N'10A2','0918740540',N'Quận 1',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0031',N'Nguyễn Ngọc Nhi','2008/10/07',N'Nữ',N'10A2','0903119131',N'Quận 2',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0032',N'Phan Thị Thúy Vy','2008/07/07',N'Nữ',N'10A2','0849848889',N'Quận 3',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0033',N'Trần Ngọc Như','2008/02/07',N'Nữ',N'10A2','0986338854',N'Bình Thạnh',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0034',N'Trần Minh Khải','2008/03/02',N'Nam',N'10A3','0908248238',N'Tiền Giang',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0035',N'Nguyễn Gia Huy','2008/06/01',N'Nam',N'10A3','0162684865',N'Quận 10',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0036',N'Trịnh Thị Quỳnh','2008/05/23',N'Nữ',N'10A3','0919655801',N'Thủ Đức',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0037',N'Nguyễn Thành Lộc','2008/09/09',N'Nam',N'10A3','0915066800',N'Nhà Bè',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0038',N'Huỳnh Ngọc Mai','2008/06/03',N'Nữ',N'10A3','0903112536',N'Quận 11',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0039',N'Hồ Ngọc Bảo Hân','2006/08/05',N'Nữ',N'12A1','0909151486',N'Quận 7',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0040',N'Phạm Minh Bảo','2006/10/25',N'Nam',N'12A1','0919413401',N'Trà Vinh',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0041',N'Bùi Thị Ngọc Khánh','2006/03/07',N'Nữ',N'12A1','0905332403',N'Bến Tre',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0042',N'Nguyễn Anh Thư','2006/04/04',N'Nữ',N'12A2','0918806566',N'Long An',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0043',N'Nguyễn Việt Thành','2006/01/09',N'Nam',N'12A2','0932024158',N'Đồng Tháp',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0044',N'Nguyễn Thị Hồng Thắm','2006/11/03',N'Nữ',N'12A2','0918201102',N'Vĩnh Long',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0045',N'Nguyễn Võ Thùy Linh','2006/12/28',N'Nữ',N'12A2','0355661164',N'Nghệ An',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0046',N'Nguyễn Thị Như Ngọc','2006/09/23',N'Nữ',N'12A2','0943852531',N'Quận 1',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0047',N'Vũ Thảo Nguyên','2006/01/21',N'Nữ',N'12A3','0937970960',N'Quận 8',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0048',N'Nguyễn Ngọc Diệu Anh','2006/09/27',N'Nữ',N'12A3','0913801389',N'Bình Thạnh',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0049',N'Nguyễn Tất Thành','2006/11/17',N'Nam',N'12A3','0909834079',N'Bến Tre',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0050',N'Phạm Thị Phương Anh','2006/07/19',N'Nữ',N'12A3','0122666577',N'Long An',2023);										
INSERT INTO HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,TenLop,SoDT,DiaChi,NamHoc) VALUES ('ND0051',N'Vũ Minh Chiến','2006/10/19',N'Nam',N'12A3','0989695944',N'Tiền Giang',2023);		
GO

--PhanHoi
INSERT INTO PhanHoi(MaHS,MaGV,NoiDungPhanHoi) VALUES ('ND0007','ND0006',N'Em bị nhập sai điểm giữa kỳ');			
INSERT INTO PhanHoi(MaHS,MaGV,NoiDungPhanHoi) VALUES ('ND0012','ND0005',N'Em bị thiếu cột kiểm tra thường xuyên');			
INSERT INTO PhanHoi(MaHS,MaGV,NoiDungPhanHoi) VALUES ('ND0034','ND0059',N'Em bị thiếu cột cuối kỳ');	
GO

--Day
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0057','MH01')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0058','MH02')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0059','MH03')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0060','MH04')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0061','MH05')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0062','MH06')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0063','MH07')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0064','MH08')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0065','MH09')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0066','MH10')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0067','MH11')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0068','MH12')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0069','MH13')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0070','MH01')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0071','MH06')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0072','MH03')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0003','MH13')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0004','MH11')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0005','MH12')
INSERT INTO Day(MaGV,MaMonHoc) VALUES ('ND0006','MH12')
GO							

--ThoiKhoaBieu
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB01',N'10A1',1,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB02',N'10A2',1,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB03',N'10A3',1,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB04',N'11A1',1,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB05',N'11A2',1,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB06',N'11A3',1,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB07',N'12A1',1,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB08',N'12A2',1,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB09',N'12A3',1,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB10',N'10A1',2,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB11',N'10A2',2,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB12',N'10A3',2,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB13',N'11A1',2,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB14',N'11A2',2,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB15',N'11A3',2,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB16',N'12A1',2,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB17',N'12A2',2,2023);
INSERT INTO ThoiKhoaBieu(MaTKB,TenLop,HocKy,Nam) VALUES ('TKB18',N'12A3',2,2023);
GO

--ChiTietTKB
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH01',N'Toán',N'Thứ 2',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH01',N'Toán',N'Thứ 5',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH02',N'Ngữ Văn',N'Thứ 3',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH02',N'Ngữ Văn',N'Thứ 7',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH03',N'Anh Văn',N'Thứ 2',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH07',N'Vật Lí',N'Thứ 3',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH06',N'Địa Lý',N'Thứ 4',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH08',N'GDCD',N'Thứ 4',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH04',N'Sinh Học',N'Thứ 4',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH09',N'Hóa Học',N'Thứ 5',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH10',N'Tin Học',N'Thứ 5',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH11',N'Thể dục',N'Thứ 6',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH13',N'Công nghệ',N'Thứ 6',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH05',N'Lịch Sử',N'Thứ 6',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH12',N'GDQP', N'Thứ 6',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH10',N'Tin Học',N'Thứ 7',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB01','MH09',N'Hóa Học',N'Thứ 7',1,1);

INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH03',N'Anh Văn',N'Thứ 2',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH09',N'Hóa Học',N'Thứ 2',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH01',N'Toán',N'Thứ 2',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH04',N'Sinh Học',N'Thứ 3',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH02',N'Ngữ Văn',N'Thứ 3',2,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH07',N'Vật Lí',N'Thứ 3',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH10',N'Tin Học',N'Thứ 4',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH12',N'GDQP',N'Thứ 4',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH06',N'Địa Lý',N'Thứ 4',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH01',N'Toán',N'Thứ 4',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH08',N'GDCD',N'Thứ 5',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH13',N'Công Nghệ',N'Thứ 5',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH04',N'Sinh Học',N'Thứ 5',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH07',N'Vật Lí',N'Thứ 5',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH02',N'Ngữ Văn',N'Thứ 6',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH05',N'Lịch Sử',N'Thứ 6',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH09',N'Hóa Học',N'Thứ 6',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH01',N'Toán',N'Thứ 6',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH11',N'Thể Dục',N'Thứ 7',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH01',N'Toán',N'Thứ 7',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH02',N'Ngữ Văn',N'Thứ 7',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04','MH10',N'Tin Học',N'Thứ 7',4,4);
--INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04',NULL,N'Chào Cờ',N'Thứ 2',1,1);
--INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04',NULL,N'SHL',N'Thứ 7',5,5);

--------------------
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH02',N'Ngữ Văn',N'Thứ 2',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH01',N'Toán',N'Thứ 2',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH03',N'Anh Văn',N'Thứ 2',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH10',N'Tin Học',N'Thứ 3',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH07',N'Vật Lí',N'Thứ 3',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH12',N'GDQP',N'Thứ 3',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH01',N'Toán',N'Thứ 3',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH01',N'Toán',N'Thứ 4',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH05',N'Lịch Sử',N'Thứ 4',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH08',N'GDCD',N'Thứ 4',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH09',N'Hóa Học',N'Thứ 4',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH06',N'Địa Lý',N'Thứ 5',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH04',N'Sinh Học',N'Thứ 5',2,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH13',N'Công Nghệ',N'Thứ 5',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH07',N'Vật Lí',N'Thứ 6',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH09',N'Hóa Học',N'Thứ 6',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH01',N'Toán',N'Thứ 6',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH11',N'Thể dục',N'Thứ 6',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH02',N'Ngữ Văn',N'Thứ 7',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH03',N'Anh Văn',N'Thứ 7',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB05','MH10',N'Tin Học',N'Thứ 7',4,4);
---------

INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH07',N'Vật Lí',N'Thứ 2',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH09',N'Hóa Học',N'Thứ 2',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH03',N'Anh Văn',N'Thứ 2',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH01',N'Toán',N'Thứ 2',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH06',N'Địa Lý',N'Thứ 3',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH04',N'Sinh Học',N'Thứ 3',2,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH13',N'Công Nghệ',N'Thứ 3',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH02',N'Ngữ Văn',N'Thứ 4',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH03',N'Anh Văn',N'Thứ 4',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH10',N'Tin Học',N'Thứ 4',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH10',N'Tin Học',N'Thứ 5',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH07',N'Vật Lí',N'Thứ 5',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH12',N'GDQP',N'Thứ 5',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH01',N'Toán',N'Thứ 5',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH02',N'Ngữ Văn',N'Thứ 6',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH11',N'Thể Dục',N'Thứ 6',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH01',N'Toán',N'Thứ 6',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH01',N'Toán',N'Thứ 7',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH05',N'Lịch Sử',N'Thứ 7',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH08',N'GDCD',N'Thứ 7',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB02','MH09',N'Hóa Học',N'Thứ 7',4,4);

--------
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH07',N'Vật Lí',N'Thứ 2',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH09',N'Hóa Học',N'Thứ 2',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH01',N'Toán',N'Thứ 2',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH11',N'Thể dục',N'Thứ 2',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH10',N'Tin Học',N'Thứ 3',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH07',N'Vật Lí',N'Thứ 3',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH12',N'GDQP',N'Thứ 3',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH01',N'Toán',N'Thứ 3',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH01',N'Toán',N'Thứ 4',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH05',N'Lịch Sử',N'Thứ 4',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH08',N'GDCD',N'Thứ 4',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH09',N'Hóa Học',N'Thứ 4',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH13',N'Công Nghệ',N'Thứ 5',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH03',N'Ngữ Văn',N'Thứ 5',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH06',N'Địa Lý',N'Thứ 5',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH03',N'Ngữ Văn',N'Thứ 6',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH01',N'Toán',N'Thứ 6',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH02',N'Anh Văn',N'Thứ 6',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH04',N'Sinh Học',N'Thứ 7',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH02',N'Anh Văn',N'Thứ 7',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB03','MH10',N'Tin Học',N'Thứ 7',4,4);

----
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH07',N'Vật Lí',N'Thứ 2',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH01',N'Toán',N'Thứ 2',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH11',N'Thể Dục',N'Thứ 2',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH09',N'Hóa Học',N'Thứ 2',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH13',N'Công Nghệ',N'Thứ 3',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH03',N'Ngữ Văn',N'Thứ 3',2,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH06',N'Địa Lý',N'Thứ 3',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH01',N'Toán',N'Thứ 4',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH05',N'Lịch Sử',N'Thứ 4',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH08',N'GDCD',N'Thứ 4',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH09',N'Hóa Học',N'Thứ 4',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH04',N'Sinh Học',N'Thứ 5',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH02',N'Anh Văn',N'Thứ 5',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH10',N'Tin Học',N'Thứ 5',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH03',N'Ngữ Văn',N'Thứ 6',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH01',N'Toán',N'Thứ 6',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH02',N'Anh Văn',N'Thứ 6',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH10',N'Tin Học',N'Thứ 7',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH07',N'Vật Lí',N'Thứ 7',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH12',N'GDQP',N'Thứ 7',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB06','MH01',N'Toán',N'Thứ 7',4,4);

-----
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH03',N'Ngữ Văn',N'Thứ 2',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH13',N'Công Nghệ',N'Thứ 2',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH06',N'Địa Lý',N'Thứ 2',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH09',N'Hóa Học',N'Thứ 3',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH11',N'Thể Dục',N'Thứ 3',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH01',N'Toán',N'Thứ 3',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH07',N'Vật Lí',N'Thứ 3',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH02',N'Anh Văn',N'Thứ 4',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH01',N'Toán',N'Thứ 4',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH03',N'Ngữ Văn',N'Thứ 4',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH01',N'Toán',N'Thứ 5',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH12',N'GDQP',N'Thứ 5',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH07',N'Vật Lí',N'Thứ 5',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH10',N'Tin Học',N'Thứ 5',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH01',N'Toán',N'Thứ 6',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH05',N'Lịch Sử',N'Thứ 6',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH08',N'GDCD',N'Thứ 6',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH09',N'Hóa Học',N'Thứ 6',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH10',N'Tin Học',N'Thứ 7',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH04',N'Sinh Học',N'Thứ 7',2,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB07','MH02',N'Anh Văn',N'Thứ 7',4,4);
----

INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH02',N'Anh Văn',N'Thứ 2',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH01',N'Toán',N'Thứ 2',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH03',N'Ngữ Văn',N'Thứ 2',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH02',N'Anh Văn',N'Thứ 3',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH10',N'Tin Học',N'Thứ 3',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH04',N'Sinh Học',N'Thứ 3',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH02',N'Ngữ Văn',N'Thứ 4',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH13',N'Công Nghệ',N'Thứ 4',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH06',N'Địa Lý',N'Thứ 4',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH08',N'GDCD',N'Thứ 5',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH09',N'Hóa Học',N'Thứ 5',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH01',N'Toán',N'Thứ 5',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH05',N'Lịch Sử',N'Thứ 5',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH07',N'Vật Lí',N'Thứ 6',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH10',N'Tin Học',N'Thứ 6',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH01',N'Toán',N'Thứ 6',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH12',N'GDQP',N'Thứ 6',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH09',N'Hóa Học',N'Thứ 7',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH11',N'Thể Dục',N'Thứ 7',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH01',N'Toán',N'Thứ 7',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB08','MH07',N'Vật Lí',N'Thứ 7',4,4);

-------

INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH12',N'GDQP',N'Thứ 2',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH07',N'Vật Lí',N'Thứ 2',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH10',N'Tin Học',N'Thứ 2',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH01',N'Toán',N'Thứ 2',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH02',N'Anh Văn',N'Thứ 3',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH04',N'Sinh Học',N'Thứ 3',2,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH10',N'Tin Học',N'Thứ 3',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH09',N'Hóa Học',N'Thứ 4',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH11',N'Thể Dục',N'Thứ 4',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH01',N'Toán',N'Thứ 4',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH07',N'Vật Lí',N'Thứ 4',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH08',N'GDCD',N'Thứ 5',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH09',N'Hóa Học',N'Thứ 5',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH01',N'Toán',N'Thứ 5',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH05',N'Lịch Sử',N'Thứ 5',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH02',N'Anh Văn',N'Thứ 6',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH03',N'Ngữ Văn',N'Thứ 6',2,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH01',N'Toán',N'Thứ 6',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH13',N'Công Nghệ',N'Thứ 7',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH03',N'Ngữ Văn',N'Thứ 7',2,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB09','MH06',N'Địa Lý',N'Thứ 7',4,4);

INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH01',N'Toán',N'Thứ 2',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH01',N'Toán',N'Thứ 5',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH02',N'Ngữ Văn',N'Thứ 3',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH02',N'Ngữ Văn',N'Thứ 7',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH03',N'Anh Văn',N'Thứ 2',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH07',N'Vật Lí',N'Thứ 3',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH06',N'Địa Lý',N'Thứ 4',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH08',N'GDCD',N'Thứ 4',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH04',N'Sinh Học',N'Thứ 4',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH09',N'Hóa Học',N'Thứ 5',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH10',N'Tin Học',N'Thứ 5',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH11',N'Thể dục',N'Thứ 6',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH13',N'Công nghệ',N'Thứ 6',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH05',N'Lịch Sử',N'Thứ 6',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH12',N'GDQP', N'Thứ 6',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH10',N'Tin Học',N'Thứ 7',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB18','MH09',N'Hóa Học',N'Thứ 7',1,1);

INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH03',N'Anh Văn',N'Thứ 2',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH09',N'Hóa Học',N'Thứ 2',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH01',N'Toán',N'Thứ 2',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH04',N'Sinh Học',N'Thứ 3',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH02',N'Ngữ Văn',N'Thứ 3',2,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH07',N'Vật Lí',N'Thứ 3',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH10',N'Tin Học',N'Thứ 4',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH12',N'GDQP',N'Thứ 4',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH06',N'Địa Lý',N'Thứ 4',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH01',N'Toán',N'Thứ 4',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH08',N'GDCD',N'Thứ 5',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH13',N'Công Nghệ',N'Thứ 5',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH04',N'Sinh Học',N'Thứ 5',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH07',N'Vật Lí',N'Thứ 5',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH02',N'Ngữ Văn',N'Thứ 6',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH05',N'Lịch Sử',N'Thứ 6',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH09',N'Hóa Học',N'Thứ 6',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH01',N'Toán',N'Thứ 6',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH11',N'Thể Dục',N'Thứ 7',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH01',N'Toán',N'Thứ 7',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH02',N'Ngữ Văn',N'Thứ 7',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB12','MH10',N'Tin Học',N'Thứ 7',4,4);
--INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04',NULL,N'Chào Cờ',N'Thứ 2',1,1);
--INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB04',NULL,N'SHL',N'Thứ 7',5,5);

--------------------
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH02',N'Ngữ Văn',N'Thứ 2',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH01',N'Toán',N'Thứ 2',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH03',N'Anh Văn',N'Thứ 2',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH10',N'Tin Học',N'Thứ 3',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH07',N'Vật Lí',N'Thứ 3',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH12',N'GDQP',N'Thứ 3',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH01',N'Toán',N'Thứ 3',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH01',N'Toán',N'Thứ 4',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH05',N'Lịch Sử',N'Thứ 4',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH08',N'GDCD',N'Thứ 4',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH09',N'Hóa Học',N'Thứ 4',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH06',N'Địa Lý',N'Thứ 5',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH04',N'Sinh Học',N'Thứ 5',2,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH13',N'Công Nghệ',N'Thứ 5',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH07',N'Vật Lí',N'Thứ 6',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH09',N'Hóa Học',N'Thứ 6',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH01',N'Toán',N'Thứ 6',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH11',N'Thể dục',N'Thứ 6',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH02',N'Ngữ Văn',N'Thứ 7',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH03',N'Anh Văn',N'Thứ 7',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB13','MH10',N'Tin Học',N'Thứ 7',4,4);
---------

INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH07',N'Vật Lí',N'Thứ 2',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH09',N'Hóa Học',N'Thứ 2',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH03',N'Anh Văn',N'Thứ 2',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH01',N'Toán',N'Thứ 2',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH06',N'Địa Lý',N'Thứ 3',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH04',N'Sinh Học',N'Thứ 3',2,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH13',N'Công Nghệ',N'Thứ 3',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH02',N'Ngữ Văn',N'Thứ 4',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH03',N'Anh Văn',N'Thứ 4',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH10',N'Tin Học',N'Thứ 4',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH10',N'Tin Học',N'Thứ 5',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH07',N'Vật Lí',N'Thứ 5',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH12',N'GDQP',N'Thứ 5',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH01',N'Toán',N'Thứ 5',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH02',N'Ngữ Văn',N'Thứ 6',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH11',N'Thể Dục',N'Thứ 6',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH01',N'Toán',N'Thứ 6',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH01',N'Toán',N'Thứ 7',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH05',N'Lịch Sử',N'Thứ 7',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH08',N'GDCD',N'Thứ 7',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB10','MH09',N'Hóa Học',N'Thứ 7',4,4);

--------
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH07',N'Vật Lí',N'Thứ 2',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH09',N'Hóa Học',N'Thứ 2',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH01',N'Toán',N'Thứ 2',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH11',N'Thể dục',N'Thứ 2',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH10',N'Tin Học',N'Thứ 3',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH07',N'Vật Lí',N'Thứ 3',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH12',N'GDQP',N'Thứ 3',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH01',N'Toán',N'Thứ 3',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH01',N'Toán',N'Thứ 4',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH05',N'Lịch Sử',N'Thứ 4',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH08',N'GDCD',N'Thứ 4',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH09',N'Hóa Học',N'Thứ 4',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH13',N'Công Nghệ',N'Thứ 5',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH03',N'Ngữ Văn',N'Thứ 5',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH06',N'Địa Lý',N'Thứ 5',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH03',N'Ngữ Văn',N'Thứ 6',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH01',N'Toán',N'Thứ 6',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH02',N'Anh Văn',N'Thứ 6',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH04',N'Sinh Học',N'Thứ 7',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH02',N'Anh Văn',N'Thứ 7',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB11','MH10',N'Tin Học',N'Thứ 7',4,4);

----
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH07',N'Vật Lí',N'Thứ 2',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH01',N'Toán',N'Thứ 2',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH11',N'Thể Dục',N'Thứ 2',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH09',N'Hóa Học',N'Thứ 2',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH13',N'Công Nghệ',N'Thứ 3',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH03',N'Ngữ Văn',N'Thứ 3',2,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH06',N'Địa Lý',N'Thứ 3',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH01',N'Toán',N'Thứ 4',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH05',N'Lịch Sử',N'Thứ 4',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH08',N'GDCD',N'Thứ 4',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH09',N'Hóa Học',N'Thứ 4',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH04',N'Sinh Học',N'Thứ 5',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH02',N'Anh Văn',N'Thứ 5',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH10',N'Tin Học',N'Thứ 5',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH03',N'Ngữ Văn',N'Thứ 6',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH01',N'Toán',N'Thứ 6',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH02',N'Anh Văn',N'Thứ 6',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH10',N'Tin Học',N'Thứ 7',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH07',N'Vật Lí',N'Thứ 7',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH12',N'GDQP',N'Thứ 7',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB14','MH01',N'Toán',N'Thứ 7',4,4);

-----
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH03',N'Ngữ Văn',N'Thứ 2',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH13',N'Công Nghệ',N'Thứ 2',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH06',N'Địa Lý',N'Thứ 2',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH09',N'Hóa Học',N'Thứ 3',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH11',N'Thể Dục',N'Thứ 3',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH01',N'Toán',N'Thứ 3',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH07',N'Vật Lí',N'Thứ 3',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH02',N'Anh Văn',N'Thứ 4',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH01',N'Toán',N'Thứ 4',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH03',N'Ngữ Văn',N'Thứ 4',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH01',N'Toán',N'Thứ 5',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH12',N'GDQP',N'Thứ 5',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH07',N'Vật Lí',N'Thứ 5',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH10',N'Tin Học',N'Thứ 5',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH01',N'Toán',N'Thứ 6',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH05',N'Lịch Sử',N'Thứ 6',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH08',N'GDCD',N'Thứ 6',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH09',N'Hóa Học',N'Thứ 6',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH10',N'Tin Học',N'Thứ 7',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH04',N'Sinh Học',N'Thứ 7',2,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB15','MH02',N'Anh Văn',N'Thứ 7',4,4);
----

INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH02',N'Anh Văn',N'Thứ 2',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH01',N'Toán',N'Thứ 2',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH03',N'Ngữ Văn',N'Thứ 2',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH02',N'Anh Văn',N'Thứ 3',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH10',N'Tin Học',N'Thứ 3',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH04',N'Sinh Học',N'Thứ 3',3,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH02',N'Ngữ Văn',N'Thứ 4',1,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH13',N'Công Nghệ',N'Thứ 4',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH06',N'Địa Lý',N'Thứ 4',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH08',N'GDCD',N'Thứ 5',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH09',N'Hóa Học',N'Thứ 5',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH01',N'Toán',N'Thứ 5',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH05',N'Lịch Sử',N'Thứ 5',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH07',N'Vật Lí',N'Thứ 6',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH10',N'Tin Học',N'Thứ 6',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH01',N'Toán',N'Thứ 6',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH12',N'GDQP',N'Thứ 6',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH09',N'Hóa Học',N'Thứ 7',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH11',N'Thể Dục',N'Thứ 7',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH01',N'Toán',N'Thứ 7',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB16','MH07',N'Vật Lí',N'Thứ 7',4,4);

-------

INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH12',N'GDQP',N'Thứ 2',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH07',N'Vật Lí',N'Thứ 2',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH10',N'Tin Học',N'Thứ 2',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH01',N'Toán',N'Thứ 2',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH02',N'Anh Văn',N'Thứ 3',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH04',N'Sinh Học',N'Thứ 3',2,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH10',N'Tin Học',N'Thứ 3',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH09',N'Hóa Học',N'Thứ 4',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH11',N'Thể Dục',N'Thứ 4',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH01',N'Toán',N'Thứ 4',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH07',N'Vật Lí',N'Thứ 4',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH08',N'GDCD',N'Thứ 5',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH09',N'Hóa Học',N'Thứ 5',2,2);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH01',N'Toán',N'Thứ 5',3,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH05',N'Lịch Sử',N'Thứ 5',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH02',N'Anh Văn',N'Thứ 6',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH03',N'Ngữ Văn',N'Thứ 6',2,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH01',N'Toán',N'Thứ 6',4,4);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH13',N'Công Nghệ',N'Thứ 7',1,1);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH03',N'Ngữ Văn',N'Thứ 7',2,3);
INSERT INTO ChiTietTKB(MaTKB,MaMonHoc,TenMon,Thu,TietBatDau,TietKetThuc) VALUES ('TKB17','MH06',N'Địa Lý',N'Thứ 7',4,4);
----
GO

--NoiQuy
INSERT INTO NoiQuy(MaNQ,DieuLe,SoDiemTru,NamHoc) VALUES ('NQ01',N'Đi trễ',5,2023);					
INSERT INTO NoiQuy(MaNQ,DieuLe,SoDiemTru,NamHoc) VALUES ('NQ02',N'Nghỉ không phép',5,2023);					
INSERT INTO NoiQuy(MaNQ,DieuLe,SoDiemTru,NamHoc) VALUES ('NQ03',N'Không đúng đồng phục',5,2023);					
INSERT INTO NoiQuy(MaNQ,DieuLe,SoDiemTru,NamHoc) VALUES ('NQ04',N'Đánh nhau',10,2023);					
INSERT INTO NoiQuy(MaNQ,DieuLe,SoDiemTru,NamHoc) VALUES ('NQ05',N'Trốn lao động',10,2023);			
GO

--QuyDinh
INSERT INTO QuyDinh(MaNQL,MaNQ,NgayBanHanh) VALUES ('ND0001','NQ01','7/9/2023');
INSERT INTO QuyDinh(MaNQL,MaNQ,NgayBanHanh) VALUES ('ND0001','NQ02','7/9/2023');
INSERT INTO QuyDinh(MaNQL,MaNQ,NgayBanHanh) VALUES ('ND0002','NQ03','7/9/2023');
INSERT INTO QuyDinh(MaNQL,MaNQ,NgayBanHanh) VALUES ('ND0002','NQ04','7/9/2023');
INSERT INTO QuyDinh(MaNQL,MaNQ,NgayBanHanh) VALUES ('ND0002','NQ05','7/9/2023');
GO

--DanhGIa
INSERT INTO DanhGia(MaNQ,TenLop,SoLanViPham) VALUES ('NQ01',N'10A1',3);				
INSERT INTO DanhGia(MaNQ,TenLop,SoLanViPham) VALUES ('NQ02',N'10A2',4);				
INSERT INTO DanhGia(MaNQ,TenLop,SoLanViPham) VALUES ('NQ03',N'10A3',2);				
INSERT INTO DanhGia(MaNQ,TenLop,SoLanViPham) VALUES ('NQ04',N'11A1',6);				
INSERT INTO DanhGia(MaNQ,TenLop,SoLanViPham) VALUES ('NQ01',N'11A2',1);				
INSERT INTO DanhGia(MaNQ,TenLop,SoLanViPham) VALUES ('NQ02',N'11A3',2);				
INSERT INTO DanhGia(MaNQ,TenLop,SoLanViPham) VALUES ('NQ03',N'12A1',2);				
INSERT INTO DanhGia(MaNQ,TenLop,SoLanViPham) VALUES ('NQ04',N'12A2',1);				
INSERT INTO DanhGia(MaNQ,TenLop,SoLanViPham) VALUES ('NQ03',N'10A1',2);
GO

UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 40,KTGiuaKy = 9.5,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0007' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 9.1,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0007' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 20,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0007' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 9.5,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0007' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 8,KTCuoiKy = 8.6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0007' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 8.8,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0007' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0007' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 6.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0007' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29.2,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0007' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 9.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0007' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.5,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0007' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 6,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0007' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0007' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 40,KTGiuaKy = 6.5,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0008' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 9.1,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0008' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 20,KTGiuaKy = 4,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0008' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 9.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0008' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 8,KTCuoiKy = 8.6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0008' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 8.8,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0008' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0008' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0008' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29.2,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0008' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 9.2,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0008' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0008' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 6.7,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0008' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 5.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0008' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 9.5,KTCuoiKy = 9.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0009' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 9.1,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0009' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 23,KTGiuaKy = 8.5,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0009' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.5,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0009' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8.1,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0009' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 8.8,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0009' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0009' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0009' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29.2,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0009' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 9.2,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0009' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.5,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0009' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 7.7,KTCuoiKy = 7.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0009' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6.5,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0009' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 40,KTGiuaKy = 6.5,KTCuoiKy = 5.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0010' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 6.1,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0010' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 20,KTGiuaKy = 4,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0010' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 6.5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0010' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 9,KTCuoiKy = 5.6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0010' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 9.8,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0010' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 6.9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0010' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0010' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29.2,KTGiuaKy = 10,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0010' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 6.2,KTCuoiKy = 5.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0010' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6.9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0010' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 6.7,KTCuoiKy = 5.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0010' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 5.5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0010' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 40,KTGiuaKy = 6.5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0011' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 4,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0011' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 20,KTGiuaKy = 4,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0011' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 6.5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0011' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 9.1,KTCuoiKy = 5.6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0011' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 9.8,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0011' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 6.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0011' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0011' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29.2,KTGiuaKy = 10,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0011' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6,KTCuoiKy = 5.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0011' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0011' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 6,KTCuoiKy = 5.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0011' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 5.5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0011' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0012' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 4.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0012' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 20,KTGiuaKy = 4.9,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0012' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 10,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0012' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 9.1,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0012' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 9,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0012' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 6.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0012' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0012' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20.2,KTGiuaKy = 4,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0012' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6,KTCuoiKy = 5.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0012' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20,KTGiuaKy = 6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0012' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 6.7,KTCuoiKy = 5.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0012' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 5.5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0012' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 40,KTGiuaKy = 10,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0013' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9,KTCuoiKy = 8.75 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0013' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 27,KTGiuaKy = 8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0013' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0013' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 8.3,KTCuoiKy = 7.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0013' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26.5,KTGiuaKy = 8.8,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0013' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.7,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0013' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13.5,KTGiuaKy = 7.8,KTCuoiKy = 7.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0013' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29.2,KTGiuaKy = 10,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0013' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.5,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0013' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0013' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 7,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0013' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 6,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0013' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 36,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0014' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 26,KTGiuaKy = 4.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0014' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 29,KTGiuaKy = 4.9,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0014' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 10,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0014' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9.1,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0014' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0014' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 6.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0014' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0014' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20.2,KTGiuaKy = 4,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0014' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6,KTCuoiKy = 5.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0014' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20,KTGiuaKy = 6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0014' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 6.7,KTCuoiKy = 5.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0014' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 5,KTCuoiKy = 5.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0014' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 36,KTGiuaKy = 6,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0015' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 21,KTGiuaKy = 4.5,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0015' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 4.9,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0015' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 10,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0015' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 9.1,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0015' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0015' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0015' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0015' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 4,KTCuoiKy = 9.6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0015' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0015' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0015' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 6.7,KTCuoiKy = 5.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0015' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 5,KTCuoiKy = 5.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0015' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 36,KTGiuaKy = 9,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0016' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0016' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 8,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0016' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 10,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0016' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 9.1,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0016' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0016' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0016' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0016' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8,KTCuoiKy = 9.6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0016' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0016' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0016' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 6.7,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0016' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 8,KTCuoiKy = 8.6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0016' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0017' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 9.8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0017' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0017' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 10,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0017' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 9.1,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0017' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 9.8,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0017' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0017' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 6.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0017' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.9,KTCuoiKy = 9.6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0017' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0017' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8.3,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0017' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 6.7,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0017' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 8.8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0017' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 4,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0018' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0018' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8.4,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0018' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 3,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0018' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 9.1,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0018' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 9.8,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0018' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0018' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 6.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0018' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0018' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0018' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8.3,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0018' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6.7,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0018' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 8.8,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0018' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 4,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0019' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0019' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8.4,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0019' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 3,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0019' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 9.1,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0019' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 9.8,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0019' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0019' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 6.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0019' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0019' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0019' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8.3,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0019' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6.7,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0019' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 8.8,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0019' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 4,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0020' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0020' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0020' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 3,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0020' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 9.1,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0020' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0020' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0020' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 10,KTGiuaKy = 6.7,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0020' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0020' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0020' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0020' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6.7,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0020' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 8.8,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0020' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 4,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0021' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 38,KTGiuaKy = 6,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0021' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 27,KTGiuaKy = 8.8,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0021' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8,KTCuoiKy = 4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0021' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 9.1,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0021' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0021' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0021' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 10,KTGiuaKy = 6.7,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0021' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0021' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 5,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0021' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0021' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6.7,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0021' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 8.8,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0021' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0022' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 38,KTGiuaKy = 3,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0022' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0022' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8.3,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0022' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 9.1,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0022' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 4,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0022' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0022' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 6.7,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0022' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0022' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 8,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0022' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0022' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6.7,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0022' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 8.8,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0022' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 7,KTCuoiKy = 5.6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0023' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 33,KTGiuaKy = 9,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0023' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0023' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.3,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0023' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9.1,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0023' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 6,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0023' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 6,KTCuoiKy = 3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0023' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 6.7,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0023' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.4,KTCuoiKy = 4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0023' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 8.6,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0023' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.4,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0023' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6.7,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0023' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0023' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 7.3,KTCuoiKy = 5.6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0024' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 33,KTGiuaKy = 9.7,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0024' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0024' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0024' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 4,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0024' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 6,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0024' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8,KTCuoiKy = 3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0024' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 6.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0024' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.3,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0024' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 8.7,KTCuoiKy = 3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0024' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 22,KTGiuaKy = 8.4,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0024' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6.7,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0024' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0024' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 7.3,KTCuoiKy = 5.6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0025' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 33,KTGiuaKy = 3,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0025' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 3,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0025' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.5,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0025' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0025' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 6,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0025' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8,KTCuoiKy = 3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0025' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 6.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0025' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.3,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0025' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 8.7,KTCuoiKy = 3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0025' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 22,KTGiuaKy = 8.4,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0025' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6.7,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0025' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0025' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 7.3,KTCuoiKy = 5.6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0026' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 33,KTGiuaKy = 6,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0026' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0026' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.5,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0026' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0026' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 6,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0026' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0026' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 6.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0026' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.3,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0026' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0026' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8.4,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0026' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6.7,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0026' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8.6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0026' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 9.5,KTCuoiKy = 9.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0027' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9.1,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0027' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 27,KTGiuaKy = 8.5,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0027' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.5,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0027' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 8.1,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0027' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.8,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0027' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0027' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0027' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29.2,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0027' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 9.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0027' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.5,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0027' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 7.7,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0027' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0027' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 8.5,KTCuoiKy = 9.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0028' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8.1,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0028' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 29,KTGiuaKy = 8.5,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0028' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8.5,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0028' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 8.1,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0028' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.8,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0028' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0028' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0028' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29.2,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0028' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0028' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8.5,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0028' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8.7,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0028' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6.5,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0028' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 9.5,KTCuoiKy = 8.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0029' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9.1,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0029' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 28,KTGiuaKy = 9.5,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0029' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.5,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0029' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9.1,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0029' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.8,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0029' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0029' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0029' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28.2,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0029' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.2,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0029' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0029' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9.7,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0029' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 6.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0029' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 9.5,KTCuoiKy = 9.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0030' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9.1,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0030' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 29,KTGiuaKy = 9.5,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0030' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 9.5,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0030' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9.1,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0030' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 9.8,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0030' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0030' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0030' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29.2,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0030' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 9.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0030' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 9.5,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0030' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9.7,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0030' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 8.5,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0030' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 8.5,KTCuoiKy = 8.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0031' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8.1,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0031' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 8.5,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0031' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8.5,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0031' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 8.1,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0031' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8.8,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0031' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0031' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0031' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28.2,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0031' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8.2,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0031' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0031' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8.7,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0031' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 8.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0031' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 9.6,KTCuoiKy = 9.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0032' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9.1,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0032' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 9.6,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0032' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.6,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0032' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9.1,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0032' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.8,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0032' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0032' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0032' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26.2,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0032' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0032' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0032' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9.7,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0032' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9.6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0032' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 8.6,KTCuoiKy = 9.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0033' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9.1,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0033' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 8.6,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0033' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8.6,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0033' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9.1,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0033' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0033' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0033' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0033' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26.2,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0033' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0033' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8.6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0033' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9.7,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0033' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 8.6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0033' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 8.6,KTCuoiKy = 9.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0034' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8.1,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0034' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 8.6,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0034' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8.6,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0034' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 8.1,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0034' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0034' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0034' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0034' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28.6,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0034' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0034' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8.6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0034' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8.7,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0034' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 8.6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0034' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 9.6,KTCuoiKy = 8.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0035' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9.1,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0035' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 9.6,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0035' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.6,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0035' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9.1,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0035' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0035' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0035' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0035' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26.8,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0035' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.2,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0035' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0035' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9.7,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0035' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9.6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0035' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 8.6,KTCuoiKy = 8.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0036' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9.1,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0036' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 8.6,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0036' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8.6,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0036' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9.1,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0036' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0036' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0036' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0036' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 22.8,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0036' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.2,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0036' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8.6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0036' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9.7,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0036' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 8.6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0036' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 9.6,KTCuoiKy = 9.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0037' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9.1,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0037' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 9.6,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0037' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.6,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0037' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9.1,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0037' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0037' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0037' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0037' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29.2,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0037' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0037' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0037' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9.7,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0037' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9.6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0037' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 8.6,KTCuoiKy = 9.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0038' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9.1,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0038' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 8.6,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0038' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.6,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0038' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9.1,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0038' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.5,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0038' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0038' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0038' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0038' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0038' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8.6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0038' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9.7,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0038' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 8.6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0038' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 8.6,KTCuoiKy = 9.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0039' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8.1,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0039' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 8.6,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0039' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.6,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0039' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 8.1,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0039' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.5,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0039' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.9,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0039' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 8.5,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0039' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.5,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0039' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0039' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8.6,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0039' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8.7,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0039' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 8.6,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0039' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 8.6,KTCuoiKy = 9.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0040' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 36,KTGiuaKy = 8.1,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0040' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 8.6,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0040' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.6,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0040' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8.1,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0040' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.5,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0040' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.9,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0040' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 15,KTGiuaKy = 8.5,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0040' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.5,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0040' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0040' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.6,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0040' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8.7,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0040' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8.6,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0040' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 8.6,KTCuoiKy = 9.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0041' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0041' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 8.6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0041' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8.6,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0041' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0041' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.5,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0041' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.9,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0041' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 15,KTGiuaKy = 9.5,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0041' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.5,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0041' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0041' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0041' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8.7,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0041' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8.6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0041' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 8.6,KTCuoiKy = 9.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0042' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0042' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 8.6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0042' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8.6,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0042' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0042' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.1,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0042' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.9,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0042' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 15,KTGiuaKy = 9.1,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0042' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.1,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0042' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0042' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0042' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8.7,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0042' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8.6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0042' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9.6,KTCuoiKy = 8.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0043' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0043' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 9.6,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0043' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.6,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0043' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0043' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 9.1,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0043' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.9,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0043' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9.1,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0043' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.1,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0043' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 9.2,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0043' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 0,KTThuongXuyen = 0,KTGiuaKy = 0,KTCuoiKy = 0 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0043' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 9.7,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0043' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 9.6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0043' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 9.6,KTCuoiKy = 8.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0044' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0044' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9.6,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0044' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.6,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0044' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0044' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 8.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0044' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 9.9,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0044' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8.3,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0044' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8.3,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0044' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 9.2,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0044' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.6,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0044' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 9.7,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0044' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 9.6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0044' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 8.6,KTCuoiKy = 8.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0045' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0045' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8.6,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0045' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8.6,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0045' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0045' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0045' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 9.9,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0045' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8.3,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0045' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0045' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 9.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0045' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0045' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 9.7,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0045' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8.6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0045' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 8.6,KTCuoiKy = 8.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0046' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0046' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8.6,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0046' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8.6,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0046' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0046' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0046' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 9.9,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0046' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0046' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0046' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 9.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0046' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0046' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 9.7,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0046' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 8.6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0046' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 8.6,KTCuoiKy = 7.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0047' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9,KTCuoiKy = 7.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0047' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8.6,KTCuoiKy = 7.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0047' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8.6,KTCuoiKy = 7.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0047' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9,KTCuoiKy = 7.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0047' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 7.3,KTCuoiKy = 7.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0047' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 9.9,KTCuoiKy = 7.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0047' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 7.3,KTCuoiKy = 7.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0047' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 7.3,KTCuoiKy = 7.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0047' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 9.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0047' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0047' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 9.7,KTCuoiKy = 7.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0047' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 8.6,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0047' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 9.6,KTCuoiKy = 8.1 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0048' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0048' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9.6,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0048' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.6,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0048' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0048' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 7.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0048' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 9.9,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0048' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 7.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0048' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 7.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0048' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 9.2,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0048' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0048' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 9.7,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0048' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 9.6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0048' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 8,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0049' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 6.8,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0049' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0049' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0049' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0049' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 6,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0049' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0049' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 14,KTGiuaKy = 10,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0049' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.3,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0049' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20,KTGiuaKy = 10,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0049' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 8.4,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0049' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 6.7,KTCuoiKy = 3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0049' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8.6,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0049' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 4,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0050' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 33,KTGiuaKy = 6.8,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0050' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 3,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0050' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 5,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0050' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0050' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 6,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0050' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0050' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 10,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0050' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.3,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0050' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20,KTGiuaKy = 8.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0050' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 8.4,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0050' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6.7,KTCuoiKy = 3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0050' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8.6,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0050' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 7,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0051' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 33,KTGiuaKy = 6.8,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0051' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0051' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 5,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0051' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0051' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 6,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0051' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0051' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 6,KTCuoiKy = 5.6 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0051' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.3,KTCuoiKy = 3 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0051' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20,KTGiuaKy = 8.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0051' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 8.4,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0051' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6.7,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0051' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8.6,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 1 AND MaHS= 'ND0051' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0007' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8.2,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0007' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 31,KTGiuaKy = 9,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0007' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0007' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 3.5,KTCuoiKy = 5.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0007' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 5,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0007' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.5,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0007' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 12,KTGiuaKy = 9.3,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0007' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0007' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 9.8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0007' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.8,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0007' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 8.5,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0007' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 9,KTGiuaKy = 9.5,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0007' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0008' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8.2,KTCuoiKy = 4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0008' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 31,KTGiuaKy = 9,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0008' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0008' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 3.5,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0008' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 5,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0008' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.2,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0008' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 12,KTGiuaKy = 9.3,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0008' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0008' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0008' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.8,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0008' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0008' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 9,KTGiuaKy = 9.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0008' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0009' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8.2,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0009' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 31,KTGiuaKy = 9,KTCuoiKy = 7.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0009' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0009' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 3.5,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0009' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 5,KTCuoiKy = 7.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0009' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.5,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0009' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9.3,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0009' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0009' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.8,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0009' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.8,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0009' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0009' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 9.5,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0009' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0010' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9.2,KTCuoiKy = 4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0010' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 31,KTGiuaKy = 6,KTCuoiKy = 5.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0010' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0010' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 3.5,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0010' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 5,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0010' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6.2,KTCuoiKy = 5.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0010' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 12,KTGiuaKy = 6.3,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0010' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 6.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0010' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0010' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6.8,KTCuoiKy = 5.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0010' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0010' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 9,KTGiuaKy = 6.5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0010' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 23,KTGiuaKy = 10,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0011' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 10,KTCuoiKy = 4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0011' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 31,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0011' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0011' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 3.5,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0011' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 3,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0011' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6,KTCuoiKy = 5.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0011' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 6.3,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0011' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 6.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0011' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 6.9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0011' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6.8,KTCuoiKy = 5.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0011' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 9.5,KTCuoiKy = 5.6 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0011' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 10,KTGiuaKy = 6.5,KTCuoiKy = 5.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0011' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 23,KTGiuaKy = 4,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0012' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 28,KTGiuaKy = 10,KTCuoiKy = 4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0012' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 31,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0012' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 5.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0012' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0012' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 3,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0012' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6.9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0012' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 6,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0012' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.7,KTCuoiKy = 9.7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0012' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0012' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6.8,KTCuoiKy = 5.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0012' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 9.5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0012' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 6,KTGiuaKy = 6.5,KTCuoiKy = 5.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0012' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0013' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35.5,KTGiuaKy = 8.75,KTCuoiKy = 7.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0013' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 9,KTCuoiKy = 7.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0013' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27.5,KTGiuaKy = 6.5,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0013' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 4.3,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0013' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.8,KTCuoiKy = 7.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0013' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.5,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0013' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16.4,KTGiuaKy = 9.3,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0013' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.7,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0013' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9,KTCuoiKy = 7.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0013' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0013' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0013' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0013' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 23,KTGiuaKy = 4,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0014' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 28,KTGiuaKy = 10,KTCuoiKy = 4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0014' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 31,KTGiuaKy = 6,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0014' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 5.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0014' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0014' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 3,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0014' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6.9,KTCuoiKy = 3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0014' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 6,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0014' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.7,KTCuoiKy = 9.7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0014' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 6,KTCuoiKy = 5.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0014' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6.8,KTCuoiKy = 5.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0014' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0014' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 6.5,KTCuoiKy = 5.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0014' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 23,KTGiuaKy = 4,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0015' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 28,KTGiuaKy = 10,KTCuoiKy = 4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0015' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 31,KTGiuaKy = 6.9,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0015' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 5.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0015' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0015' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 3,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0015' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6.9,KTCuoiKy = 3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0015' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 6.4,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0015' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.7,KTCuoiKy = 9.7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0015' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 6,KTCuoiKy = 5.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0015' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6.8,KTCuoiKy = 5.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0015' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0015' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 6.5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0015' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 23,KTGiuaKy = 9,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0016' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 7.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0016' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 31,KTGiuaKy = 6.9,KTCuoiKy = 9.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0016' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 5.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0016' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0016' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0016' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6.9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0016' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8,KTCuoiKy = 5.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0016' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.7,KTCuoiKy = 9.7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0016' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 6,KTCuoiKy = 5.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0016' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 7,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0016' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0016' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 6.5,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0016' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 23,KTGiuaKy = 9,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0017' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 7.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0017' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 31,KTGiuaKy = 6.9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0017' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0017' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0017' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0017' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 3,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0017' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0017' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.7,KTCuoiKy = 9.7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0017' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 6,KTCuoiKy = 5.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0017' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 4,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0017' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0017' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0017' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 23,KTGiuaKy = 9,KTCuoiKy = 7.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0018' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0018' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 38,KTGiuaKy = 6.9,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0018' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0018' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6,KTCuoiKy = 9.6 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0018' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0018' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 3,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0018' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 12,KTGiuaKy = 8,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0018' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0018' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0018' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 4,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0018' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 15,KTGiuaKy = 9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0018' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 10,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0018' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 23,KTGiuaKy = 9.3,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0019' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0019' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 38,KTGiuaKy = 6,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0019' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0019' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 6,KTCuoiKy = 9.6 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0019' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0019' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0019' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 12,KTGiuaKy = 8,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0019' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0019' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0019' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20,KTGiuaKy = 5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0019' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 15,KTGiuaKy = 5,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0019' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 10,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0019' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 23,KTGiuaKy = 3,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0020' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0020' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 38,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0020' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0020' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 2,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0020' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 3,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0020' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0020' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 12,KTGiuaKy = 8,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0020' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0020' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0020' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20,KTGiuaKy = 5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0020' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 15,KTGiuaKy = 5,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0020' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 10,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0020' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 23,KTGiuaKy = 3,KTCuoiKy = 7.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0021' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 7.6 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0021' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 38,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0021' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0021' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 3,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0021' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 7,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0021' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0021' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 12,KTGiuaKy = 8,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0021' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0021' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0021' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20,KTGiuaKy = 5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0021' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 15,KTGiuaKy = 5,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0021' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 10,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0021' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 26,KTGiuaKy = 9,KTCuoiKy = 7.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0022' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 8,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0022' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0022' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0022' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 3,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0022' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 7,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0022' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0022' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 12,KTGiuaKy = 8,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0022' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0022' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0022' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20,KTGiuaKy = 5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0022' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 15,KTGiuaKy = 5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0022' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 10,KTGiuaKy = 6,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0022' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 26,KTGiuaKy = 9,KTCuoiKy = 7.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0023' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 8,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0023' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0023' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0023' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0023' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 7.5,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0023' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0023' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 12,KTGiuaKy = 8,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0023' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0023' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0023' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20,KTGiuaKy = 5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0023' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 15,KTGiuaKy = 5.6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0023' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 10,KTGiuaKy = 6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0023' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 9.6,KTCuoiKy = 7.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0024' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 8,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0024' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0024' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 16,KTGiuaKy = 9,KTCuoiKy = 4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0024' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0024' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 7,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0024' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 17,KTGiuaKy = 6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0024' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 12,KTGiuaKy = 8,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0024' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 21,KTGiuaKy = 6.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0024' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 23,KTGiuaKy = 9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0024' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20,KTGiuaKy = 5,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0024' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 15,KTGiuaKy = 5.6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0024' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 10,KTGiuaKy = 6,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0024' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 9.6,KTCuoiKy = 7.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0025' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 8,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0025' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0025' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 16,KTGiuaKy = 9,KTCuoiKy = 4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0025' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0025' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 7,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0025' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 17,KTGiuaKy = 7,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0025' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0025' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 6.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0025' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0025' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0025' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 15,KTGiuaKy = 5.6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0025' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 6,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0025' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 9.6,KTCuoiKy = 7.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0026' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 8,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0026' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0026' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0026' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0026' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 7,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0026' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 7,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0026' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0026' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20,KTGiuaKy = 6.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0026' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0026' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0026' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 10,KTGiuaKy = 5.9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0026' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 6,KTGiuaKy = 9.7,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0026' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0027' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 8.2,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0027' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0027' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0027' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 3.5,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0027' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 5,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0027' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.5,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0027' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9.3,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0027' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0027' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0027' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.8,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0027' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0027' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 9.5,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0027' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0028' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 8.2,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0028' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 31,KTGiuaKy = 8,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0028' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0028' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 3.5,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0028' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 5,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0028' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8.5,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0028' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8.3,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0028' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0028' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0028' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8.8,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0028' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0028' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 8.5,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0028' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0029' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 9.2,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0029' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 31,KTGiuaKy = 9,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0029' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0029' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 3.5,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0029' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0029' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 31,KTGiuaKy = 9.5,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0029' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9.3,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0029' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 31,KTGiuaKy = 9.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0029' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0029' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.8,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0029' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0029' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 9.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0029' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0030' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 9.2,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0030' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 31,KTGiuaKy = 9,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0030' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0030' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 3.5,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0030' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0030' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.5,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0030' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9.3,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0030' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0030' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0030' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 9.8,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0030' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0030' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 9.5,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0030' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0031' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 8.2,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0031' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 33,KTGiuaKy = 8,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0031' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0031' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 5.5,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0031' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0031' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.5,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0031' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8.3,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0031' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0031' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0031' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8.8,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0031' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0031' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 8.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0031' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0032' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 9.2,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0032' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 33,KTGiuaKy = 9,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0032' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0032' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 5.5,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0032' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0032' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 9.6,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0032' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9.3,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0032' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0032' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0032' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9.8,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0032' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0032' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 9.6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0032' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0033' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 9.2,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0033' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0033' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0033' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 5.5,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0033' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0033' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.6,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0033' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9.3,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0033' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0033' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0033' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0033' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0033' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 8.6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0033' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0034' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 8.2,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0034' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0034' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0034' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 5.5,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0034' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0034' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.6,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0034' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8.3,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0034' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0034' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0034' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 8,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0034' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0034' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 8.6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0034' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 10,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0035' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 9.2,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0035' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0035' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0035' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 5.5,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0035' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0035' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 24,KTGiuaKy = 9.6,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0035' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9.3,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0035' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26.8,KTGiuaKy = 9.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0035' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0035' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0035' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0035' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 9.6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0035' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0036' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 9.2,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0036' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0036' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0036' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 5.5,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0036' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0036' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8.6,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0036' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9.3,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0036' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0036' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0036' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0036' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0036' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 8.6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0036' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0037' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 9.2,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0037' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0037' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0037' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 5.5,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0037' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0037' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.6,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0037' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9.3,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0037' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 18,KTGiuaKy = 9.7,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0037' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0037' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0037' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0037' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 9.6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0037' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 9.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0038' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 9.2,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0038' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9.5,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0038' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0038' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 5.5,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0038' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.5,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0038' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8.6,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0038' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9.3,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0038' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.7,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0038' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0038' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.5,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0038' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9.5,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0038' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 8.6,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0038' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 8.5,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0039' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 34,KTGiuaKy = 8.2,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0039' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8.5,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0039' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.5,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0039' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 5.5,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0039' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.5,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0039' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8.6,KTCuoiKy = 9.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0039' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8.3,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0039' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.7,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0039' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.5,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0039' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.5,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0039' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8.5,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0039' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 8.6,KTCuoiKy = 8.5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0039' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 8.5,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0040' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 36,KTGiuaKy = 8.2,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0040' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 8.5,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0040' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.5,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0040' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 5.5,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0040' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.5,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0040' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 8.6,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0040' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8.3,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0040' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.7,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0040' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.5,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0040' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.5,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0040' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8.5,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0040' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 8.6,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0040' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 37,KTGiuaKy = 9.5,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0041' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8.2,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0041' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 9.5,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0041' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.5,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0041' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 5.5,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0041' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.5,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0041' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0041' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8.3,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0041' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.7,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0041' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.5,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0041' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.5,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0041' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 9.5,KTCuoiKy = 7.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0041' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 8.6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0041' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 36,KTGiuaKy = 9.1,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0042' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 8.2,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0042' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 9.1,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0042' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.1,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0042' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 5.5,KTCuoiKy = 9.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0042' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.1,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0042' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8.6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0042' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8.3,KTCuoiKy = 9.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0042' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8.7,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0042' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.1,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0042' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.1,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0042' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 9.1,KTCuoiKy = 7.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0042' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 8.6,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0042' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 9.1,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0043' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 9.2,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0043' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 0,KTThuongXuyen = 0,KTGiuaKy = 0,KTCuoiKy = 0 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0043' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.1,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0043' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 5.5,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0043' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.1,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0043' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.6,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0043' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9.3,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0043' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.7,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0043' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.1,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0043' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.1,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0043' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 9.1,KTCuoiKy = 7.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0043' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 9.6,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0043' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8.3,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0044' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 9.2,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0044' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 8.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0044' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.3,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0044' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 5.5,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0044' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0044' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.6,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0044' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0044' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.7,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0044' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.3,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0044' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8.3,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0044' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 8.3,KTCuoiKy = 7.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0044' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 9.6,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0044' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 35,KTGiuaKy = 8.3,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0045' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 9.2,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0045' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 33,KTGiuaKy = 8.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0045' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.3,KTCuoiKy = 8.7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0045' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 17,KTGiuaKy = 5.5,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0045' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0045' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8.6,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0045' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 9.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0045' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.7,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0045' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 8.3,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0045' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 8.3,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0045' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 8.3,KTCuoiKy = 7.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0045' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 8.6,KTCuoiKy = 8.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0045' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 38,KTGiuaKy = 9.3,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0046' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 9.2,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0046' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 33,KTGiuaKy = 9.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0046' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.3,KTCuoiKy = 8.7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0046' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 5.5,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0046' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0046' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.6,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0046' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 9.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0046' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.7,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0046' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 9.3,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0046' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.3,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0046' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9.3,KTCuoiKy = 7.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0046' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 8.6,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0046' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 38,KTGiuaKy = 7.3,KTCuoiKy = 7.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0047' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 9.2,KTCuoiKy = 7.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0047' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 33,KTGiuaKy = 7.3,KTCuoiKy = 7.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0047' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 7.3,KTCuoiKy = 7.7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0047' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 5.5,KTCuoiKy = 7.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0047' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 7.3,KTCuoiKy = 7.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0047' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 8.6,KTCuoiKy = 7.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0047' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 7.3,KTCuoiKy = 7.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0047' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.7,KTCuoiKy = 7.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0047' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 7.3,KTCuoiKy = 7.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0047' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.8,KTCuoiKy = 7.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0047' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 8.3,KTCuoiKy = 7.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0047' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 8.6,KTCuoiKy = 7.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0047' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 38,KTGiuaKy = 7.3,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0048' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 32,KTGiuaKy = 9.2,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0048' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 33,KTGiuaKy = 7.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0048' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 7.3,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0048' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 20,KTGiuaKy = 5.5,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0048' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 7.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0048' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9.6,KTCuoiKy = 8.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0048' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 16,KTGiuaKy = 7.3,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0048' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.7,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0048' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 7.3,KTCuoiKy = 9.2 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0048' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 27,KTGiuaKy = 9.8,KTCuoiKy = 8.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0048' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 18,KTGiuaKy = 9.3,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0048' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 8,KTGiuaKy = 9.6,KTCuoiKy = 8.9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0048' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 9,KTCuoiKy = 7.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0049' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 8,KTCuoiKy = 6.8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0049' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 22,KTGiuaKy = 8,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0049' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 29,KTGiuaKy = 9.7,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0049' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 9.1,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0049' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 7,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0049' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 25,KTGiuaKy = 5,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0049' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0049' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20,KTGiuaKy = 4,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0049' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 8,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0049' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0049' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 10,KTGiuaKy = 8,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0049' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 9,KTGiuaKy = 9,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0049' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 9.6,KTCuoiKy = 7.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0050' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 8,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0050' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 22,KTGiuaKy = 8,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0050' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0050' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0050' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 7,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0050' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 17,KTGiuaKy = 5,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0050' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0050' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20,KTGiuaKy = 6,KTCuoiKy = 3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0050' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 4,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0050' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9.7,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0050' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 10,KTGiuaKy = 5.9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0050' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 9,KTGiuaKy = 5.7,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0050' AND MaMH= 'MH13';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 30,KTGiuaKy = 9.6,KTCuoiKy = 7.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0051' AND MaMH= 'MH01';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 39,KTGiuaKy = 8,KTCuoiKy = 7 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0051' AND MaMH= 'MH02';
UPDATE Diem SET SoLanKTThuongXuyen = 4,KTThuongXuyen = 22,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0051' AND MaMH= 'MH03';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 9,KTCuoiKy = 8 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0051' AND MaMH= 'MH04';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 13,KTGiuaKy = 9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0051' AND MaMH= 'MH05';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 26,KTGiuaKy = 7,KTCuoiKy = 6 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0051' AND MaMH= 'MH06';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 17,KTGiuaKy = 7,KTCuoiKy = 9.4 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0051' AND MaMH= 'MH07';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 19,KTGiuaKy = 9,KTCuoiKy = 10 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0051' AND MaMH= 'MH08';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 20,KTGiuaKy = 6,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0051' AND MaMH= 'MH09';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 4,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0051' AND MaMH= 'MH10';
UPDATE Diem SET SoLanKTThuongXuyen = 3,KTThuongXuyen = 28,KTGiuaKy = 9,KTCuoiKy = 5 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0051' AND MaMH= 'MH11';
UPDATE Diem SET SoLanKTThuongXuyen = 2,KTThuongXuyen = 10,KTGiuaKy = 5.9,KTCuoiKy = 9 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0051' AND MaMH= 'MH12';
UPDATE Diem SET SoLanKTThuongXuyen = 1,KTThuongXuyen = 9,KTGiuaKy = 5,KTCuoiKy = 8.3 WHERE NamHoc= 2023 AND HocKy= 2 AND MaHS= 'ND0051' AND MaMH= 'MH13';
GO
