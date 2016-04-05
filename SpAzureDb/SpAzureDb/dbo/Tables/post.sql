CREATE TABLE [dbo].[post] (
    [id]                INT            IDENTITY (1, 1) NOT NULL,
    [title]             NVARCHAR (MAX) NOT NULL,
    [date]              DATETIME       NOT NULL,
    [likes]             INT            NOT NULL,
    [mentions]          INT            NOT NULL,
    [type]              NVARCHAR (MAX) NOT NULL,
    [length]            INT            NOT NULL,
    [contains_hashtags] BIT            NOT NULL,
    [has_responses]     BIT            NOT NULL,
    [fan_post]          BIT            NOT NULL,
    [facebook_page_id]  INT            NOT NULL,
    [approved]          BIT            CONSTRAINT [DF_post_approved] DEFAULT ((0)) NOT NULL,
    [contributor_email] NCHAR (100)    NULL,
    CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_post_facebook_page] FOREIGN KEY ([facebook_page_id]) REFERENCES [dbo].[facebook_page] ([id])
);


GO
CREATE NONCLUSTERED INDEX [IX_post]
    ON [dbo].[post]([facebook_page_id] ASC);

