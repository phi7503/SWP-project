USE [master]
GO
/****** Object:  Database [SWP_project]    Script Date: 3/12/2024 10:24:45 PM ******/
CREATE DATABASE [SWP_project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP_project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP_project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP_project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP_project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SWP_project] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP_project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP_project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP_project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP_project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP_project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP_project] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP_project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP_project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP_project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP_project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP_project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP_project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP_project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP_project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP_project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP_project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWP_project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP_project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP_project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP_project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP_project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP_project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP_project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP_project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP_project] SET  MULTI_USER 
GO
ALTER DATABASE [SWP_project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP_project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP_project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP_project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP_project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP_project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP_project] SET QUERY_STORE = ON
GO
ALTER DATABASE [SWP_project] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SWP_project]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 3/12/2024 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[ApplyID] [bigint] IDENTITY(1,1) NOT NULL,
	[JSID] [nvarchar](50) NULL,
	[JobID] [bigint] NULL,
	[Status] [nvarchar](50) NULL,
	[PathCV] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 3/12/2024 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CmtId] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CommentType] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NOT NULL,
	[JobPostID] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CmtId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 3/12/2024 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[ComId] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Location] [varchar](100) NOT NULL,
	[Phone] [int] NULL,
	[Website] [varchar](255) NULL,
	[ComName] [nvarchar](100) NULL,
	[image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ComId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV]    Script Date: 3/12/2024 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV](
	[CV_id] [bigint] IDENTITY(1,1) NOT NULL,
	[User_id] [nvarchar](50) NOT NULL,
	[Education] [nvarchar](max) NULL,
	[Work_experience] [nvarchar](max) NULL,
	[Skills] [nvarchar](max) NULL,
	[Certifications] [nvarchar](max) NULL,
	[Languages] [nvarchar](max) NULL,
	[Projects] [nvarchar](max) NULL,
	[References] [nvarchar](max) NULL,
	[Contact_information] [nvarchar](max) NULL,
	[Path_name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CV_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/12/2024 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyID] [bigint] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Detail] [nvarchar](max) NULL,
	[Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 3/12/2024 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[JobID] [bigint] IDENTITY(1,1) NOT NULL,
	[JobTitle] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[RequiredSkills] [nvarchar](max) NULL,
	[JobType] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[ComID] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job_Category]    Script Date: 3/12/2024 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Category](
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobPost]    Script Date: 3/12/2024 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobPost](
	[JobPostID] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Title] [nvarchar](255) NULL,
	[Salary] [decimal](18, 2) NULL,
	[PostedDate] [date] NULL,
	[Requirements] [nvarchar](max) NULL,
	[ComID] [bigint] NULL,
	[JobID] [bigint] NOT NULL,
	[image] [nvarchar](50) NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[JobPostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobSeeker]    Script Date: 3/12/2024 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobSeeker](
	[Username] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Password] [nvarchar](50) NULL,
	[Phone] [int] NULL,
	[Gender] [bit] NULL,
	[Address] [nvarchar](255) NULL,
	[DoB] [date] NULL,
	[image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobType]    Script Date: 3/12/2024 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobType](
	[TypeName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 3/12/2024 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[ResultID] [bigint] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[Title] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
	[TimeResponse] [datetime] NULL,
	[IsPass] [bit] NOT NULL,
	[ApplyID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([ComId], [Email], [Password], [Location], [Phone], [Website], [ComName], [image]) VALUES (1, N'congty1@gmail.com', N'12345', N'hanoi', 123456789, NULL, N'olala', NULL)
INSERT [dbo].[Company] ([ComId], [Email], [Password], [Location], [Phone], [Website], [ComName], [image]) VALUES (2, N'congty2@gmail.com', N'12345', N'hochiminh', 123456789, NULL, N'cong ty 2', NULL)
INSERT [dbo].[Company] ([ComId], [Email], [Password], [Location], [Phone], [Website], [ComName], [image]) VALUES (3, N'congty3@gmail.com', N'123456', N'oalal', 123456, NULL, N'ola', NULL)
INSERT [dbo].[Company] ([ComId], [Email], [Password], [Location], [Phone], [Website], [ComName], [image]) VALUES (4, N'congty4@gmail.com', N'234', N'2345', 234, NULL, N'2345', NULL)
INSERT [dbo].[Company] ([ComId], [Email], [Password], [Location], [Phone], [Website], [ComName], [image]) VALUES (5, N'2345', N'2345', N'324', 234, N'', N'234', NULL)
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Job] ON 

INSERT [dbo].[Job] ([JobID], [JobTitle], [Description], [RequiredSkills], [JobType], [Category], [ComID]) VALUES (2, N'sếp ', N'làm sếp chứu làm gì', N'AA', N'CEO', N'BS', 1)
INSERT [dbo].[Job] ([JobID], [JobTitle], [Description], [RequiredSkills], [JobType], [Category], [ComID]) VALUES (3, N'lao công', N'đi dọn vs', N'as', N'VS', N'CL', 1)
INSERT [dbo].[Job] ([JobID], [JobTitle], [Description], [RequiredSkills], [JobType], [Category], [ComID]) VALUES (4, N'IT', N'Làm về IT', N'abc', N'IT', N'IT', 1)
SET IDENTITY_INSERT [dbo].[Job] OFF
GO
INSERT [dbo].[Job_Category] ([CategoryName], [Description]) VALUES (N'BS', N'boss')
INSERT [dbo].[Job_Category] ([CategoryName], [Description]) VALUES (N'CL', N'vệ sinh')
INSERT [dbo].[Job_Category] ([CategoryName], [Description]) VALUES (N'IT', N'làm về IT')
INSERT [dbo].[Job_Category] ([CategoryName], [Description]) VALUES (N'KT', N'kinh tế')
GO
SET IDENTITY_INSERT [dbo].[JobPost] ON 

INSERT [dbo].[JobPost] ([JobPostID], [Description], [Title], [Salary], [PostedDate], [Requirements], [ComID], [JobID], [image], [isDeleted]) VALUES (1, N'làm lao công134', N'làm lao công1234', CAST(1235.00 AS Decimal(18, 2)), CAST(N'2024-02-25' AS Date), N'AC', 1, 3, NULL, 0)
INSERT [dbo].[JobPost] ([JobPostID], [Description], [Title], [Salary], [PostedDate], [Requirements], [ComID], [JobID], [image], [isDeleted]) VALUES (2, N'làm sếp', N'làm sếp', CAST(123456.00 AS Decimal(18, 2)), CAST(N'2024-02-24' AS Date), N'sdfg', 1, 2, NULL, 0)
INSERT [dbo].[JobPost] ([JobPostID], [Description], [Title], [Salary], [PostedDate], [Requirements], [ComID], [JobID], [image], [isDeleted]) VALUES (3, N'làm sếp', N'làm sếp công ty 2', CAST(1234567.00 AS Decimal(18, 2)), CAST(N'2024-02-24' AS Date), N'olala', 2, 2, NULL, 0)
INSERT [dbo].[JobPost] ([JobPostID], [Description], [Title], [Salary], [PostedDate], [Requirements], [ComID], [JobID], [image], [isDeleted]) VALUES (8, N'software tester', N'tester', CAST(123456.00 AS Decimal(18, 2)), CAST(N'2024-03-06' AS Date), N'tester', NULL, 2, NULL, 0)
INSERT [dbo].[JobPost] ([JobPostID], [Description], [Title], [Salary], [PostedDate], [Requirements], [ComID], [JobID], [image], [isDeleted]) VALUES (9, N'batman', N'BA', CAST(1000000000.00 AS Decimal(18, 2)), CAST(N'2024-03-06' AS Date), N'matcha matme', 1, 3, NULL, 0)
INSERT [dbo].[JobPost] ([JobPostID], [Description], [Title], [Salary], [PostedDate], [Requirements], [ComID], [JobID], [image], [isDeleted]) VALUES (10, N'cleaner', N'Cleaner', CAST(1233.00 AS Decimal(18, 2)), CAST(N'2024-03-06' AS Date), N'clean all company', 1, 3, NULL, 0)
INSERT [dbo].[JobPost] ([JobPostID], [Description], [Title], [Salary], [PostedDate], [Requirements], [ComID], [JobID], [image], [isDeleted]) VALUES (11, N'cleaner', N'Cleaner', CAST(1233.00 AS Decimal(18, 2)), CAST(N'2024-03-06' AS Date), N'clean all company', 1, 3, NULL, 0)
INSERT [dbo].[JobPost] ([JobPostID], [Description], [Title], [Salary], [PostedDate], [Requirements], [ComID], [JobID], [image], [isDeleted]) VALUES (12, N'cleaner', N'phi cc', CAST(1.00 AS Decimal(18, 2)), CAST(N'2024-03-06' AS Date), N'clean ', 1, 3, NULL, 0)
INSERT [dbo].[JobPost] ([JobPostID], [Description], [Title], [Salary], [PostedDate], [Requirements], [ComID], [JobID], [image], [isDeleted]) VALUES (13, N'SE', N'new job', CAST(123.00 AS Decimal(18, 2)), CAST(N'2024-03-08' AS Date), N'abc', 1, 4, NULL, 0)
INSERT [dbo].[JobPost] ([JobPostID], [Description], [Title], [Salary], [PostedDate], [Requirements], [ComID], [JobID], [image], [isDeleted]) VALUES (14, N'SE', N'olala', CAST(123.00 AS Decimal(18, 2)), CAST(N'2024-03-12' AS Date), N'abcxyz', 1, 3, NULL, 0)
SET IDENTITY_INSERT [dbo].[JobPost] OFF
GO
INSERT [dbo].[JobSeeker] ([Username], [FullName], [Email], [Password], [Phone], [Gender], [Address], [DoB], [image]) VALUES (N'dat', N'dat', N'dat@gmail.com', N'123456', 5678, 1, N'21432', CAST(N'2003-12-02' AS Date), NULL)
INSERT [dbo].[JobSeeker] ([Username], [FullName], [Email], [Password], [Phone], [Gender], [Address], [DoB], [image]) VALUES (N'linh', N'linh ola', N'linh@gmail.com', N'123456', 0, 1, N'23456', CAST(N'2003-12-08' AS Date), NULL)
INSERT [dbo].[JobSeeker] ([Username], [FullName], [Email], [Password], [Phone], [Gender], [Address], [DoB], [image]) VALUES (N'mra', N'Nguyễn Đức Linh', N'kuroshaki505@gmail.com', N'123', 888096477, 1, N'ádfghjk', CAST(N'2024-03-11' AS Date), NULL)
GO
INSERT [dbo].[JobType] ([TypeName], [Description]) VALUES (N'CEO', N'just ceo')
INSERT [dbo].[JobType] ([TypeName], [Description]) VALUES (N'IT', N'eeee')
INSERT [dbo].[JobType] ([TypeName], [Description]) VALUES (N'Travel', N'Travel')
INSERT [dbo].[JobType] ([TypeName], [Description]) VALUES (N'VS', N'làm vệ sinh')
GO
ALTER TABLE [dbo].[JobPost] ADD  CONSTRAINT [DF_JobPost_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD FOREIGN KEY([JSID])
REFERENCES [dbo].[JobSeeker] ([Username])
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Job] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_Job]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([JobPostID])
REFERENCES [dbo].[JobPost] ([JobPostID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[JobSeeker] ([Username])
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD  CONSTRAINT [FK_CV_JobSeeker] FOREIGN KEY([User_id])
REFERENCES [dbo].[JobSeeker] ([Username])
GO
ALTER TABLE [dbo].[CV] CHECK CONSTRAINT [FK_CV_JobSeeker]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([ComId])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[JobSeeker] ([Username])
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_Company] FOREIGN KEY([ComID])
REFERENCES [dbo].[Company] ([ComId])
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_Company]
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_Job_Category] FOREIGN KEY([Category])
REFERENCES [dbo].[Job_Category] ([CategoryName])
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_Job_Category]
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_JobType] FOREIGN KEY([JobType])
REFERENCES [dbo].[JobType] ([TypeName])
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_JobType]
GO
ALTER TABLE [dbo].[JobPost]  WITH CHECK ADD  CONSTRAINT [FK_JobID] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobID])
GO
ALTER TABLE [dbo].[JobPost] CHECK CONSTRAINT [FK_JobID]
GO
ALTER TABLE [dbo].[JobPost]  WITH CHECK ADD  CONSTRAINT [FK_JobPost_Company] FOREIGN KEY([ComID])
REFERENCES [dbo].[Company] ([ComId])
GO
ALTER TABLE [dbo].[JobPost] CHECK CONSTRAINT [FK_JobPost_Company]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD FOREIGN KEY([ApplyID])
REFERENCES [dbo].[Application] ([ApplyID])
GO
USE [master]
GO
ALTER DATABASE [SWP_project] SET  READ_WRITE 
GO
