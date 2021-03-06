CREATE DATABASE TravelBlog
GO
USE [TravelBlog]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/8/2017 4:45:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Experiences]    Script Date: 2/8/2017 4:45:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experiences](
	[ExperienceId] [int] IDENTITY(1,1) NOT NULL,
	[ExperienceDescription] [nvarchar](max) NOT NULL,
	[ExperienceName] [nvarchar](max) NOT NULL,
	[PersonId] [int] NULL,
	[ExperienceImage] [nvarchar](max) NULL,
	[LocationId] [int] NULL,
 CONSTRAINT [PK_Experiences] PRIMARY KEY CLUSTERED 
(
	[ExperienceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Locations]    Script Date: 2/8/2017 4:45:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[ExperienceId] [int] NULL,
	[LocationDescription] [nvarchar](max) NOT NULL,
	[LocationName] [nvarchar](max) NOT NULL,
	[PersonId] [int] NULL,
	[LocationImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[People]    Script Date: 2/8/2017 4:45:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[PersonDescription] [nvarchar](max) NULL,
	[PersonName] [nvarchar](max) NULL,
	[PersonImage] [nvarchar](max) NULL,
	[ExperienceId] [int] NULL,
	[LocationId] [int] NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170208172021_Initial', N'1.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170208173258_SetKeys', N'1.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170208174634_ChangePerson', N'1.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170208214138_AddImages', N'1.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170208224706_AddForeignKeys', N'1.0.1')
SET IDENTITY_INSERT [dbo].[Experiences] ON 

INSERT [dbo].[Experiences] ([ExperienceId], [ExperienceDescription], [ExperienceName], [PersonId], [ExperienceImage], [LocationId]) VALUES (1, N'Coldplay - So millennial', N'Rock and Roll', 0, N'http://www.billboard.com/files/styles/article_main_image/public/media/coldplay-iheartradio-live-stream-billboard-650.jpg', 2)
INSERT [dbo].[Experiences] ([ExperienceId], [ExperienceDescription], [ExperienceName], [PersonId], [ExperienceImage], [LocationId]) VALUES (3, N'Met a tortoise', N'Greenhouse Exploration', 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[Experiences] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationId], [ExperienceId], [LocationDescription], [LocationName], [PersonId], [LocationImage]) VALUES (1, 2, N'Quiet', N'Earthship Phoenix', 1, N'https://s-media-cache-ak0.pinimg.com/originals/93/10/e1/9310e1af68ee4d42b1efc537ee5c8b3d.jpg')
INSERT [dbo].[Locations] ([LocationId], [ExperienceId], [LocationDescription], [LocationName], [PersonId], [LocationImage]) VALUES (2, 0, N'Bigger than you''d think', N'London', 2, N'https://www.alumni.ucdavis.edu/local_resources/images/benefits/travel/2017/london-and-environs/london%202.jpg')
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([PersonId], [PersonDescription], [PersonName], [PersonImage], [ExperienceId], [LocationId]) VALUES (1, N'the Tortoise', N'Fred', NULL, 1, 2)
INSERT [dbo].[People] ([PersonId], [PersonDescription], [PersonName], [PersonImage], [ExperienceId], [LocationId]) VALUES (2, N'Crazy Cousin', N'Lisa', NULL, 2, 1)
SET IDENTITY_INSERT [dbo].[People] OFF
ALTER TABLE [dbo].[Experiences]  WITH CHECK ADD  CONSTRAINT [FK_Experiences_Experiences] FOREIGN KEY([ExperienceId])
REFERENCES [dbo].[Experiences] ([ExperienceId])
GO
ALTER TABLE [dbo].[Experiences] CHECK CONSTRAINT [FK_Experiences_Experiences]
GO
ALTER TABLE [dbo].[Experiences]  WITH CHECK ADD  CONSTRAINT [FK_Experiences_Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
ALTER TABLE [dbo].[Experiences] CHECK CONSTRAINT [FK_Experiences_Locations_LocationId]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Locations]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_People] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([PersonId])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_People]
GO
