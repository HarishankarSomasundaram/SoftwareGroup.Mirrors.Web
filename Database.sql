USE [master]
GO

/****** Object:  Database [Mirrors]    Script Date: 6/4/2014 11:06:04 PM ******/
CREATE DATABASE [Mirrors]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Mirrors', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\Mirrors.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Mirrors_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\Mirrors_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Mirrors] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mirrors].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Mirrors] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Mirrors] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Mirrors] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Mirrors] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Mirrors] SET ARITHABORT OFF 
GO

ALTER DATABASE [Mirrors] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Mirrors] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [Mirrors] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Mirrors] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Mirrors] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Mirrors] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Mirrors] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Mirrors] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Mirrors] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Mirrors] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Mirrors] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Mirrors] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Mirrors] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Mirrors] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Mirrors] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Mirrors] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Mirrors] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Mirrors] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Mirrors] SET RECOVERY FULL 
GO

ALTER DATABASE [Mirrors] SET  MULTI_USER 
GO

ALTER DATABASE [Mirrors] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Mirrors] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Mirrors] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Mirrors] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [Mirrors] SET  READ_WRITE 
GO

USE [master]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [MirrorUser]    Script Date: 6/4/2014 11:06:41 PM ******/
CREATE LOGIN [MirrorUser] WITH PASSWORD=N'¡ã®6JFa­¾2©(ÕÞ|>êÛ
" ', DEFAULT_DATABASE=[Mirrors], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [MirrorUser] DISABLE
GO


USE [Mirrors]
GO
/****** Object:  User [MirrorUser]    Script Date: 6/4/2014 11:05:03 PM ******/
CREATE USER [MirrorUser] FOR LOGIN [MirrorUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [MirrorUser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [MirrorUser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [MirrorUser]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 6/4/2014 11:05:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[PasswordHash] [varchar](250) NOT NULL,
	[PasswordSalt] [varchar](50) NULL,
	[PasswordChangedDate] [datetime] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedUserId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedUserId] [int] NULL,
	[UpadtedDate] [datetime] NULL,
	[Email] [varchar](250) NULL,
	[PersonalPhone] [varchar](25) NULL,
	[WorkPhone] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 6/4/2014 11:05:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](30) NOT NULL,
	[Description] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRoleMap]    Script Date: 6/4/2014 11:05:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleMap](
	[RoleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedUserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

GO
INSERT [dbo].[UserProfile] ([UserId], [FirstName], [LastName], [Username], [PasswordHash], [PasswordSalt], [PasswordChangedDate], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [IsActive], [CreatedUserId], [CreatedDate], [UpdatedUserId], [UpadtedDate], [Email], [PersonalPhone], [WorkPhone]) VALUES (1, N'Ambal', N'Thirugnanam', N'athirugnanam', N'Password$', NULL, NULL, NULL, NULL, 1, 0, CAST(0x0000A340014BEA86 AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [FirstName], [LastName], [Username], [PasswordHash], [PasswordSalt], [PasswordChangedDate], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [IsActive], [CreatedUserId], [CreatedDate], [UpdatedUserId], [UpadtedDate], [Email], [PersonalPhone], [WorkPhone]) VALUES (2, N'Kanagu', N'Duraiswamy', N'aduraiswamy', N'Password$', NULL, NULL, NULL, NULL, 1, 0, CAST(0x0000A340014C9001 AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [FirstName], [LastName], [Username], [PasswordHash], [PasswordSalt], [PasswordChangedDate], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [IsActive], [CreatedUserId], [CreatedDate], [UpdatedUserId], [UpadtedDate], [Email], [PersonalPhone], [WorkPhone]) VALUES (3, N'Yogalakshmi', N'Duraiswamy', N'yduraiswamy', N'Password$', NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A340014CBEC0 AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

GO
INSERT [dbo].[UserRole] ([RoleId], [RoleName], [Description]) VALUES (1, N'Admin', N'Administrator')
GO
INSERT [dbo].[UserRole] ([RoleId], [RoleName], [Description]) VALUES (2, N'User', N'Normal User')
GO
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
INSERT [dbo].[UserRoleMap] ([RoleId], [UserId], [CreatedDate], [CreatedUserId]) VALUES (1, 1, CAST(0x0000A340014C5640 AS DateTime), 1)
GO
INSERT [dbo].[UserRoleMap] ([RoleId], [UserId], [CreatedDate], [CreatedUserId]) VALUES (1, 2, CAST(0x0000A340014CE3FE AS DateTime), 1)
GO
INSERT [dbo].[UserRoleMap] ([RoleId], [UserId], [CreatedDate], [CreatedUserId]) VALUES (1, 3, CAST(0x0000A340014CEE99 AS DateTime), 1)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__UserProf__536C85E4CA8C5F1B]    Script Date: 6/4/2014 11:05:03 PM ******/
ALTER TABLE [dbo].[UserProfile] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__UserRole__8A2B6160BB8F01E4]    Script Date: 6/4/2014 11:05:03 PM ******/
ALTER TABLE [dbo].[UserRole] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserProfile] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserProfile] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserRoleMap] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
