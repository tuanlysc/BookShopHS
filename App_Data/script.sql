USE [master]
GO
/****** Object:  Database [TestDB]    Script Date: 19/11/2023 8:05:03 CH ******/
CREATE DATABASE [TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TestDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TestDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestDB', N'ON'
GO
ALTER DATABASE [TestDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [TestDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TestDB]
GO
/****** Object:  Table [dbo].[author]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[author](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[img] [nvarchar](255) NULL,
	[name_author] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[banner]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[banner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[img] [nvarchar](255) NULL,
	[link] [varchar](255) NOT NULL,
	[position] [int] NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[book_name] [nvarchar](255) NULL,
	[description] [nvarchar](4000) NULL,
	[image] [varchar](255) NULL,
	[price] [bigint] NOT NULL,
	[price_enter] [bigint] NOT NULL,
	[price_sale] [bigint] NOT NULL,
	[profit] [int] NULL,
	[publication_year] [int] NULL,
	[sale] [int] NULL,
	[star] [float] NULL,
	[status] [bit] NULL,
	[author_id] [int] NULL,
	[category_id] [int] NULL,
	[publicsher_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[total] [bigint] NULL,
	[user_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_item]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[book_id] [int] NULL,
	[cart_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](255) NULL,
	[category_status] [bit] NULL,
	[img] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail_receipt]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail_receipt](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[book_id] [int] NULL,
	[receipt_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favourite]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favourite](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favourite_item]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favourite_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[book_id] [int] NULL,
	[favourite_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image_products]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image_products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](255) NULL,
	[book_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[price] [bigint] NOT NULL,
	[quantity] [int] NULL,
	[status_rate] [int] NULL,
	[book_id] [int] NULL,
	[order_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address_ship] [nvarchar](255) NULL,
	[date_order] [datetime2](6) NULL,
	[full_name] [nvarchar](255) NULL,
	[note] [nvarchar](255) NULL,
	[phone] [varchar](255) NULL,
	[status] [int] NULL,
	[sum_money] [bigint] NOT NULL,
	[user_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publicsher]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publicsher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name_publicsher] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[receipt]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[receipt](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_added] [datetime2](6) NULL,
	[sum_money] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[img] [nvarchar](255) NULL,
	[rating] [nvarchar](255) NULL,
	[review_date] [datetime2](6) NULL,
	[star] [int] NULL,
	[book_id] [int] NULL,
	[detail_order_id] [int] NULL,
	[user_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NULL,
	[birthday] [date] NULL,
	[code_otp] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[enabled] [bit] NULL,
	[full_name] [nvarchar](255) NULL,
	[gender] [int] NULL,
	[img] [nvarchar](255) NULL,
	[img_cover] [nvarchar](255) NULL,
	[pass_word] [nvarchar](255) NULL,
	[telephone] [varchar](255) NULL,
	[user_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_roles]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_id] [bigint] NULL,
	[user_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warehouse]    Script Date: 19/11/2023 8:05:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warehouse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[book_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[author] ON 

INSERT [dbo].[author] ([id], [img], [name_author]) VALUES (1, N'', N'Takahashi Rumiko')
INSERT [dbo].[author] ([id], [img], [name_author]) VALUES (2, N'', N'Makoto Shinkai')
INSERT [dbo].[author] ([id], [img], [name_author]) VALUES (3, N'', N'Hans Christian Andersen')
INSERT [dbo].[author] ([id], [img], [name_author]) VALUES (4, N'', N'Aloha Higa')
SET IDENTITY_INSERT [dbo].[author] OFF
GO
SET IDENTITY_INSERT [dbo].[banner] ON 

INSERT [dbo].[banner] ([id], [img], [link], [position], [status]) VALUES (2, N'banner2.jpg', N'', 3, 1)
INSERT [dbo].[banner] ([id], [img], [link], [position], [status]) VALUES (3, N'banner1.jpg', N'', 4, 1)
INSERT [dbo].[banner] ([id], [img], [link], [position], [status]) VALUES (1005, N'banner7.png', N'', 1, 1)
INSERT [dbo].[banner] ([id], [img], [link], [position], [status]) VALUES (1006, N'banne9.png', N'', 2, 1)
SET IDENTITY_INSERT [dbo].[banner] OFF
GO

SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [category_name], [category_status], [img]) VALUES (1, N'Truyện tranh', 1, N'bedroom-at-night-dark-bedroom-white-moonlight-shine-intothe-room-wintertime-outside-little-boy-s-597081174.png')
INSERT [dbo].[categories] ([id], [category_name], [category_status], [img]) VALUES (2, N'Thiếu nhi', 1, N'money-adventures-for-young-explorers-kidscartoon-style-668232488.png')
INSERT [dbo].[categories] ([id], [category_name], [category_status], [img]) VALUES (3, N'Văn học', 1, N'a-closed-chapter-show-a-book-closing-with-a-chapter-titled-the-past-as-the-sun-rises-on-a-new-cha-761074171 (1).png')
INSERT [dbo].[categories] ([id], [category_name], [category_status], [img]) VALUES (5, N'Tiểu thuyết', 1, N'speleologist-a-scientist-dedicated-to-studying-caves-portrayed-in-a-scholarly-informative-style-427539393.png')
INSERT [dbo].[categories] ([id], [category_name], [category_status], [img]) VALUES (6, N'Tùy bút', 1, N'financial-planning-ultra-hd-realistic-vivid-colors-highly-detailed-uhd-drawing-pen-and-ink-pe-623601460.png')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [address], [birthday], [code_otp], [email], [enabled], [full_name], [gender], [img], [img_cover], [pass_word], [telephone], [user_name]) VALUES (1, N'Nam Định', CAST(N'2003-07-21' AS Date), NULL, N'duy2172003@gmail.com', NULL, N'Nguyễn Ngọc Duy', 1, N'2023-11-19-18-14-44.gif', N'coverdefault.png', N'$2a$10$qXAPzBE0zPO9LVEICIgc4OHQYRJjRcQKIo3IzUEm3SK0yJS03ciO.', N'0947669387', N'duy')
INSERT [dbo].[users] ([id], [address], [birthday], [code_otp], [email], [enabled], [full_name], [gender], [img], [img_cover], [pass_word], [telephone], [user_name]) VALUES (2, NULL, NULL, NULL, N'xanoi586@gmail.com', NULL, N'Trần Đức Khánh', 1, N'2023-11-19-19-3-51.png', N'coverdefault.png', N'$2a$10$5WsqHu1ZLiTLRV4/2LpQ1ubWmz4OrfEVX2HXBqz2VF8ahQutjUMia', NULL, N'duckhanh')
INSERT [dbo].[users] ([id], [address], [birthday], [code_otp], [email], [enabled], [full_name], [gender], [img], [img_cover], [pass_word], [telephone], [user_name]) VALUES (3, NULL, NULL, NULL, N'duy272494@gmail.com', NULL, N'Huy', 1, N'2023-11-19-19-17-39.jpeg', N'coverdefault.png', N'$2a$10$fE/f1PKdntOkF4AdGoJLj..McqPRSRLUGpgKyrj0lt00Xow/NCUi6', NULL, N'huy')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[publicsher] ON 

INSERT [dbo].[publicsher] ([id], [name_publicsher]) VALUES (1, N'NXB Kim Đồng')
INSERT [dbo].[publicsher] ([id], [name_publicsher]) VALUES (2, N'NXB Trẻ')
INSERT [dbo].[publicsher] ([id], [name_publicsher]) VALUES (3, N'NXB Hoa Học Trò')
INSERT [dbo].[publicsher] ([id], [name_publicsher]) VALUES (4, N'NXB Thanh Niên')
SET IDENTITY_INSERT [dbo].[publicsher] OFF
go
SET IDENTITY_INSERT [dbo].[book] ON 

INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (1, N'Inuyasha', N'<p>Inuyasha Inu Yasha, một &quot;b&aacute;n y&ecirc;u qu&aacute;i&quot; lu&ocirc;n c&ocirc; độc, bị cả y&ecirc;u giới v&agrave; nh&acirc;n giới chối bỏ v&igrave; &quot;kh&ocirc;ng phải người cũng chẳng phải y&ecirc;u qu&aacute;i&quot;. Với cuộc sống như một kẻ lang thang, bất cẩn, Inu Yasha đ&atilde; lu&ocirc;n ao ước được trở th&agrave;nh một &quot;y&ecirc;u qu&aacute;i to&agrave;n phần&quot; (thuần chủng) để c&oacute; được sức mạnh...</p>
', N'a-beautiful-girl-with-a-white-horse-full-moon-artistic-acrylic-painting-trending-on-pixiv-fanbox-899157301.png', 60000, 60000, 66000, 0, 2023, 10, 5, 1, 1, 1, 1)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (2, N'Your name', N'<p>Mitsuha &ndash; một nữ sinh sống tại v&ugrave;ng qu&ecirc; Nhật Bản, ch&aacute;n ng&aacute;n cuộc sống hiện tại v&agrave; lu&ocirc;n mong được l&ecirc;n Tokyo sống. Taki &ndash; một cậu nam sinh ở Tokyo, l&agrave;m th&ecirc;m tại một nh&agrave; h&agrave;ng &Yacute; sau giờ học, th&iacute;ch vẽ vời v&agrave; quan t&acirc;m đến ng&agrave;nh kiến tr&uacute;c. Cả hai bắt đầu c&oacute; những giấc mơ kỳ lạ kể từ khi ng&ocirc;i sao chổi Tiamat huyền thoại xuất hiện tr&ecirc;n bầu trời. Trong mơ, Mitsuha mơ th&agrave;nh một cậu nam sinh ở Tokyo c&ograve;n Taki mơ m&igrave;nh l&agrave; một c&ocirc; nữ sinh ở v&ugrave;ng qu&ecirc; Nhật Bản. V&agrave; họ nhanh ch&oacute;ng nhận ra m&igrave;nh đ&atilde; bị ho&aacute;n đổi cơ thể. Để tr&aacute;nh những rắc rối, họ để lại cho nhau những lời nhắn, những quy định y&ecirc;u cầu người kia kh&ocirc;ng được l&agrave;m g&igrave;.&nbsp;</p>
', N'anime-scenery-of-two-people-standing-on-a-rock-looking-at-the-sky-cosmic-skies-by-ray-dozy-beauti-500869808.png', 40000, 40000, 48000, 0, 2019, 20, 5, 1, 2, 1, 1)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (3, N'Tiệm cà phê gấu trắng', N'<p>Tiệm c&agrave; ph&ecirc; hiện đại do Gấu Trắng mở l&uacute;c n&agrave;o cũng rất đ&ocirc;ng kh&aacute;ch. Niềm vui thầm k&iacute;n của Gấu Trắng l&agrave; chọc cười những c&acirc;u chuyện kh&ocirc;ng đầu kh&ocirc;ng đu&ocirc;i với kh&aacute;ch quen của tiệm l&agrave; Gấu Tr&uacute;c. Mời c&aacute;c bạn tận hưởng những ng&agrave;y th&aacute;ng vui vẻ, &ecirc;m đềm nhưng cũng c&oacute; lắm chuyện xảy ra với nh&oacute;m bạn Gấu Trắng...&nbsp; Tập 1 với những c&acirc;u chuyện thường nhật h&agrave;i hước v&agrave; nhẹ nh&agrave;ng rất hấp dẫn về c&aacute;c lo&agrave;i động vật.</p>
', N'one-story-cafe-with-a-boat-on-the-roof-golden-ratio-fake-detail-trending-pixiv-fanbox-acrylic-pa-33418221.png', 50000, 50000, 50000, 0, 2023, 0, 5, 1, 4, 2, 3)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (4, N'Shin', N'<p>Mỗi tập truyện 120 trang, đơn giản từ h&igrave;nh thức đến nội dung... Nhưng cứ thử cầm l&ecirc;n xem, bạn sẽ kh&ocirc;ng thể rời mắt khỏi cuốn s&aacute;ch cho đến những trang cuối c&ugrave;ng! Bằng t&agrave;i năng kể chuyện, t&aacute;c giả đ&atilde; biến c&aacute;c trang s&aacute;ch của m&igrave;nh th&agrave;nh một s&acirc;n chơi tr&agrave;n ngập tiếng cười của những c&ocirc; b&eacute; cậu b&eacute; hồn nhi&ecirc;n, v&agrave; bạn đọc lớn, nhỏ khi cầm cuốn s&aacute;ch l&ecirc;n cũng bị h&uacute;t v&agrave;o s&acirc;n chơi đ&oacute; để c&ugrave;ng được sống, được cười với thế giới của trẻ nhỏ. B&ecirc;n cạnh thủ ph&aacute;p g&acirc;y cười của t&aacute;c giả, l&agrave; nghệ thuật lồng gh&eacute;p những b&agrave;i học gi&aacute;o dục v&agrave;o trong từng t&igrave;nh huống truyện.</p>

<p>Truyện của trẻ con, nhưng người lớn h&atilde;y c&ugrave;ng đọc, để nhận ra: Ch&uacute;ng ta c&ograve;n hiểu biết qu&aacute; &iacute;t về con trẻ! C&oacute; thể, Shin l&agrave; một cậu b&eacute; rất hiếu động, đầy c&aacute; t&iacute;nh. C&oacute; thể, những tr&ograve; tinh nghịch của Shin đ&ocirc;i khi qu&aacute; trớn, chả chừa một ai (phải chăng ở đ&acirc;y cũng c&oacute; sự tương đồng n&agrave;o đ&oacute; với những nh&acirc;n vật d&acirc;n gian h&agrave;i hước Việt Nam?). Nhưng đằng sau những t&igrave;nh huống dở mếu dở cười do Shin g&acirc;y ra, lại l&agrave; những b&agrave;i học nhẹ nh&agrave;ng m&agrave; cũng thật thấm th&iacute;a: người lớn thấy m&igrave;nh phải s&acirc;u s&aacute;t với trẻ hơn, v&agrave; c&aacute;c bạn đọc nhỏ tuổi chắc chắn cũng c&oacute; dịp nh&igrave;n nhận lại m&igrave;nh, để thấy c&aacute;i g&igrave; hay v&agrave; kh&ocirc;ng hay, trong gia đ&igrave;nh cũng như ngo&agrave;i x&atilde; hội.</p>
', N'3d-same-boy-mike-as-a-small-mongolian-boy-with-orange-shirt-and-blue-shorts-oliver-standing-in-the--146344725 (1).png', 100000, 100000, 130000, 0, 2017, 30, 5, 1, 3, 1, 2)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (5, N'Cô bé người cá Ponyo', N'<p>N&agrave;ng ti&ecirc;n c&aacute; Ponyo trốn khỏi gia đ&igrave;nh dưới đại dương, n&agrave;ng l&agrave; con g&aacute;i của vua biển cả. T&igrave;nh cờ khi l&ecirc;n tới mặt biển, Ponyo được cậu b&eacute; Sousuke nhặt được khi đang bị mắc kẹt trong một c&aacute;i chai, Sousuke đem Ponyo về nu&ocirc;i v&agrave; cậu b&eacute; cũng biết n&oacute; l&agrave; c&aacute; thần v&igrave; n&oacute; đ&atilde; gi&uacute;p vết thương tr&ecirc;n tay cậu b&eacute; biến mất. &Ocirc;ng vua biển biết con m&igrave;nh đ&atilde; trốn ra ngo&agrave;i, lập tức t&igrave;m bắt bằng được về. Nhưng l&uacute;c liếm v&agrave;o vết thương của Sousuke, Ponyo đ&atilde; nuốt m&aacute;u người v&agrave; trở n&ecirc;n mạnh mẽ kh&ocirc;ng ngờ, c&oacute; thể biến h&oacute;a tay ch&acirc;n t&ugrave;y &yacute;. Lợi dụng l&uacute;c cha m&igrave;nh vắng mặt, Ponyo đ&atilde; nhờ c&aacute;c em của m&igrave;nh gi&uacute;p sức trốn tho&aacute;t để t&igrave;m gặp Sousuke. C&ugrave;ng l&uacute;c trở th&agrave;nh người th&igrave; năng lực của Ponyo cũng từ từ biến mất&hellip;</p>
', N'cute-watercolour-fantasy-illustration-by-brian-kesinger--aesthetic-photorealistic-digital-paintin-425147958.png', 12000, 12000, 12000, 0, 2016, 0, 5, 1, 4, 2, 1)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (6, N'Totoro', N'<p><a href="https://vi.wikipedia.org/wiki/Gia_%C4%91%C3%ACnh">Gia đ&igrave;nh</a>&nbsp;Kusakabe chuyển về v&ugrave;ng th&ocirc;n qu&ecirc; sinh&nbsp;<a href="https://vi.wikipedia.org/wiki/S%E1%BB%B1_s%E1%BB%91ng">sống</a>. Căn nh&agrave; mới m&agrave; họ sắp ở d&acirc;n l&agrave;ng đồn đại l&agrave; bị&nbsp;<a href="https://vi.wikipedia.org/wiki/Ma">ma</a>&nbsp;&aacute;m. Nhưng điều ấy chẳng l&agrave;m lay chuyển nỗi t&ograve; m&ograve;, hiếu động của hai chị em nh&agrave; Kusakabe: Satsuki v&agrave; Mei. Tại ng&ocirc;i nh&agrave; mới, Satsuki v&agrave; Mei kết th&acirc;n với b&agrave; h&agrave;ng x&oacute;m tốt bụng t&ecirc;n Nanny v&agrave; cậu b&eacute; Kanta, c&ugrave;ng tuổi với Satsuki. Trong một lần chạy chơi v&agrave;o khu&nbsp;<a href="https://vi.wikipedia.org/wiki/R%E1%BB%ABng">rừng</a>&nbsp;gần nh&agrave;, c&ocirc; em g&aacute;i Mei mới 4 tuổi đ&atilde; t&igrave;nh cờ gặp gỡ con th&uacute; khổng lồ, vị ch&uacute;a tể của khu rừng. Mei kh&ocirc;ng những kh&ocirc;ng sợ h&atilde;i m&agrave; c&ograve;n tr&egrave;o l&ecirc;n c&aacute;i bụng bự của n&oacute; m&agrave; nghịch ngợm. C&ocirc; b&eacute; đặt t&ecirc;n cho con vật k&igrave; lạ n&agrave;y l&agrave; Totoro, theo t&ecirc;n con th&uacute; trong cuốn&nbsp;<a href="https://vi.wikipedia.org/wiki/S%C3%A1ch">s&aacute;ch</a>&nbsp;tranh của c&ocirc;. Sau đ&oacute; do mệt n&ecirc;n Mei dần ngủ thiếp đi, tới khi tỉnh lại, Totoro đ&atilde; biến mất. Khi Mei kể về con vật k&igrave; lạ ấy, c&ocirc; chị Satsuki cũng muốn được gặp Totoro một lần.</p>
', N'create-a-heartwarming-scene-with-a-child-and-their-favorite-toy-exploring-a-mysterious-forest-totor-547052350.png', 30000, 30000, 31500, 0, 2021, 5, 5, 1, 1, 2, 1)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (7, N'Nàng tiên cá', N'<p>N&agrave;ng ti&ecirc;n c&aacute; nhỏ sống trong một vương quốc dưới nước c&ugrave;ng với cha của n&agrave;ng &ndash; vua biển cả, mẹ của n&agrave;ng, b&agrave; nội n&agrave;ng v&agrave; năm người chị, mỗi người chỉ hơn k&eacute;m nhau c&oacute; một tuổi. Khi mỗi một n&agrave;ng ti&ecirc;n c&aacute; đủ 15 tuổi, n&agrave;ng sẽ được ph&eacute;p bơi l&ecirc;n mặt nước để nh&igrave;n ngắm thế giới ph&iacute;a tr&ecirc;n. Khi c&aacute;c chị n&agrave;ng đủ tuổi, mỗi người họ bơi l&ecirc;n mặt nước v&agrave; khi trở về, n&agrave;ng ti&ecirc;n c&aacute; lắng nghe một c&aacute;ch th&egrave;m muốn những mi&ecirc;u tả của c&aacute;c chị n&agrave;ng về mặt đất v&agrave; lo&agrave;i người.</p>
', N'character-design-of-a-beautiful-mermaid-in-hans-christian-andersen-style-playful-mermaid-tail-del-386165198.png', 80000, 80000, 96000, 0, 2016, 20, 5, 1, 3, 1, 4)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (8, N'Vùng đất linh hồn', N'<p>Nh&acirc;n vật ch&iacute;nh trong phim l&agrave; Taeko - một c&ocirc; g&aacute;i 27 tuổi độc th&acirc;n, sinh ra v&agrave; lớn l&ecirc;n ở Tokyo. C&acirc;u chuyện bắt đầu khi Taeko quyết định xin nghỉ ph&eacute;p để về n&ocirc;ng th&ocirc;n gi&uacute;p anh rể thu hoạch hoa rum. Từ đ&acirc;y, cuộc sống v&agrave; c&aacute;ch suy nghĩ của Taeko đ&atilde; bị thay đổi ho&agrave;n to&agrave;n, c&ocirc; nhận ra m&igrave;nh đ&atilde; bỏ lỡ rất nhiều điều trong tuổi thơ của m&igrave;nh.</p>
', N'transport-viewers-to-an-idyllic-countryside-as-a-young-boy-gleefully-fishes-alongside-his-wise-grand-923821462.png', 90000, 0, 90000, 0, 2019, 0, 5, 1, 2, 1, 1)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (9, N'Dưới Bầu Trời Sao Băng', N'<p>Trong b&oacute;ng đ&ecirc;m của thị trấn nhỏ, c&ocirc; g&aacute;i trẻ Emma đứng đ&oacute;, nh&igrave;n l&ecirc;n bầu trời đầy sao s&aacute;ng lấp l&aacute;nh. B&oacute;ng đ&egrave;n đường tắt, chỉ để lại &aacute;nh s&aacute;ng yếu ớt từ những ng&ocirc;i sao b&ecirc;n tr&ecirc;n.C&ocirc; ấy chẳng nhớ từ bao giờ đ&atilde; bắt đầu th&oacute;i quen hằng đ&ecirc;m n&agrave;y. Nhưng mỗi khi c&ocirc; đưa &aacute;nh mắt l&ecirc;n cao, những v&igrave; sao băng trắng h&oacute;a th&agrave;nh những đường vẽ lung linh, như những k&iacute; ức, những ước mơ.Dưới bầu trời sao băng, Emma cảm nhận được sự kỳ diệu v&agrave; b&iacute; ẩn của vũ trụ. Đ&oacute; kh&ocirc;ng chỉ l&agrave; những ng&ocirc;i sao s&aacute;ng, m&agrave; l&agrave; những c&acirc;u chuyện đ&atilde; được ch&uacute;ng viết tr&ecirc;n bức tranh đen đầy đ&aacute;ng ngạc nhi&ecirc;n.</p>
', N'the-blue-night-sky-is-full-of-stars-golden-ratio-fake-detail-trending-pixiv-fanbox-acrylic-palet-39993494.png', 150000, 150000, 172500, 0, 2023, 15, 5, 1, 2, 1, 1)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (10, N'Rừng nguyên sinh', N'<p>Mời bạn đ&oacute;n đọc</p>
', N'jungle-afternoon-daylight-shining-river-flowing--golden-ratio-fake-detail-trending-pixiv-fanb-363836413.png', 50000, 50000, 75000, 0, 2020, 50, 5, 1, 4, 3, 3)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (11, N'Vùng Đất Thảo Nguyên', N'<p>&quot;Thảo Nguy&ecirc;n V&ocirc; Tận&quot; kh&ocirc;ng chỉ l&agrave; một cuộc h&agrave;nh tr&igrave;nh qua những đỉnh đồi lạ mắt v&agrave; đồng cỏ b&aacute;t ng&aacute;t, m&agrave; c&ograve;n l&agrave; chuyến phi&ecirc;u lưu đầy &yacute; nghĩa. Tr&ecirc;n lưng những ch&uacute; ngựa h&ugrave;ng mạnh, những chiến binh dũng m&atilde;nh kh&ocirc;ng chỉ đối mặt với những th&aacute;ch thức của địa h&igrave;nh, m&agrave; c&ograve;n t&igrave;m kiếm sự hiểu biết về ch&iacute;nh bản th&acirc;n họ.</p>

<p>Tại đ&acirc;y, những người th&aacute;m hiểm sẽ kh&aacute;m ph&aacute; những cảm x&uacute;c mới lạ, b&iacute; ẩn của vũ trụ v&agrave; sức mạnh tiềm ẩn trong cuộc sống. H&atilde;y đồng h&agrave;nh c&ugrave;ng những bước ch&acirc;n tr&ecirc;n thảo nguy&ecirc;n m&ecirc;nh m&ocirc;ng, nơi m&agrave; c&acirc;u chuyện của bạn v&agrave; của ch&uacute;ng t&ocirc;i đan xen v&agrave;o nhau, tạo n&ecirc;n một bức tranh vĩ đại về sức sống v&agrave; những trải nghiệm đ&aacute;ng nhớ. Ch&agrave;o mừng bạn đến với thế giới của &quot;Thảo Nguy&ecirc;n V&ocirc; Tận,&quot; nơi m&agrave; cuộc phi&ecirc;u lưu chưa từng hết!</p>
', N'surveying-the-entire-islandtreesnaturemountainsrockshorses-runningwithout-human-golden-ratio-394388353.png', 80000, 80000, 88000, 0, 2023, 10, 5, 1, 4, 5, 1)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (12, N'Hoàng tử Azir', N'<p>Ho&agrave;ng tử b&eacute;&rdquo; kể về sự t&ograve; m&ograve;, c&aacute;i đẹp, t&igrave;nh y&ecirc;u, sự mất m&aacute;t&hellip; được nh&igrave;n từ đ&ocirc;i mắt ng&acirc;y thơ của Ho&agrave;ng tử b&eacute; sống tr&ecirc;n một tiểu h&agrave;nh tinh, ch&agrave;ng đ&atilde; đem l&ograve;ng y&ecirc;u một đ&oacute;a hồng. &ldquo;Ho&agrave;ng tử b&eacute;&rdquo; l&agrave; cuốn s&aacute;ch được đọc v&agrave; được dịch nhiều nhất trong kho t&agrave;ng văn học Ph&aacute;p</p>
', N'the-is-link-from-zelda-watching-how-de-moons-is-falling-over-the-lock-town-golden-ratio-fake-det-522379924.png', 50000, 50000, 50000, 0, 2022, 0, 5, 1, 1, 5, 1)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (13, N'Lời Thì Thầm Của Trái Tim', N'<p>Phim chuyển thể từ manga c&ugrave;ng t&ecirc;n của Aoi Hiiragi v&agrave; được chắp b&uacute;t bởi Yoshifumi Kondo, một họa sĩ hoạt h&igrave;nh h&agrave;ng đầu tại Ghibli, kh&ocirc;ng hề c&oacute; thế giới ma thuật, những ph&eacute;p m&agrave;u hay những chuyến phi&ecirc;u lưu k&igrave; th&uacute;. Whisper of the Heart l&agrave; một bộ phim đầy b&igrave;nh dị, kể về những con người nhỏ b&eacute; - những người trẻ tuổi đang theo đuổi con đường nghệ thuật, c&ugrave;ng với những mơ ước b&igrave;nh dị cu</p>
', N'would-you-like-some-candy-little-girl-white-panel-van-atmospheric-creepy-golden-ratio-fake-det-399516345.png', 200000, 200000, 260000, 0, 2023, 30, 5, 1, 1, 1, 1)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (14, N'Điều ước cuối cùng', N'<p>Trong thế giới n&agrave;y, mỗi điều ước đều l&agrave; một chặng h&agrave;nh tr&igrave;nh mới, mở c&aacute;nh cửa cho những kh&aacute;m ph&aacute;, những t&igrave;m kiếm, v&agrave; những quyết định quan trọng. Cuộc sống, giống như đồng hồ c&aacute;t, đang chạy m&atilde;i, v&agrave; mỗi gi&acirc;y tr&ocirc;i qua l&agrave; một điều qu&yacute; gi&aacute; kh&ocirc;ng thể lấy lại.</p>

<p>&quot;Điều Ước Cuối C&ugrave;ng&quot; kh&ocirc;ng chỉ l&agrave; c&acirc;u chuyện về những mong đợi v&agrave; ước vọng, m&agrave; c&ograve;n l&agrave; h&agrave;nh tr&igrave;nh để t&igrave;m kiếm &yacute; nghĩa thực sự của cuộc sống. Những người ch&uacute;ng ta gặp, những quyết định m&agrave; ch&uacute;ng ta đưa ra trong ng&agrave;y cuối c&ugrave;ng, c&oacute; thể thay đổi tất cả.</p>
', N'8k-quality-background-sparkling-blue-light-in-the-sky-realistic-photography-b9bab9-golden-ratio-676363896.png', 250000, 250000, 262500, 0, 2023, 5, 5, 1, 1, 1, 1)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (15, N'Chỉ Còn Ngày Hôm Nay', N'<p>Với mỗi nhấp nh&aacute;y của đồng hồ, tr&aacute;i tim anh ta đập nhanh hơn, v&agrave; t&acirc;m tr&iacute; anh ta trở n&ecirc;n bất ổn trong cuộc đua để ho&agrave;n th&agrave;nh mọi c&ocirc;ng việc. Những trang s&aacute;ch mở ra v&agrave; m&aacute;y t&iacute;nh hoạt động li&ecirc;n tục, nhưng &aacute;nh đ&egrave;n mờ mịt của đ&ecirc;m chỉ l&agrave;m tăng th&ecirc;m sự căng thẳng. Anh ta kh&ocirc;ng chỉ đang chạy đua với thời gian, m&agrave; c&ograve;n đang t&igrave;m kiếm sự s&aacute;ng tạo v&agrave; sức mạnh để vượt qua giới hạn của bản th&acirc;n.</p>

<p>B&ecirc;n cạnh những gi&acirc;y ph&uacute;t lo lắng, c&oacute; lẽ đ&acirc;y cũng l&agrave; thời điểm m&agrave; anh ta kh&aacute;m ph&aacute; ra sức mạnh b&iacute; ẩn của sự s&aacute;ng tạo, khả năng đồng đội v&agrave; sự ki&ecirc;n nhẫn. Cuộc h&agrave;nh tr&igrave;nh để vượt qua deadline kh&ocirc;ng chỉ l&agrave; một th&aacute;ch thức c&aacute; nh&acirc;n, m&agrave; c&ograve;n l&agrave; cơ hội để anh ta ph&aacute;t triển v&agrave; t&igrave;m thấy những gi&aacute; trị qu&yacute; b&aacute;u trong qu&aacute; tr&igrave;nh học tập. Ng&agrave;y mai c&oacute; thể l&agrave; một hạn cuối, nhưng cũng l&agrave; một cơ hội mới để tỏa s&aacute;ng.</p>
', N'boy-sitting-on-chair-typing-on-computer-in-the-morning-anime-blue-sky-564869211.png', 40000, 40000, 44000, 0, 2023, 10, 5, 1, 1, 1, 1)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (16, N'Mộ đom đóm', N'<p>&quot;Mộ đom đ&oacute;m&quot; kh&ocirc;ng chỉ l&agrave; một bức tranh ch&acirc;n thực về cuộc sống trong thời kỳ chiến tranh m&agrave; c&ograve;n chứa đựng nhiều th&ocirc;ng điệp s&acirc;u sắc về t&igrave;nh anh em, t&igrave;nh y&ecirc;u thương c&ugrave;ng t&iacute;nh nh&acirc;n văn. Bộ phim thể hiện c&aacute;ch con người cố gắng vượt qua kh&oacute; khăn v&agrave; t&igrave;m thấy niềm hy vọng trong những thời điểm tăm tối nhất.</p>
', N'transport-viewers-to-an-idyllic-countryside-as-a-young-boy-gleefully-fishes-alongside-his-wise-grand-390777958.png', 70000, 70000, 84000, 0, 2023, 20, 5, 1, 2, 1, 1)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (17, N'Cô phù thủy kiki', N'<p>Kiki l&agrave; một ph&ugrave; thủy trẻ vừa tổ chức sinh nhật lần thứ mười ba. Đ&oacute; l&agrave; một ng&agrave;y quan trọng trong gia đ&igrave;nh c&ocirc;: theo truyền thống ở độ tuổi n&agrave;y, c&aacute;c ph&ugrave; thủy phải rời xa cha mẹ v&agrave; định cư một năm ở một th&agrave;nh phố mới để ho&agrave;n thiện việc học của m&igrave;nh. Kiki lắng nghe bản tin thời tiết tr&ecirc;n đ&agrave;i ph&aacute;t thanh th&ocirc;ng b&aacute;o thời tiết , v&igrave; vậy, c&ocirc; quyết định m&igrave;nh sẽ rời đi v&agrave;o buổi tối c&ugrave;ng ng&agrave;y. Mặc d&ugrave; mẹ c&ocirc; hơi lo lắng, nhưng c&ocirc; kh&ocirc;ng cố gắng tr&igrave; ho&atilde;n việc khởi h&agrave;nh. B&agrave; đưa cho con g&aacute;i chiếc v&aacute;y đen truyền thống của ph&ugrave; thủy m&agrave; Kiki thấy qu&aacute; buồn tẻ so với sở th&iacute;ch của c&ocirc;, trong khi cha c&ocirc; đang gọi những người h&agrave;ng x&oacute;m đến dự lễ chia tay. Chia tay bạn b&egrave; v&agrave; chộp lấy chiếc radio m&agrave;u đỏ của cha, Kiki c&ugrave;ng với ch&uacute; m&egrave;o Zizi ngồi tr&ecirc;n c&acirc;y chổi của mẹ, va v&agrave;o c&agrave;nh c&acirc;y khi cất c&aacute;nh, bắt đầu một h&agrave;nh tr&igrave;nh d&agrave;i.</p>
', N'sorcerer-casting-powerful-spells--1980s-fantasy-anime-ova-209178651.png', 30000, 30000, 30000, 0, 2023, 0, 5, 1, 3, 3, 1)
INSERT [dbo].[book] ([id], [book_name], [description], [image], [price], [price_enter], [price_sale], [profit], [publication_year], [sale], [star], [status], [author_id], [category_id], [publicsher_id]) VALUES (18, N'Hắc kiếm sĩ', N'<p>1 năm sau khi sự việc SAO xảy ra, Kirito và Asuna một lần nữa làm quen với thế giới hiện thực, quay trở lại cuộc sống yên bình. Lúc này trong Gun Gale Online - một trò chơi trên mạng lại xảy ra vụ án giết người kì lạ, một game thủ bị &ldquo;Death Gun&rdquo; bắn trúng trong thế giới ảo, và anh ta cũng bị chết do suy tim trong thế giới thực. Kirito nhận được ủy thác của Bộ thông tin và truyền thông, xâm nhập vào GGO để tìm ra bộ mặt thật của &ldquo;Death Gun&rdquo;.̣̂t của &ldquo;Death Gun&rdquo;.̣̂ thông tin và truyền thông, xâm nhập vào GGO để tìm ra bộ mặt thật của &ldquo;Death Gun&rdquo;.</p>
', N'a-teenage-prince-standing-among-stars-with-brown-hair-and-wearing-a-black-cloak-magic-light-light-866639180.png', 60000, 60000, 60000, 0, 2023, 0, 5, 1, 1, 2, 1)
SET IDENTITY_INSERT [dbo].[book] OFF
GO
SET IDENTITY_INSERT [dbo].[cart] ON 

INSERT [dbo].[cart] ([id], [total], [user_id]) VALUES (1, NULL, 1)
INSERT [dbo].[cart] ([id], [total], [user_id]) VALUES (2, NULL, 2)
INSERT [dbo].[cart] ([id], [total], [user_id]) VALUES (3, NULL, 3)
SET IDENTITY_INSERT [dbo].[cart] OFF

GO
SET IDENTITY_INSERT [dbo].[favourite] ON 

INSERT [dbo].[favourite] ([id], [user_id]) VALUES (1, 1)
INSERT [dbo].[favourite] ([id], [user_id]) VALUES (2, 2)
INSERT [dbo].[favourite] ([id], [user_id]) VALUES (3, 3)
SET IDENTITY_INSERT [dbo].[favourite] OFF
GO
SET IDENTITY_INSERT [dbo].[favourite_item] ON 

INSERT [dbo].[favourite_item] ([id], [book_id], [favourite_id]) VALUES (1, 3, 2)
INSERT [dbo].[favourite_item] ([id], [book_id], [favourite_id]) VALUES (2, 9, 2)
INSERT [dbo].[favourite_item] ([id], [book_id], [favourite_id]) VALUES (3, 16, 2)
INSERT [dbo].[favourite_item] ([id], [book_id], [favourite_id]) VALUES (4, 14, 2)
INSERT [dbo].[favourite_item] ([id], [book_id], [favourite_id]) VALUES (5, 17, 2)
INSERT [dbo].[favourite_item] ([id], [book_id], [favourite_id]) VALUES (6, 18, 2)
INSERT [dbo].[favourite_item] ([id], [book_id], [favourite_id]) VALUES (7, 15, 2)
INSERT [dbo].[favourite_item] ([id], [book_id], [favourite_id]) VALUES (8, 2, 3)
INSERT [dbo].[favourite_item] ([id], [book_id], [favourite_id]) VALUES (9, 3, 3)
INSERT [dbo].[favourite_item] ([id], [book_id], [favourite_id]) VALUES (10, 5, 3)
INSERT [dbo].[favourite_item] ([id], [book_id], [favourite_id]) VALUES (11, 8, 3)
SET IDENTITY_INSERT [dbo].[favourite_item] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [address_ship], [date_order], [full_name], [note], [phone], [status], [sum_money], [user_id]) VALUES (1, N'hòa bình', CAST(N'2023-11-19T17:59:33.0590000' AS DateTime2), N'Khánh', N'', N'0989068747', 3, 90000, 2)
INSERT [dbo].[orders] ([id], [address_ship], [date_order], [full_name], [note], [phone], [status], [sum_money], [user_id]) VALUES (2, N'Nam Định', CAST(N'2023-11-19T18:22:37.9130000' AS DateTime2), N'Nguyễn Ngọc Duy ', N'okee', N'0947669387', 3, 110000, 1)
INSERT [dbo].[orders] ([id], [address_ship], [date_order], [full_name], [note], [phone], [status], [sum_money], [user_id]) VALUES (3, N'Hòa Bình', CAST(N'2023-11-19T18:28:29.6200000' AS DateTime2), N'Trần Đức Khánh', N'', N'0989906873', 3, 703000, 2)
INSERT [dbo].[orders] ([id], [address_ship], [date_order], [full_name], [note], [phone], [status], [sum_money], [user_id]) VALUES (4, N'ha noi', CAST(N'2023-11-19T19:07:00.7330000' AS DateTime2), N'huy', N'', N'0959906877', 3, 200000, 3)
INSERT [dbo].[orders] ([id], [address_ship], [date_order], [full_name], [note], [phone], [status], [sum_money], [user_id]) VALUES (5, N'Nam dinh', CAST(N'2023-11-19T19:14:25.0470000' AS DateTime2), N'huy', N'', N'0949484488', 3, 66000, 3)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([id], [price], [quantity], [status_rate], [book_id], [order_id]) VALUES (1, 90000, 1, 1, 8, 1)
INSERT [dbo].[order_detail] ([id], [price], [quantity], [status_rate], [book_id], [order_id]) VALUES (2, 48000, 1, 1, 2, 2)
INSERT [dbo].[order_detail] ([id], [price], [quantity], [status_rate], [book_id], [order_id]) VALUES (3, 50000, 1, 1, 12, 2)
INSERT [dbo].[order_detail] ([id], [price], [quantity], [status_rate], [book_id], [order_id]) VALUES (4, 12000, 1, 1, 5, 2)
INSERT [dbo].[order_detail] ([id], [price], [quantity], [status_rate], [book_id], [order_id]) VALUES (5, 44000, 1, 1, 15, 3)
INSERT [dbo].[order_detail] ([id], [price], [quantity], [status_rate], [book_id], [order_id]) VALUES (6, 84000, 1, 1, 16, 3)
INSERT [dbo].[order_detail] ([id], [price], [quantity], [status_rate], [book_id], [order_id]) VALUES (7, 172500, 1, 1, 9, 3)
INSERT [dbo].[order_detail] ([id], [price], [quantity], [status_rate], [book_id], [order_id]) VALUES (8, 262500, 1, 1, 14, 3)
INSERT [dbo].[order_detail] ([id], [price], [quantity], [status_rate], [book_id], [order_id]) VALUES (9, 30000, 1, 1, 17, 3)
INSERT [dbo].[order_detail] ([id], [price], [quantity], [status_rate], [book_id], [order_id]) VALUES (10, 60000, 1, 1, 18, 3)
INSERT [dbo].[order_detail] ([id], [price], [quantity], [status_rate], [book_id], [order_id]) VALUES (11, 50000, 1, 1, 3, 3)
INSERT [dbo].[order_detail] ([id], [price], [quantity], [status_rate], [book_id], [order_id]) VALUES (12, 48000, 1, 1, 2, 4)
INSERT [dbo].[order_detail] ([id], [price], [quantity], [status_rate], [book_id], [order_id]) VALUES (13, 12000, 1, 1, 5, 4)
INSERT [dbo].[order_detail] ([id], [price], [quantity], [status_rate], [book_id], [order_id]) VALUES (14, 50000, 1, 1, 3, 4)
INSERT [dbo].[order_detail] ([id], [price], [quantity], [status_rate], [book_id], [order_id]) VALUES (15, 90000, 1, 1, 8, 4)
INSERT [dbo].[order_detail] ([id], [price], [quantity], [status_rate], [book_id], [order_id]) VALUES (16, 66000, 1, 1, 1, 5)
SET IDENTITY_INSERT [dbo].[order_detail] OFF


GO
SET IDENTITY_INSERT [dbo].[review] ON 

INSERT [dbo].[review] ([id], [img], [rating], [review_date], [star], [book_id], [detail_order_id], [user_id]) VALUES (1, N'2023-11-19-18-1-6.jpeg', N'giao hàng nhanh', CAST(N'2023-11-19T18:01:15.3090000' AS DateTime2), 5, 8, 1, 2)
INSERT [dbo].[review] ([id], [img], [rating], [review_date], [star], [book_id], [detail_order_id], [user_id]) VALUES (2, N'2023-11-19-18-24-27.jpeg', N'okeee', CAST(N'2023-11-19T18:24:50.9000000' AS DateTime2), 5, 2, 2, 1)
INSERT [dbo].[review] ([id], [img], [rating], [review_date], [star], [book_id], [detail_order_id], [user_id]) VALUES (3, NULL, N'sản phẩm đúng với mô tả', CAST(N'2023-11-19T18:25:19.5340000' AS DateTime2), 5, 5, 4, 1)
INSERT [dbo].[review] ([id], [img], [rating], [review_date], [star], [book_id], [detail_order_id], [user_id]) VALUES (4, N'2023-11-19-18-25-36.gif', N'truyện hay', CAST(N'2023-11-19T18:25:48.4390000' AS DateTime2), 5, 12, 3, 1)
INSERT [dbo].[review] ([id], [img], [rating], [review_date], [star], [book_id], [detail_order_id], [user_id]) VALUES (5, N'2023-11-19-18-30-26.jpeg', N'', CAST(N'2023-11-19T18:30:46.9270000' AS DateTime2), 5, 14, 8, 2)
INSERT [dbo].[review] ([id], [img], [rating], [review_date], [star], [book_id], [detail_order_id], [user_id]) VALUES (6, NULL, N'', CAST(N'2023-11-19T18:45:18.2770000' AS DateTime2), 5, 3, 11, 2)
INSERT [dbo].[review] ([id], [img], [rating], [review_date], [star], [book_id], [detail_order_id], [user_id]) VALUES (7, NULL, N'sản phẩm đúng mô tả', CAST(N'2023-11-19T18:45:36.7390000' AS DateTime2), 5, 17, 9, 2)
INSERT [dbo].[review] ([id], [img], [rating], [review_date], [star], [book_id], [detail_order_id], [user_id]) VALUES (8, N'2023-11-19-18-46-29.jpeg', N'gói hàng cẩn thận, giao hàng nhanh', CAST(N'2023-11-19T18:47:44.5020000' AS DateTime2), 5, 16, 6, 2)
INSERT [dbo].[review] ([id], [img], [rating], [review_date], [star], [book_id], [detail_order_id], [user_id]) VALUES (9, NULL, N'chất lượng toẹt zời', CAST(N'2023-11-19T18:48:06.8560000' AS DateTime2), 5, 18, 10, 2)
INSERT [dbo].[review] ([id], [img], [rating], [review_date], [star], [book_id], [detail_order_id], [user_id]) VALUES (10, NULL, N'', CAST(N'2023-11-19T18:48:22.7950000' AS DateTime2), 5, 9, 7, 2)
INSERT [dbo].[review] ([id], [img], [rating], [review_date], [star], [book_id], [detail_order_id], [user_id]) VALUES (11, NULL, N'', CAST(N'2023-11-19T18:48:28.9890000' AS DateTime2), 5, 15, 5, 2)
INSERT [dbo].[review] ([id], [img], [rating], [review_date], [star], [book_id], [detail_order_id], [user_id]) VALUES (12, N'2023-11-19-19-9-34.jpeg', N'giao hàng nhanh', CAST(N'2023-11-19T19:09:37.4050000' AS DateTime2), 4, 2, 12, 3)
INSERT [dbo].[review] ([id], [img], [rating], [review_date], [star], [book_id], [detail_order_id], [user_id]) VALUES (13, N'2023-11-19-19-10-54.jpeg', N'shop tư vấn nhiệt tình', CAST(N'2023-11-19T19:11:08.0700000' AS DateTime2), 5, 3, 14, 3)
INSERT [dbo].[review] ([id], [img], [rating], [review_date], [star], [book_id], [detail_order_id], [user_id]) VALUES (14, NULL, N'giá rẻ', CAST(N'2023-11-19T19:11:42.8150000' AS DateTime2), 5, 8, 15, 3)
INSERT [dbo].[review] ([id], [img], [rating], [review_date], [star], [book_id], [detail_order_id], [user_id]) VALUES (15, N'2023-11-19-19-13-0.jpeg', N'giao hàng nhanh hơn cả nyc trở mặt', CAST(N'2023-11-19T19:13:36.4410000' AS DateTime2), 5, 5, 13, 3)
INSERT [dbo].[review] ([id], [img], [rating], [review_date], [star], [book_id], [detail_order_id], [user_id]) VALUES (16, N'2023-11-19-19-15-27.jpeg', N'10 điểm không có nhưng', CAST(N'2023-11-19T19:15:26.1390000' AS DateTime2), 5, 1, 16, 3)
SET IDENTITY_INSERT [dbo].[review] OFF

GO
SET IDENTITY_INSERT [dbo].[warehouse] ON 

INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (1, 0, 1)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (2, 0, 2)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (3, 0, 3)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (4, 0, 4)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (5, 0, 5)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (6, 0, 6)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (7, 0, 7)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (8, 0, 8)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (9, 0, 9)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (10, 0, 10)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (11, 0, 11)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (12, 0, 12)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (13, 0, 13)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (14, 0, 14)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (15, 0, 15)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (16, 0, 16)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (17, 0, 17)
INSERT [dbo].[warehouse] ([id], [quantity], [book_id]) VALUES (18, 0, 18)
SET IDENTITY_INSERT [dbo].[warehouse] OFF
GO
/****** Object:  Index [UK_9emlp6m95v5er2bcqkjsw48he]    Script Date: 19/11/2023 8:05:04 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_9emlp6m95v5er2bcqkjsw48he] ON [dbo].[cart]
(
	[user_id] ASC
)
WHERE ([user_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_41g4n0emuvcm3qyf1f6cn43c0]    Script Date: 19/11/2023 8:05:04 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_41g4n0emuvcm3qyf1f6cn43c0] ON [dbo].[categories]
(
	[category_name] ASC
)
WHERE ([category_name] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_tn0yetnb6bftwuygek6071cs4]    Script Date: 19/11/2023 8:05:04 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_tn0yetnb6bftwuygek6071cs4] ON [dbo].[favourite]
(
	[user_id] ASC
)
WHERE ([user_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_23hqcbcwiib9tuycgmxlo196g]    Script Date: 19/11/2023 8:05:04 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_23hqcbcwiib9tuycgmxlo196g] ON [dbo].[review]
(
	[detail_order_id] ASC
)
WHERE ([detail_order_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_k8d0f2n7n88w1a16yhua64onx]    Script Date: 19/11/2023 8:05:04 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_k8d0f2n7n88w1a16yhua64onx] ON [dbo].[users]
(
	[user_name] ASC
)
WHERE ([user_name] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_hvm2gnmowxcxtg76s3hcmbvbw]    Script Date: 19/11/2023 8:05:04 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_hvm2gnmowxcxtg76s3hcmbvbw] ON [dbo].[warehouse]
(
	[book_id] ASC
)
WHERE ([book_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [FK7jv5rwmalxg0a02a3ublrk0j2] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [FK7jv5rwmalxg0a02a3ublrk0j2]
GO
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [FKfl0iaofdbp1rfe46ku7jp8knx] FOREIGN KEY([publicsher_id])
REFERENCES [dbo].[publicsher] ([id])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [FKfl0iaofdbp1rfe46ku7jp8knx]
GO
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [FKklnrv3weler2ftkweewlky958] FOREIGN KEY([author_id])
REFERENCES [dbo].[author] ([id])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [FKklnrv3weler2ftkweewlky958]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FKg5uhi8vpsuy0lgloxk2h4w5o6] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FKg5uhi8vpsuy0lgloxk2h4w5o6]
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD  CONSTRAINT [FK1uobyhgl1wvgt1jpccia8xxs3] FOREIGN KEY([cart_id])
REFERENCES [dbo].[cart] ([id])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [FK1uobyhgl1wvgt1jpccia8xxs3]
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD  CONSTRAINT [FKis5hg85qbs5d91etr4mvd4tx6] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([id])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [FKis5hg85qbs5d91etr4mvd4tx6]
GO
ALTER TABLE [dbo].[detail_receipt]  WITH CHECK ADD  CONSTRAINT [FKccwdmfss4o7s0bgg8v539dgu0] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([id])
GO
ALTER TABLE [dbo].[detail_receipt] CHECK CONSTRAINT [FKccwdmfss4o7s0bgg8v539dgu0]
GO
ALTER TABLE [dbo].[detail_receipt]  WITH CHECK ADD  CONSTRAINT [FKfrt9w4jlvspxrmx8nrex7gj3d] FOREIGN KEY([receipt_id])
REFERENCES [dbo].[receipt] ([id])
GO
ALTER TABLE [dbo].[detail_receipt] CHECK CONSTRAINT [FKfrt9w4jlvspxrmx8nrex7gj3d]
GO
ALTER TABLE [dbo].[favourite]  WITH CHECK ADD  CONSTRAINT [FKrylb2w10mvr2e6cwbisk75obj] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[favourite] CHECK CONSTRAINT [FKrylb2w10mvr2e6cwbisk75obj]
GO
ALTER TABLE [dbo].[favourite_item]  WITH CHECK ADD  CONSTRAINT [FKqixgqbohw7fdho6ul1ktsc9f8] FOREIGN KEY([favourite_id])
REFERENCES [dbo].[favourite] ([id])
GO
ALTER TABLE [dbo].[favourite_item] CHECK CONSTRAINT [FKqixgqbohw7fdho6ul1ktsc9f8]
GO
ALTER TABLE [dbo].[favourite_item]  WITH CHECK ADD  CONSTRAINT [FKrj8wtcslsd94ove68tjxwu6n] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([id])
GO
ALTER TABLE [dbo].[favourite_item] CHECK CONSTRAINT [FKrj8wtcslsd94ove68tjxwu6n]
GO
ALTER TABLE [dbo].[image_products]  WITH CHECK ADD  CONSTRAINT [FKcenee1v8lpt1yb1nvs47mlnpp] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([id])
GO
ALTER TABLE [dbo].[image_products] CHECK CONSTRAINT [FKcenee1v8lpt1yb1nvs47mlnpp]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK3aceepmpjwpo8pdn7gmjdfckq] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK3aceepmpjwpo8pdn7gmjdfckq]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FKrws2q0si6oyd6il8gqe2aennc] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FKrws2q0si6oyd6il8gqe2aennc]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK32ql8ubntj5uh44ph9659tiih] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK32ql8ubntj5uh44ph9659tiih]
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD  CONSTRAINT [FK2lsjq50782j7degc8ehmjng2w] FOREIGN KEY([detail_order_id])
REFERENCES [dbo].[order_detail] ([id])
GO
ALTER TABLE [dbo].[review] CHECK CONSTRAINT [FK2lsjq50782j7degc8ehmjng2w]
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD  CONSTRAINT [FK6cpw2nlklblpvc7hyt7ko6v3e] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[review] CHECK CONSTRAINT [FK6cpw2nlklblpvc7hyt7ko6v3e]
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD  CONSTRAINT [FK70yrt09r4r54tcgkrwbeqenbs] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([id])
GO
ALTER TABLE [dbo].[review] CHECK CONSTRAINT [FK70yrt09r4r54tcgkrwbeqenbs]
GO
ALTER TABLE [dbo].[users_roles]  WITH CHECK ADD  CONSTRAINT [FK2o0jvgh89lemvvo17cbqvdxaa] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[users_roles] CHECK CONSTRAINT [FK2o0jvgh89lemvvo17cbqvdxaa]
GO
ALTER TABLE [dbo].[users_roles]  WITH CHECK ADD  CONSTRAINT [FKt4v0rrweyk393bdgt107vdx0x] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[users_roles] CHECK CONSTRAINT [FKt4v0rrweyk393bdgt107vdx0x]
GO
ALTER TABLE [dbo].[warehouse]  WITH CHECK ADD  CONSTRAINT [FK5m8bdjdsrod9nvrfmm2a81vrj] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([id])
GO
ALTER TABLE [dbo].[warehouse] CHECK CONSTRAINT [FK5m8bdjdsrod9nvrfmm2a81vrj]
GO
USE [master]
GO
ALTER DATABASE [TestDB] SET  READ_WRITE 
GO
