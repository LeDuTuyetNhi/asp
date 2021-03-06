USE [master]
GO
/****** Object:  Database [vegefoods]    Script Date: 28-Dec-19 1:40:48 PM ******/
CREATE DATABASE [vegefoods]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vegefoods', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\vegefoods.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'vegefoods_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\vegefoods_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [vegefoods] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vegefoods].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vegefoods] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vegefoods] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vegefoods] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vegefoods] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vegefoods] SET ARITHABORT OFF 
GO
ALTER DATABASE [vegefoods] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [vegefoods] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [vegefoods] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vegefoods] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vegefoods] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vegefoods] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vegefoods] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vegefoods] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vegefoods] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vegefoods] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vegefoods] SET  ENABLE_BROKER 
GO
ALTER DATABASE [vegefoods] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vegefoods] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vegefoods] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vegefoods] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vegefoods] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vegefoods] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vegefoods] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vegefoods] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [vegefoods] SET  MULTI_USER 
GO
ALTER DATABASE [vegefoods] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vegefoods] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vegefoods] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vegefoods] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [vegefoods]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 28-Dec-19 1:40:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comment](
	[comment_id] [int] NOT NULL,
	[cus_email] [varchar](255) NULL,
	[cus_name] [nvarchar](200) NULL,
	[des] [nvarchar](500) NULL,
	[status] [int] NULL,
	[created] [datetime] NULL,
	[post_id] [int] NULL,
	[rep_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 28-Dec-19 1:40:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](255) NULL,
	[address] [nvarchar](300) NULL,
	[num_order] [int] NULL,
	[num_successful_order] [int] NULL,
	[sum] [decimal](10, 2) NULL,
	[status] [int] NULL,
	[created] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Food]    Script Date: 28-Dec-19 1:40:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [text] NULL,
	[price] [int] NULL,
	[price_promo] [int] NULL,
	[thumb] [varchar](255) NULL,
	[img] [varchar](255) NULL,
	[unit] [nvarchar](10) NULL,
	[percent_promo] [int] NULL,
	[rating] [int] NULL,
	[sold] [int] NULL,
	[point] [int] NULL,
	[type] [int] NULL,
	[status] [int] NULL,
	[username] [varchar](50) NULL,
	[modified] [datetime] NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[food_type]    Script Date: 28-Dec-19 1:40:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[food_type](
	[type_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [nvarchar](50) NULL,
	[type_pos] [int] NULL,
	[type_img] [varchar](255) NULL,
	[status] [int] NULL,
	[username] [varchar](50) NULL,
	[modified] [datetime] NULL,
 CONSTRAINT [PK_food_type] PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[log_activity]    Script Date: 28-Dec-19 1:40:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[log_activity](
	[log_id] [int] NOT NULL,
	[username] [varchar](50) NULL,
	[description] [nvarchar](300) NULL,
	[time_log] [datetime] NULL,
	[type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Member]    Script Date: 28-Dec-19 1:40:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[username] [varchar](50) NOT NULL,
	[pass] [varchar](255) NULL,
	[name] [nvarchar](200) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](255) NULL,
	[status] [int] NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_Member_1] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 28-Dec-19 1:40:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[cus_name] [nvarchar](100) NULL,
	[cus_phone] [varchar](50) NULL,
	[cus_add] [nvarchar](255) NULL,
	[quan] [int] NULL,
	[sum] [int] NULL,
	[status] [int] NULL,
	[modified] [datetime] NULL,
	[created] [datetime] NULL,
	[cus_username] [varchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 28-Dec-19 1:40:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[order_id] [int] NOT NULL,
	[food_id] [int] NOT NULL,
	[quan] [int] NULL,
	[unit] [nvarchar](10) NULL,
	[price] [int] NULL,
	[total] [int] NULL,
 CONSTRAINT [PK__order_de__D4ADA6F4ED1659D9] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[food_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[post]    Script Date: 28-Dec-19 1:40:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[post](
	[post_id] [int] NOT NULL,
	[title] [nvarchar](300) NULL,
	[short_des] [nvarchar](500) NULL,
	[des] [nvarchar](max) NULL,
	[img] [varchar](255) NULL,
	[status] [int] NULL,
	[username] [varchar](50) NULL,
	[modified] [datetime] NULL,
	[created] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[relative_food]    Script Date: 28-Dec-19 1:40:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[relative_food](
	[food1_id] [int] NOT NULL,
	[food2_id] [int] NOT NULL,
	[des] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[food1_id] ASC,
	[food2_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[setting]    Script Date: 28-Dec-19 1:40:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[setting](
	[id_setting] [int] NOT NULL,
	[name] [nvarchar](200) NULL,
	[des] [nvarchar](500) NULL,
	[value] [nvarchar](max) NULL,
	[username] [varchar](50) NULL,
	[modified] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_setting] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 28-Dec-19 1:40:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slide](
	[slide_id] [int] IDENTITY(1,1) NOT NULL,
	[id_object] [int] NULL,
	[img] [varchar](255) NULL,
	[caption] [nvarchar](200) NULL,
	[type] [int] NULL,
	[rank] [int] NULL,
	[status] [int] NULL,
	[username] [varchar](50) NULL,
	[modified] [datetime] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[slide_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[slider]    Script Date: 28-Dec-19 1:40:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[slider](
	[slide_id] [int] NOT NULL,
	[id_object] [int] NULL,
	[img] [varchar](255) NULL,
	[caption] [nvarchar](200) NULL,
	[type] [int] NULL,
	[rank] [int] NULL,
	[status] [int] NULL,
	[username] [varchar](50) NULL,
	[modified] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[slide_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[taikhoan]    Script Date: 28-Dec-19 1:40:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[taikhoan](
	[username] [varchar](50) NOT NULL,
	[pass] [varchar](255) NULL,
 CONSTRAINT [PK_taikhoan] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified]) VALUES (1, N'strawberry', N'2', 120, 100, N'product-2.jpg', N'product-2.jpg', N'kg', 20, 10, 5, 9, 1, 1, N'nhi', CAST(0x0000AB3100B763B5 AS DateTime))
INSERT [dbo].[Food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified]) VALUES (2, N'Green beans', N'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 50, 40, N'product-3.jpg', N'product-3.jpg', N'kg', 10, 10, 6, 8, 2, 1, N'nhi', CAST(0x0000AB3100A85281 AS DateTime))
INSERT [dbo].[Food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified]) VALUES (3, N'Bell Pepper', N'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 40, 30, N'product-1.jpg', N'product-1.jpg', N'kg', 10, 10, 7, 8, 2, 1, N'nhi', CAST(0x0000AB3100A86F44 AS DateTime))
INSERT [dbo].[Food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified]) VALUES (4, N'tomoto', N'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 30, 30, N'product-5.jpg', N'product-5.jpg', N'kg', 0, 80, 5, 7, 2, 1, N'nhi', CAST(0x0000AB3100A88C73 AS DateTime))
INSERT [dbo].[Food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified]) VALUES (5, N'purple', N'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 70, 70, N'product-4.jpg', N'product-4.jpg', N'kg', 0, 100, 8, 8, 2, 1, N'nhi', CAST(0x0000AB3100A94A6D AS DateTime))
INSERT [dbo].[Food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified]) VALUES (6, N'Fruit juice', N'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 20, 20, N'product-8.jpg', N'product-8.jpg', N'chai', 0, 90, 8, 7, 3, 1, N'nhi', CAST(0x0000AB3100A9B41B AS DateTime))
INSERT [dbo].[Food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified]) VALUES (7, N'carrots', N'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 30, 30, N'product-7.jpg', N'product-7.jpg', N'kg', 0, 90, 6, 6, 2, 1, N'nhi', CAST(0x0000AB3100A9ED6E AS DateTime))
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[food_type] ON 

INSERT [dbo].[food_type] ([type_id], [type_name], [type_pos], [type_img], [status], [username], [modified]) VALUES (1, N'Fruits', 1, N'category-1.jpg', 1, N'nhi', CAST(0x0000AB31008B38A8 AS DateTime))
INSERT [dbo].[food_type] ([type_id], [type_name], [type_pos], [type_img], [status], [username], [modified]) VALUES (2, N'vegetable', 2, N'category-2.jpg', 1, N'nhi', CAST(0x0000AB3100B4D8F9 AS DateTime))
INSERT [dbo].[food_type] ([type_id], [type_name], [type_pos], [type_img], [status], [username], [modified]) VALUES (3, N'Juices', 3, N'category-3.jpg', 1, N'nhan', CAST(0x0000AB31008BA9A0 AS DateTime))
INSERT [dbo].[food_type] ([type_id], [type_name], [type_pos], [type_img], [status], [username], [modified]) VALUES (4, N'Dried', 4, N'category-4.jpg', 1, N'nhan', CAST(0x0000AB31008BC0D5 AS DateTime))
SET IDENTITY_INSERT [dbo].[food_type] OFF
INSERT [dbo].[Member] ([username], [pass], [name], [phone], [email], [status], [role]) VALUES (N'hien', N'd41d8cd98f00b204e9800998ecf8427e', N'hien', N'789', N'hien@gmail.com', 1, 1)
INSERT [dbo].[Member] ([username], [pass], [name], [phone], [email], [status], [role]) VALUES (N'nhan', N'a0d5c8a4d386f15284ec25fe1eeeb426', N'nhan', N'456789', N'nhan@gmail.com', 1, 1)
INSERT [dbo].[Member] ([username], [pass], [name], [phone], [email], [status], [role]) VALUES (N'nhi', N'a0d5c8a4d386f15284ec25fe1eeeb426', N'nhi', N'123456', N'nhi@gmail.com', 1, 1)
USE [master]
GO
ALTER DATABASE [vegefoods] SET  READ_WRITE 
GO
