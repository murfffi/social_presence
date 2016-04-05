CREATE TABLE [dbo].[Municipality] (
    [name]              NVARCHAR (MAX) NOT NULL,
    [id]                INT            IDENTITY (1, 1) NOT NULL,
    [country]           NVARCHAR (MAX) NOT NULL,
    [population]        INT            NULL,
    [state]             NVARCHAR (MAX) NOT NULL,
    [website]           NVARCHAR (MAX) NULL,
    [approved]          BIT            CONSTRAINT [DF_Municipality_approved] DEFAULT ((0)) NOT NULL,
    [contributor_email] NCHAR (100)    NULL,
    CONSTRAINT [PK_Municipality] PRIMARY KEY CLUSTERED ([id] ASC)
);

