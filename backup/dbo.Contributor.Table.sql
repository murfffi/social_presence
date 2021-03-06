USE [Social_Presence_New]
GO
/****** Object:  Table [dbo].[Contributor]    Script Date: 02-Oct-16 9:13:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contributor](
	[email] [nvarchar](100) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[admin] [bit] NOT NULL,
 CONSTRAINT [PK_Contributor] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
INSERT [dbo].[Contributor] ([email], [name], [admin]) VALUES (N'admin@test.com', N'Admin', 1)
INSERT [dbo].[Contributor] ([email], [name], [admin]) VALUES (N'denisa.cekrezi@hotmail.com', N'Denisa Cekrezi', 0)
INSERT [dbo].[Contributor] ([email], [name], [admin]) VALUES (N'kspassov@gmail.com', N'Kamen Spassov', 0)
INSERT [dbo].[Contributor] ([email], [name], [admin]) VALUES (N'murfffi@gmail.com', N'Marin Nozhchev', 0)
INSERT [dbo].[Contributor] ([email], [name], [admin]) VALUES (N'open_ytgptoa_user@tfbnw.net', N'Open Graph Test User', 0)
INSERT [dbo].[Contributor] ([email], [name], [admin]) VALUES (N'test@test.com', N'test', 0)
INSERT [dbo].[Contributor] ([email], [name], [admin]) VALUES (N'the_wild_rose@abv.bg', N'Evelina Nozhcheva', 1)
ALTER TABLE [dbo].[Contributor] ADD  CONSTRAINT [DF_Contributor_admin]  DEFAULT ((0)) FOR [admin]
GO
