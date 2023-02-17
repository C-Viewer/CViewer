USE [master]
GO
/****** Object:  Database [CViewer]    Script Date: 17.02.2023 22:16:15 ******/
CREATE DATABASE [CViewer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CViewer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CViewer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CViewer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CViewer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CViewer] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CViewer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CViewer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CViewer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CViewer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CViewer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CViewer] SET ARITHABORT OFF 
GO
ALTER DATABASE [CViewer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CViewer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CViewer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CViewer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CViewer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CViewer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CViewer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CViewer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CViewer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CViewer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CViewer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CViewer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CViewer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CViewer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CViewer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CViewer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CViewer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CViewer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CViewer] SET  MULTI_USER 
GO
ALTER DATABASE [CViewer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CViewer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CViewer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CViewer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CViewer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CViewer] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CViewer] SET QUERY_STORE = OFF
GO
USE [CViewer]
GO
/****** Object:  Table [dbo].[cv]    Script Date: 17.02.2023 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cv](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](max) NOT NULL,
	[status_id] [int] NOT NULL,
	[description] [varchar](max) NOT NULL,
	[people_created_id] [int] NOT NULL,
	[specialization_id] [int] NOT NULL,
	[date_creation] [datetime] NOT NULL,
	[good_cv] [bit] NOT NULL,
	[grade] [int] NULL,
	[pinned_file_name] [varchar](max) NULL,
	[url_file_for_download] [varchar](max) NULL,
	[open_to_review] [bit] NOT NULL,
 CONSTRAINT [PK_cv] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cv_expert]    Script Date: 17.02.2023 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cv_expert](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cv_id] [int] NOT NULL,
	[profile_id] [int] NOT NULL,
 CONSTRAINT [PK_cv_expert] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cv_history]    Script Date: 17.02.2023 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cv_history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[file_name] [varchar](max) NULL,
	[cv_id] [int] NOT NULL,
	[comment] [varchar](max) NULL,
	[date_time] [datetime] NOT NULL,
	[author_id] [int] NULL,
	[grade] [int] NULL,
	[amazon_path_to_file] [varchar](max) NULL,
 CONSTRAINT [PK_cv_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cv_tags]    Script Date: 17.02.2023 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cv_tags](
	[cv_id] [int] NOT NULL,
	[tag_id] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_cv_tags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profile]    Script Date: 17.02.2023 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profile](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[email_address] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[biography] [varchar](max) NULL,
	[is_expert] [bit] NOT NULL,
	[specialization_id] [int] NOT NULL,
	[date_registation] [datetime] NULL,
	[rating] [float] NULL,
	[last_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_people] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profile_log]    Script Date: 17.02.2023 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profile_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[old] [varchar](max) NULL,
	[new] [varchar](max) NULL,
	[profile_id] [int] NOT NULL,
 CONSTRAINT [PK_people_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profile_to_token]    Script Date: 17.02.2023 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profile_to_token](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[profile_id] [int] NOT NULL,
	[token_id] [int] NOT NULL,
 CONSTRAINT [PK_people_token] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report]    Script Date: 17.02.2023 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status_id] [int] NULL,
	[text] [varchar](max) NULL,
	[profile_id] [int] NOT NULL,
	[rating] [int] NOT NULL,
	[created_date] [datetime] NOT NULL,
	[author_id] [int] NOT NULL,
 CONSTRAINT [PK_report] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[specialization]    Script Date: 17.02.2023 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[specialization](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_specialization] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 17.02.2023 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tags]    Script Date: 17.02.2023 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[token]    Script Date: 17.02.2023 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[token](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[value] [varchar](max) NOT NULL,
	[expiration_date_time] [datetime] NOT NULL,
 CONSTRAINT [PK_token] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[types_of_logs]    Script Date: 17.02.2023 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[types_of_logs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cv] ON 
GO
INSERT [dbo].[cv] ([id], [title], [status_id], [description], [people_created_id], [specialization_id], [date_creation], [good_cv], [grade], [pinned_file_name], [url_file_for_download], [open_to_review]) VALUES (4, N'.NET Software Engineer', 3, N'2 года опыта работы на должности .NET Software Engineer. Помимо .NET владею SQL-подобными языками.', 2, 1, CAST(N'2022-12-01T16:13:33.000' AS DateTime), 0, 3, NULL, NULL, 0)
GO
INSERT [dbo].[cv] ([id], [title], [status_id], [description], [people_created_id], [specialization_id], [date_creation], [good_cv], [grade], [pinned_file_name], [url_file_for_download], [open_to_review]) VALUES (8, N'QA', 6, N'Тестирую программы на качество.', 3, 5, CAST(N'2022-12-05T00:00:00.000' AS DateTime), 0, 5, NULL, NULL, 0)
GO
INSERT [dbo].[cv] ([id], [title], [status_id], [description], [people_created_id], [specialization_id], [date_creation], [good_cv], [grade], [pinned_file_name], [url_file_for_download], [open_to_review]) VALUES (10, N'Flutter developer', 6, N'Разработка ПО.', 2, 1, CAST(N'2022-12-07T00:00:00.000' AS DateTime), 1, 5, N'my_cv_flutter.pdf', N'https://da728kfevltdk.cloudfront.net/hi.txt', 0)
GO
INSERT [dbo].[cv] ([id], [title], [status_id], [description], [people_created_id], [specialization_id], [date_creation], [good_cv], [grade], [pinned_file_name], [url_file_for_download], [open_to_review]) VALUES (11, N'NULLDatabase developer', 6, N'Разработка баз данных.', 2, 6, CAST(N'2022-12-06T00:00:00.000' AS DateTime), 1, 5, N'my_cv_database.pdf', N'https://da728kfevltdk.cloudfront.net/qqq.zip', 0)
GO
INSERT [dbo].[cv] ([id], [title], [status_id], [description], [people_created_id], [specialization_id], [date_creation], [good_cv], [grade], [pinned_file_name], [url_file_for_download], [open_to_review]) VALUES (12, N'Java', 2, N'Разработка ПО на java.', 2, 1, CAST(N'2022-12-08T00:00:00.000' AS DateTime), 0, NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[cv] OFF
GO
SET IDENTITY_INSERT [dbo].[cv_expert] ON 
GO
INSERT [dbo].[cv_expert] ([id], [cv_id], [profile_id]) VALUES (1, 4, 6)
GO
INSERT [dbo].[cv_expert] ([id], [cv_id], [profile_id]) VALUES (2, 8, 6)
GO
INSERT [dbo].[cv_expert] ([id], [cv_id], [profile_id]) VALUES (3, 10, 1)
GO
INSERT [dbo].[cv_expert] ([id], [cv_id], [profile_id]) VALUES (4, 11, 1)
GO
INSERT [dbo].[cv_expert] ([id], [cv_id], [profile_id]) VALUES (5, 12, 1)
GO
SET IDENTITY_INSERT [dbo].[cv_expert] OFF
GO
SET IDENTITY_INSERT [dbo].[cv_history] ON 
GO
INSERT [dbo].[cv_history] ([id], [file_name], [cv_id], [comment], [date_time], [author_id], [grade], [amazon_path_to_file]) VALUES (1, NULL, 4, N'Вам следует исправить информацию о реализацованных проектах, а также опыт работы.', CAST(N'2022-12-01T00:00:00.000' AS DateTime), 1, 3, NULL)
GO
INSERT [dbo].[cv_history] ([id], [file_name], [cv_id], [comment], [date_time], [author_id], [grade], [amazon_path_to_file]) VALUES (2, NULL, 4, N'Что Вас не устроило в описании проектов?', CAST(N'2022-12-01T17:10:00.000' AS DateTime), 2, NULL, NULL)
GO
INSERT [dbo].[cv_history] ([id], [file_name], [cv_id], [comment], [date_time], [author_id], [grade], [amazon_path_to_file]) VALUES (3, NULL, 8, N'Отличное Cv в плане навыков и истории. Более того, визуальный стиль позволяет легко читать Ваше резюме.', CAST(N'2022-12-12T00:00:00.000' AS DateTime), 6, 5, NULL)
GO
SET IDENTITY_INSERT [dbo].[cv_history] OFF
GO
SET IDENTITY_INSERT [dbo].[cv_tags] ON 
GO
INSERT [dbo].[cv_tags] ([cv_id], [tag_id], [id]) VALUES (4, 1, 1)
GO
INSERT [dbo].[cv_tags] ([cv_id], [tag_id], [id]) VALUES (4, 4, 2)
GO
INSERT [dbo].[cv_tags] ([cv_id], [tag_id], [id]) VALUES (8, 5, 3)
GO
INSERT [dbo].[cv_tags] ([cv_id], [tag_id], [id]) VALUES (10, 3, 4)
GO
INSERT [dbo].[cv_tags] ([cv_id], [tag_id], [id]) VALUES (11, 4, 5)
GO
INSERT [dbo].[cv_tags] ([cv_id], [tag_id], [id]) VALUES (12, 2, 6)
GO
SET IDENTITY_INSERT [dbo].[cv_tags] OFF
GO
SET IDENTITY_INSERT [dbo].[profile] ON 
GO
INSERT [dbo].[profile] ([id], [first_name], [email_address], [password], [biography], [is_expert], [specialization_id], [date_registation], [rating], [last_name]) VALUES (1, N'Юрий', N'y', N'y', N'Магистратура МФТИ', 1, 1, CAST(N'2022-12-01T00:00:00.000' AS DateTime), 5, N'Иванов')
GO
INSERT [dbo].[profile] ([id], [first_name], [email_address], [password], [biography], [is_expert], [specialization_id], [date_registation], [rating], [last_name]) VALUES (2, N'Олег', N'string', N'string', N'Бакалавриат ИТМО', 0, 4, NULL, NULL, N'Боров')
GO
INSERT [dbo].[profile] ([id], [first_name], [email_address], [password], [biography], [is_expert], [specialization_id], [date_registation], [rating], [last_name]) VALUES (3, N'Нино', N'n', N'n', N'QA. Бакалавриат СПбГУ', 0, 5, NULL, NULL, N'Апакидзе')
GO
INSERT [dbo].[profile] ([id], [first_name], [email_address], [password], [biography], [is_expert], [specialization_id], [date_registation], [rating], [last_name]) VALUES (6, N'Иван', N'i', N'i', N'QA в Яндекс', 1, 6, NULL, 4.8, N'Протос')
GO
SET IDENTITY_INSERT [dbo].[profile] OFF
GO
SET IDENTITY_INSERT [dbo].[specialization] ON 
GO
INSERT [dbo].[specialization] ([id], [name]) VALUES (1, N'Software Engineer')
GO
INSERT [dbo].[specialization] ([id], [name]) VALUES (4, N'Data Analyst')
GO
INSERT [dbo].[specialization] ([id], [name]) VALUES (5, N'QA')
GO
INSERT [dbo].[specialization] ([id], [name]) VALUES (6, N'Database')
GO
SET IDENTITY_INSERT [dbo].[specialization] OFF
GO
SET IDENTITY_INSERT [dbo].[status] ON 
GO
INSERT [dbo].[status] ([id], [name]) VALUES (1, N'Draft')
GO
INSERT [dbo].[status] ([id], [name]) VALUES (2, N'SentToReview')
GO
INSERT [dbo].[status] ([id], [name]) VALUES (3, N'TakenToReview')
GO
INSERT [dbo].[status] ([id], [name]) VALUES (4, N'NeedFix')
GO
INSERT [dbo].[status] ([id], [name]) VALUES (5, N'Reviewed')
GO
INSERT [dbo].[status] ([id], [name]) VALUES (6, N'Finished')
GO
SET IDENTITY_INSERT [dbo].[status] OFF
GO
SET IDENTITY_INSERT [dbo].[tags] ON 
GO
INSERT [dbo].[tags] ([id], [name]) VALUES (1, N'DotNet')
GO
INSERT [dbo].[tags] ([id], [name]) VALUES (2, N'Java')
GO
INSERT [dbo].[tags] ([id], [name]) VALUES (3, N'Flutter')
GO
INSERT [dbo].[tags] ([id], [name]) VALUES (4, N'SQL')
GO
INSERT [dbo].[tags] ([id], [name]) VALUES (5, N'Python')
GO
SET IDENTITY_INSERT [dbo].[tags] OFF
GO
ALTER TABLE [dbo].[cv]  WITH CHECK ADD  CONSTRAINT [FK_cv_people] FOREIGN KEY([people_created_id])
REFERENCES [dbo].[profile] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cv] CHECK CONSTRAINT [FK_cv_people]
GO
ALTER TABLE [dbo].[cv]  WITH CHECK ADD  CONSTRAINT [FK_cv_specialization] FOREIGN KEY([specialization_id])
REFERENCES [dbo].[specialization] ([id])
GO
ALTER TABLE [dbo].[cv] CHECK CONSTRAINT [FK_cv_specialization]
GO
ALTER TABLE [dbo].[cv]  WITH CHECK ADD  CONSTRAINT [FK_cv_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[status] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cv] CHECK CONSTRAINT [FK_cv_status]
GO
ALTER TABLE [dbo].[cv_expert]  WITH CHECK ADD  CONSTRAINT [FK_cv_expert_cv] FOREIGN KEY([cv_id])
REFERENCES [dbo].[cv] ([id])
GO
ALTER TABLE [dbo].[cv_expert] CHECK CONSTRAINT [FK_cv_expert_cv]
GO
ALTER TABLE [dbo].[cv_expert]  WITH CHECK ADD  CONSTRAINT [FK_cv_expert_people] FOREIGN KEY([profile_id])
REFERENCES [dbo].[profile] ([id])
GO
ALTER TABLE [dbo].[cv_expert] CHECK CONSTRAINT [FK_cv_expert_people]
GO
ALTER TABLE [dbo].[cv_history]  WITH CHECK ADD  CONSTRAINT [FK_cv_history_cv] FOREIGN KEY([cv_id])
REFERENCES [dbo].[cv] ([id])
GO
ALTER TABLE [dbo].[cv_history] CHECK CONSTRAINT [FK_cv_history_cv]
GO
ALTER TABLE [dbo].[cv_history]  WITH CHECK ADD  CONSTRAINT [FK_cv_history_profile] FOREIGN KEY([author_id])
REFERENCES [dbo].[profile] ([id])
GO
ALTER TABLE [dbo].[cv_history] CHECK CONSTRAINT [FK_cv_history_profile]
GO
ALTER TABLE [dbo].[cv_tags]  WITH CHECK ADD  CONSTRAINT [FK_cv_tags_cv] FOREIGN KEY([cv_id])
REFERENCES [dbo].[cv] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cv_tags] CHECK CONSTRAINT [FK_cv_tags_cv]
GO
ALTER TABLE [dbo].[cv_tags]  WITH CHECK ADD  CONSTRAINT [FK_cv_tags_tags] FOREIGN KEY([tag_id])
REFERENCES [dbo].[tags] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cv_tags] CHECK CONSTRAINT [FK_cv_tags_tags]
GO
ALTER TABLE [dbo].[profile]  WITH CHECK ADD  CONSTRAINT [FK_people_specialization] FOREIGN KEY([specialization_id])
REFERENCES [dbo].[specialization] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[profile] CHECK CONSTRAINT [FK_people_specialization]
GO
ALTER TABLE [dbo].[profile_log]  WITH CHECK ADD  CONSTRAINT [FK_people_log_people] FOREIGN KEY([profile_id])
REFERENCES [dbo].[profile] ([id])
GO
ALTER TABLE [dbo].[profile_log] CHECK CONSTRAINT [FK_people_log_people]
GO
ALTER TABLE [dbo].[profile_log]  WITH CHECK ADD  CONSTRAINT [FK_people_log_types] FOREIGN KEY([type_id])
REFERENCES [dbo].[types_of_logs] ([id])
GO
ALTER TABLE [dbo].[profile_log] CHECK CONSTRAINT [FK_people_log_types]
GO
ALTER TABLE [dbo].[profile_to_token]  WITH CHECK ADD  CONSTRAINT [FK_people_token_people] FOREIGN KEY([profile_id])
REFERENCES [dbo].[profile] ([id])
GO
ALTER TABLE [dbo].[profile_to_token] CHECK CONSTRAINT [FK_people_token_people]
GO
ALTER TABLE [dbo].[profile_to_token]  WITH CHECK ADD  CONSTRAINT [FK_people_token_token] FOREIGN KEY([token_id])
REFERENCES [dbo].[token] ([id])
GO
ALTER TABLE [dbo].[profile_to_token] CHECK CONSTRAINT [FK_people_token_token]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK_report_profile] FOREIGN KEY([profile_id])
REFERENCES [dbo].[profile] ([id])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK_report_profile]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK_report_profile1] FOREIGN KEY([author_id])
REFERENCES [dbo].[profile] ([id])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK_report_profile1]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK_report_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK_report_status]
GO
USE [master]
GO
ALTER DATABASE [CViewer] SET  READ_WRITE 
GO
