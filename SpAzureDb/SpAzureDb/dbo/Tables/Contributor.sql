CREATE TABLE [dbo].[Contributor] (
    [email] NVARCHAR (100) NOT NULL,
    [name]  NVARCHAR (100) NOT NULL,
    [admin] BIT            CONSTRAINT [DF_Contributor_admin] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Contributor] PRIMARY KEY CLUSTERED ([email] ASC)
);

