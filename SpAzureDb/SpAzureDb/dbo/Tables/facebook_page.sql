CREATE TABLE [dbo].[facebook_page] (
    [id]                INT            IDENTITY (1, 1) NOT NULL,
    [municipality_id]   INT            NOT NULL,
    [url]               NVARCHAR (MAX) NOT NULL,
    [name]              NVARCHAR (MAX) NULL,
    [category]          NVARCHAR (MAX) NULL,
    [creation_date]     DATE           NULL,
    [short_name]        NVARCHAR (100) NULL,
    [has_phone]         BIT            CONSTRAINT [DF_facebook_page_has_phone] DEFAULT ((0)) NOT NULL,
    [has_email]         BIT            CONSTRAINT [DF_facebook_page_has_email] DEFAULT ((0)) NOT NULL,
    [has_about_page]    BIT            CONSTRAINT [DF_facebook_page_has_about_page] DEFAULT ((0)) NOT NULL,
    [defined_location]  NVARCHAR (100) NULL,
    [website]           NVARCHAR (MAX) NULL,
    [milestones_count]  INT            CONSTRAINT [DF_facebook_page_milestones_count] DEFAULT ((0)) NOT NULL,
    [liked_pages]       INT            CONSTRAINT [DF_facebook_page_liked_pages] DEFAULT ((0)) NOT NULL,
    [approved]          BIT            CONSTRAINT [DF_facebook_page_approved] DEFAULT ((0)) NOT NULL,
    [contributor_email] NVARCHAR (100) NULL,
    CONSTRAINT [PK_facebook_page] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_facebook_page_Municipality] FOREIGN KEY ([municipality_id]) REFERENCES [dbo].[Municipality] ([id])
);


GO
CREATE NONCLUSTERED INDEX [IX_facebook_page]
    ON [dbo].[facebook_page]([municipality_id] ASC);

