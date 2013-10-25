
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/24/2013 22:34:04
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

IF OBJECT_ID(N'[dbo].[FK_PharmaProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_PharmaProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductData]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NCPDP_Data] DROP CONSTRAINT [FK_ProductData];
GO
IF OBJECT_ID(N'[dbo].[FK_PlanData]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NCPDP_Data] DROP CONSTRAINT [FK_PlanData];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Pharmas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pharmas];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[Plans]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Plans];
GO
IF OBJECT_ID(N'[dbo].[NCPDP_Data]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NCPDP_Data];
GO

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
    [NDC] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [WAC] decimal(18,0)  NOT NULL,
    [Size] nvarchar(max)  NOT NULL,
    [PharmaId] int  NOT NULL
);
GO

-- Creating table 'Plans'
CREATE TABLE [dbo].[Plans] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [ContactName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'NCPDP_Data'
CREATE TABLE [dbo].[NCPDP_Data] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SubmissionQtr] nvarchar(max)  NOT NULL,
    [DataLevel] nchar(2)  NOT NULL,
    [PlanIDQualifier] nchar(2)  NULL,
    [PlanName] nchar(30)  NOT NULL,
    [ServiceProviderIDQualifier] nchar(2)  NULL,
    [ServiceProviderID] nchar(15)  NULL,
    [PharmacyServiceType] nchar(2)  NULL,
    [ProductIDQualifier] nchar(2)  NOT NULL,
    [ProductID] nchar(19)  NOT NULL,
    [ProductDescription] nchar(30)  NULL,
    [DAW] nchar(1)  NULL,
    [TotalQuantity] nchar(15)  NULL,
    [UnitofMeasure] nvarchar(max)  NULL,
    [Filler1] nchar(8)  NULL,
    [RebateDaysSupply] nchar(4)  NULL,
    [PrescriptionType] nchar(2)  NULL,
    [TotalNumberofPresciptions] nchar(8)  NOT NULL,
    [PrescriptionNumberQualifier] nchar(1)  NULL,
    [PrescriptionNumber] nchar(12)  NULL,
    [DateofService] nchar(8)  NULL,
    [TherapeuticClassCodeQualifier] nchar(1)  NULL,
    [TherapeuticClassCode] nchar(17)  NULL,
    [TherapeuticClassDescription] nchar(30)  NULL,
    [ReimbursementQualifier] nchar(2)  NULL,
    [ReimbursementAmount] nchar(12)  NULL,
    [ReimbursementDate] nchar(12)  NULL,
    [PatientLiability] nchar(12)  NOT NULL,
    [FillNumber] nvarchar(max)  NOT NULL,
    [RecordPurposeIndicator] nvarchar(max)  NOT NULL,
    [RebatePerUnitAmount] nvarchar(max)  NOT NULL,
    [RequestedRebateAmount] nvarchar(max)  NOT NULL,
    [PrescriberIDQualifier] nvarchar(max)  NOT NULL,
    [PrescriberID] nvarchar(max)  NOT NULL,
    [ClaimNumber] nvarchar(max)  NOT NULL,
    [ProductNDC] int  NOT NULL,
    [PlanIdCode] int  NOT NULL
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

-- Creating primary key on [NDC] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([NDC] ASC);
GO

-- Creating primary key on [Id] in table 'Plans'
ALTER TABLE [dbo].[Plans]
ADD CONSTRAINT [PK_Plans]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'NCPDP_Data'
ALTER TABLE [dbo].[NCPDP_Data]
ADD CONSTRAINT [PK_NCPDP_Data]
    PRIMARY KEY CLUSTERED ([Id] ASC);
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

-- Creating foreign key on [ProductNDC] in table 'NCPDP_Data'
ALTER TABLE [dbo].[NCPDP_Data]
ADD CONSTRAINT [FK_ProductData]
    FOREIGN KEY ([ProductNDC])
    REFERENCES [dbo].[Products]
        ([NDC])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductData'
CREATE INDEX [IX_FK_ProductData]
ON [dbo].[NCPDP_Data]
    ([ProductNDC]);
GO

-- Creating foreign key on [PlanIdCode] in table 'NCPDP_Data'
ALTER TABLE [dbo].[NCPDP_Data]
ADD CONSTRAINT [FK_PlanData]
    FOREIGN KEY ([PlanIdCode])
    REFERENCES [dbo].[Plans]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PlanData'
CREATE INDEX [IX_FK_PlanData]
ON [dbo].[NCPDP_Data]
    ([PlanIdCode]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------