USE [Social_Presence_Backup]
GO

INSERT INTO [dbo].[facebook_page]
           ([municipality_id]
           ,[url]
           ,[name]
           ,[category]
           ,[creation_date]
           ,[short_name]
           ,[has_phone]
           ,[has_email]
           ,[has_about_page]
           ,[defined_location]
           ,[website]
           ,[milestones_count]
           ,[liked_pages]
           ,[approved]
           ,[contributor_email]
           ,[facebook_id]
           ,[type])
     VALUES
           (<municipality_id, int,>
           ,<url, nvarchar(max),>
           ,<name, nvarchar(max),>
           ,<category, nvarchar(max),>
           ,<creation_date, date,>
           ,<short_name, nvarchar(100),>
           ,<has_phone, bit,>
           ,<has_email, bit,>
           ,<has_about_page, bit,>
           ,<defined_location, nvarchar(100),>
           ,<website, nvarchar(max),>
           ,<milestones_count, int,>
           ,<liked_pages, int,>
           ,<approved, bit,>
           ,<contributor_email, nvarchar(100),>
           ,<facebook_id, varchar(100),>
           ,<type, smallint,>)
GO

