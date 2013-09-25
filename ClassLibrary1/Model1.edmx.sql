
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/24/2013 21:15:21
-- Generated from EDMX file: C:\Users\Justin\Documents\Visual Studio 2013\Projects\ClassLibrary1\ClassLibrary1\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SmartPharm];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Pharmas'
CREATE TABLE [dbo].[Pharmas] (
    [PharmaId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [NDC] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [WAC] decimal(18,0)  NOT NULL,
    [Size] nvarchar(max)  NOT NULL,
    [PharmaId] int  NOT NULL
);
GO

-- Creating table 'Clients'
CREATE TABLE [dbo].[Clients] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RebateTerms'
CREATE TABLE [dbo].[RebateTerms] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Qtr] nvarchar(max)  NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [Admin] float  NULL,
    [Formulary] float  NULL,
    [MktShare] nvarchar(max)  NOT NULL,
    [MSFrom] nvarchar(max)  NOT NULL,
    [MSTo] nvarchar(max)  NOT NULL,
    [Access] float  NULL
);
GO

-- Creating table 'ProductRebateTerm'
CREATE TABLE [dbo].[ProductRebateTerm] (
    [Products_Id] int  NOT NULL,
    [RebateTerms_Id] int  NOT NULL
);
GO

-- Creating table 'ClientRebateTerm'
CREATE TABLE [dbo].[ClientRebateTerm] (
    [Clients_Id] int  NOT NULL,
    [RebateTerms_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [PharmaId] in table 'Pharmas'
ALTER TABLE [dbo].[Pharmas]
ADD CONSTRAINT [PK_Pharmas]
    PRIMARY KEY CLUSTERED ([PharmaId] ASC);
GO

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Clients'
ALTER TABLE [dbo].[Clients]
ADD CONSTRAINT [PK_Clients]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RebateTerms'
ALTER TABLE [dbo].[RebateTerms]
ADD CONSTRAINT [PK_RebateTerms]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Products_Id], [RebateTerms_Id] in table 'ProductRebateTerm'
ALTER TABLE [dbo].[ProductRebateTerm]
ADD CONSTRAINT [PK_ProductRebateTerm]
    PRIMARY KEY CLUSTERED ([Products_Id], [RebateTerms_Id] ASC);
GO

-- Creating primary key on [Clients_Id], [RebateTerms_Id] in table 'ClientRebateTerm'
ALTER TABLE [dbo].[ClientRebateTerm]
ADD CONSTRAINT [PK_ClientRebateTerm]
    PRIMARY KEY CLUSTERED ([Clients_Id], [RebateTerms_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [PharmaId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_PharmaProduct]
    FOREIGN KEY ([PharmaId])
    REFERENCES [dbo].[Pharmas]
        ([PharmaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PharmaProduct'
CREATE INDEX [IX_FK_PharmaProduct]
ON [dbo].[Products]
    ([PharmaId]);
GO

-- Creating foreign key on [Products_Id] in table 'ProductRebateTerm'
ALTER TABLE [dbo].[ProductRebateTerm]
ADD CONSTRAINT [FK_ProductRebateTerm_Product]
    FOREIGN KEY ([Products_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [RebateTerms_Id] in table 'ProductRebateTerm'
ALTER TABLE [dbo].[ProductRebateTerm]
ADD CONSTRAINT [FK_ProductRebateTerm_RebateTerm]
    FOREIGN KEY ([RebateTerms_Id])
    REFERENCES [dbo].[RebateTerms]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductRebateTerm_RebateTerm'
CREATE INDEX [IX_FK_ProductRebateTerm_RebateTerm]
ON [dbo].[ProductRebateTerm]
    ([RebateTerms_Id]);
GO

-- Creating foreign key on [Clients_Id] in table 'ClientRebateTerm'
ALTER TABLE [dbo].[ClientRebateTerm]
ADD CONSTRAINT [FK_ClientRebateTerm_Client]
    FOREIGN KEY ([Clients_Id])
    REFERENCES [dbo].[Clients]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [RebateTerms_Id] in table 'ClientRebateTerm'
ALTER TABLE [dbo].[ClientRebateTerm]
ADD CONSTRAINT [FK_ClientRebateTerm_RebateTerm]
    FOREIGN KEY ([RebateTerms_Id])
    REFERENCES [dbo].[RebateTerms]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientRebateTerm_RebateTerm'
CREATE INDEX [IX_FK_ClientRebateTerm_RebateTerm]
ON [dbo].[ClientRebateTerm]
    ([RebateTerms_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------