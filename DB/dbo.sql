/*
 Navicat Premium Data Transfer

 Source Server         : MySql Server
 Source Server Type    : SQL Server
 Source Server Version : 16001000 (16.00.1000)
 Source Host           : MSI\SQLEXPRESS:1433
 Source Catalog        : Zando_db
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 16001000 (16.00.1000)
 File Encoding         : 65001

 Date: 24/12/2024 08:06:10
*/


-- ----------------------------
-- Table structure for add_to_card
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[add_to_card]') AND type IN ('U'))
	DROP TABLE [dbo].[add_to_card]
GO

CREATE TABLE [dbo].[add_to_card] (
  [add_cart_id] int  NOT NULL,
  [customer_id] int  NOT NULL,
  [product_id] int  NOT NULL,
  [quantity] int  NOT NULL,
  [date_added] datetime  NULL
)
GO

ALTER TABLE [dbo].[add_to_card] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'link to customer table',
'SCHEMA', N'dbo',
'TABLE', N'add_to_card',
'COLUMN', N'customer_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'link to table product',
'SCHEMA', N'dbo',
'TABLE', N'add_to_card',
'COLUMN', N'product_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'number of quantity added',
'SCHEMA', N'dbo',
'TABLE', N'add_to_card',
'COLUMN', N'quantity'
GO


-- ----------------------------
-- Records of add_to_card
-- ----------------------------
INSERT INTO [dbo].[add_to_card] ([add_cart_id], [customer_id], [product_id], [quantity], [date_added]) VALUES (N'1', N'1', N'101', N'2', N'2024-12-24 08:04:29.000')
GO


-- ----------------------------
-- Table structure for authentication
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[authentication]') AND type IN ('U'))
	DROP TABLE [dbo].[authentication]
GO

CREATE TABLE [dbo].[authentication] (
  [aut_id] int  NOT NULL,
  [user_name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [mobile] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [password] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [staff_id] int  NOT NULL
)
GO

ALTER TABLE [dbo].[authentication] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'FK link to staff ID',
'SCHEMA', N'dbo',
'TABLE', N'authentication',
'COLUMN', N'staff_id'
GO


-- ----------------------------
-- Records of authentication
-- ----------------------------
INSERT INTO [dbo].[authentication] ([aut_id], [user_name], [mobile], [password], [staff_id]) VALUES (N'1', N'Khorn', N'096 660 6721', N'123', N'1')
GO


-- ----------------------------
-- Table structure for branch
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[branch]') AND type IN ('U'))
	DROP TABLE [dbo].[branch]
GO

CREATE TABLE [dbo].[branch] (
  [branch_id] int  NOT NULL,
  [branch_name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [branch_logo] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [mobile_number] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [location] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[branch] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of branch
-- ----------------------------
INSERT INTO [dbo].[branch] ([branch_id], [branch_name], [branch_logo], [mobile_number], [location]) VALUES (N'1', N'ZandoKH', N'logo', N'09999999', N'pp')
GO


-- ----------------------------
-- Table structure for categories
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[categories]') AND type IN ('U'))
	DROP TABLE [dbo].[categories]
GO

CREATE TABLE [dbo].[categories] (
  [categories_id] int  NOT NULL,
  [category_name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [description] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [created_at] timestamp  NOT NULL,
  [aut_id] int  NOT NULL
)
GO

ALTER TABLE [dbo].[categories] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'FK link to authotication',
'SCHEMA', N'dbo',
'TABLE', N'categories',
'COLUMN', N'aut_id'
GO


-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO [dbo].[categories] ([categories_id], [category_name], [description], [created_at], [aut_id]) VALUES (N'1', N'Hoodies', N'hoodies', 0x00000000000084D3, N'1')
GO


-- ----------------------------
-- Table structure for customers
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[customers]') AND type IN ('U'))
	DROP TABLE [dbo].[customers]
GO

CREATE TABLE [dbo].[customers] (
  [customer_id] int  NOT NULL,
  [first_name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [last_name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [mobile] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [password] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [aut_id] int  NOT NULL,
  [created_at] datetime  NULL
)
GO

ALTER TABLE [dbo].[customers] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'FK link authotication',
'SCHEMA', N'dbo',
'TABLE', N'customers',
'COLUMN', N'aut_id'
GO


-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO [dbo].[customers] ([customer_id], [first_name], [last_name], [mobile], [password], [aut_id], [created_at]) VALUES (N'1', N'khorn', N'Thavreak', N'0987654', N'123', N'1', N'2024-12-24 08:03:52.000')
GO


-- ----------------------------
-- Table structure for inovice_item
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[inovice_item]') AND type IN ('U'))
	DROP TABLE [dbo].[inovice_item]
GO

CREATE TABLE [dbo].[inovice_item] (
  [invoice_item_id] int  NOT NULL,
  [invoice_id] int  NOT NULL,
  [product_id] int  NOT NULL,
  [quantity] int  NOT NULL,
  [unit_price] decimal(18)  NOT NULL,
  [total_amount] decimal(18)  NOT NULL
)
GO

ALTER TABLE [dbo].[inovice_item] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'quantity * qty',
'SCHEMA', N'dbo',
'TABLE', N'inovice_item',
'COLUMN', N'total_amount'
GO


-- ----------------------------
-- Records of inovice_item
-- ----------------------------

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[invoice]') AND type IN ('U'))
	DROP TABLE [dbo].[invoice]
GO

CREATE TABLE [dbo].[invoice] (
  [invoice_id] int  NOT NULL,
  [order_id] int  NOT NULL,
  [customer_id] int  NOT NULL,
  [aut_id] int  NOT NULL,
  [payment_id] int  NULL,
  [invoice_date] datetime  NOT NULL,
  [total_amount] money  NOT NULL,
  [status] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [shipping_address] int  NOT NULL
)
GO

ALTER TABLE [dbo].[invoice] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of invoice
-- ----------------------------

-- ----------------------------
-- Table structure for notification
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[notification]') AND type IN ('U'))
	DROP TABLE [dbo].[notification]
GO

CREATE TABLE [dbo].[notification] (
  [notification_id] int  NOT NULL,
  [invoice_id] int  NOT NULL,
  [created_at] timestamp  NOT NULL
)
GO

ALTER TABLE [dbo].[notification] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of notification
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[order]') AND type IN ('U'))
	DROP TABLE [dbo].[order]
GO

CREATE TABLE [dbo].[order] (
  [order_id] int  NOT NULL,
  [customer_id] int  NOT NULL,
  [order_date] timestamp  NOT NULL,
  [total_amount] float(53)  NOT NULL,
  [status] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [verify_by] int  NOT NULL
)
GO

ALTER TABLE [dbo].[order] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'pendding, shipped, delivery',
'SCHEMA', N'dbo',
'TABLE', N'order',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'FK link to authenthication',
'SCHEMA', N'dbo',
'TABLE', N'order',
'COLUMN', N'verify_by'
GO


-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[order_details]') AND type IN ('U'))
	DROP TABLE [dbo].[order_details]
GO

CREATE TABLE [dbo].[order_details] (
  [order_detail_id] int  NOT NULL,
  [order_id] int  NOT NULL,
  [product_id] int  NOT NULL,
  [quantity] int  NOT NULL,
  [price_per_unit] money  NOT NULL,
  [sub_total] money  NOT NULL
)
GO

ALTER TABLE [dbo].[order_details] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'FK orders',
'SCHEMA', N'dbo',
'TABLE', N'order_details',
'COLUMN', N'order_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'FK products',
'SCHEMA', N'dbo',
'TABLE', N'order_details',
'COLUMN', N'product_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'quentity * price per unit',
'SCHEMA', N'dbo',
'TABLE', N'order_details',
'COLUMN', N'sub_total'
GO


-- ----------------------------
-- Records of order_details
-- ----------------------------

-- ----------------------------
-- Table structure for payment_method
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[payment_method]') AND type IN ('U'))
	DROP TABLE [dbo].[payment_method]
GO

CREATE TABLE [dbo].[payment_method] (
  [payment_method_id] int  NOT NULL,
  [bank_name] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [account_number] int  NOT NULL,
  [qrcode] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [payment_id] int  NOT NULL
)
GO

ALTER TABLE [dbo].[payment_method] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of payment_method
-- ----------------------------

-- ----------------------------
-- Table structure for payments
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[payments]') AND type IN ('U'))
	DROP TABLE [dbo].[payments]
GO

CREATE TABLE [dbo].[payments] (
  [payment_id] int  NOT NULL,
  [order_id] int  NOT NULL,
  [payment_date] timestamp  NOT NULL,
  [amount] decimal(18)  NOT NULL,
  [status] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[payments] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'pedding(defual), completed, failed',
'SCHEMA', N'dbo',
'TABLE', N'payments',
'COLUMN', N'status'
GO


-- ----------------------------
-- Records of payments
-- ----------------------------

-- ----------------------------
-- Table structure for prducts
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[prducts]') AND type IN ('U'))
	DROP TABLE [dbo].[prducts]
GO

CREATE TABLE [dbo].[prducts] (
  [product_id] int  NOT NULL,
  [product_name] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [price] money  NOT NULL,
  [size] varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [categories_id] int  NOT NULL,
  [color] varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [aut_id] int  NOT NULL
)
GO

ALTER TABLE [dbo].[prducts] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'FK',
'SCHEMA', N'dbo',
'TABLE', N'prducts',
'COLUMN', N'categories_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'FK',
'SCHEMA', N'dbo',
'TABLE', N'prducts',
'COLUMN', N'aut_id'
GO


-- ----------------------------
-- Records of prducts
-- ----------------------------
INSERT INTO [dbo].[prducts] ([product_id], [product_name], [price], [size], [categories_id], [color], [aut_id]) VALUES (N'101', N'hoodies', N'11.5000', N'XL', N'1', N'black', N'1')
GO


-- ----------------------------
-- Table structure for product_details
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[product_details]') AND type IN ('U'))
	DROP TABLE [dbo].[product_details]
GO

CREATE TABLE [dbo].[product_details] (
  [product_detail_id] int  NOT NULL,
  [product_id] int  NOT NULL,
  [created_at] timestamp  NOT NULL,
  [description] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [quantity] int  NOT NULL
)
GO

ALTER TABLE [dbo].[product_details] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'FK',
'SCHEMA', N'dbo',
'TABLE', N'product_details',
'COLUMN', N'product_id'
GO


-- ----------------------------
-- Records of product_details
-- ----------------------------

-- ----------------------------
-- Table structure for shipping_details
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[shipping_details]') AND type IN ('U'))
	DROP TABLE [dbo].[shipping_details]
GO

CREATE TABLE [dbo].[shipping_details] (
  [shipping_details_id] int  NOT NULL,
  [order_id] int  NOT NULL,
  [customer_id] int  NOT NULL,
  [shipping_adress] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [shipping_number] datetime  NOT NULL,
  [shipping_date] datetime  NOT NULL,
  [delivery_date] datetime  NOT NULL,
  [tracking_number] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [status] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[shipping_details] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'optional overide address to delivery',
'SCHEMA', N'dbo',
'TABLE', N'shipping_details',
'COLUMN', N'shipping_adress'
GO

EXEC sp_addextendedproperty
'MS_Description', N'override mobile number',
'SCHEMA', N'dbo',
'TABLE', N'shipping_details',
'COLUMN', N'shipping_number'
GO

EXEC sp_addextendedproperty
'MS_Description', N'When the order was shipped',
'SCHEMA', N'dbo',
'TABLE', N'shipping_details',
'COLUMN', N'shipping_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Estimated/actual delivery date',
'SCHEMA', N'dbo',
'TABLE', N'shipping_details',
'COLUMN', N'delivery_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Tracking number for shipment',
'SCHEMA', N'dbo',
'TABLE', N'shipping_details',
'COLUMN', N'tracking_number'
GO


-- ----------------------------
-- Records of shipping_details
-- ----------------------------

-- ----------------------------
-- Table structure for staffs
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[staffs]') AND type IN ('U'))
	DROP TABLE [dbo].[staffs]
GO

CREATE TABLE [dbo].[staffs] (
  [staff_id] int  NOT NULL,
  [first_name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [last_name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [profile] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [gender] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [mobile] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [email] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [password] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [adress] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [status] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [branch_id] int  NULL,
  [position] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[staffs] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'Foreign Key link to branchID',
'SCHEMA', N'dbo',
'TABLE', N'staffs',
'COLUMN', N'branch_id'
GO


-- ----------------------------
-- Records of staffs
-- ----------------------------
INSERT INTO [dbo].[staffs] ([staff_id], [first_name], [last_name], [profile], [gender], [mobile], [email], [password], [adress], [status], [branch_id], [position]) VALUES (N'1', N'khorn', N'Thavreak', N'profile', N'male', N'096 660 6621', N'thavreak@gmail.com', N'123', N'pp', N'active', N'1', N'admin')
GO


-- ----------------------------
-- Table structure for stock_details
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[stock_details]') AND type IN ('U'))
	DROP TABLE [dbo].[stock_details]
GO

CREATE TABLE [dbo].[stock_details] (
  [stock_details_id] int  NOT NULL,
  [transaction_date] datetime2(7)  NOT NULL,
  [purchase_price] money  NOT NULL,
  [supply_details] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [location] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [status] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [stock_id] int  NOT NULL
)
GO

ALTER TABLE [dbo].[stock_details] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'available, on stock, damage',
'SCHEMA', N'dbo',
'TABLE', N'stock_details',
'COLUMN', N'status'
GO


-- ----------------------------
-- Records of stock_details
-- ----------------------------

-- ----------------------------
-- Table structure for stocks
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[stocks]') AND type IN ('U'))
	DROP TABLE [dbo].[stocks]
GO

CREATE TABLE [dbo].[stocks] (
  [stock_id] int  NOT NULL,
  [product_id] int  NOT NULL,
  [quantity] float(53)  NOT NULL,
  [aut_id] int  NOT NULL,
  [categoies_id] int  NOT NULL,
  [sell_price] money  NOT NULL
)
GO

ALTER TABLE [dbo].[stocks] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'FK link to products',
'SCHEMA', N'dbo',
'TABLE', N'stocks',
'COLUMN', N'product_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'FK',
'SCHEMA', N'dbo',
'TABLE', N'stocks',
'COLUMN', N'aut_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'FK',
'SCHEMA', N'dbo',
'TABLE', N'stocks',
'COLUMN', N'categoies_id'
GO


-- ----------------------------
-- Records of stocks
-- ----------------------------

-- ----------------------------
-- procedure structure for sp_upgraddiagrams
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_upgraddiagrams]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_upgraddiagrams]
GO

CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
GO


-- ----------------------------
-- procedure structure for sp_helpdiagrams
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_helpdiagrams]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_helpdiagrams]
GO

CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
GO


-- ----------------------------
-- procedure structure for sp_helpdiagramdefinition
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_helpdiagramdefinition]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_helpdiagramdefinition]
GO

CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
GO


-- ----------------------------
-- procedure structure for sp_creatediagram
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_creatediagram]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_creatediagram]
GO

CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
GO


-- ----------------------------
-- procedure structure for sp_renamediagram
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_renamediagram]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_renamediagram]
GO

CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
GO


-- ----------------------------
-- procedure structure for sp_alterdiagram
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_alterdiagram]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_alterdiagram]
GO

CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
GO


-- ----------------------------
-- procedure structure for sp_dropdiagram
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_dropdiagram]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_dropdiagram]
GO

CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
GO


-- ----------------------------
-- function structure for fn_diagramobjects
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_diagramobjects]') AND type IN ('FN', 'FS', 'FT', 'IF', 'TF'))
	DROP FUNCTION[dbo].[fn_diagramobjects]
GO

CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
GO


-- ----------------------------
-- Primary Key structure for table add_to_card
-- ----------------------------
ALTER TABLE [dbo].[add_to_card] ADD CONSTRAINT [PK__add_to_c__2EF52A27C8B44ACE] PRIMARY KEY CLUSTERED ([add_cart_id] DESC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Uniques structure for table authentication
-- ----------------------------
ALTER TABLE [dbo].[authentication] ADD CONSTRAINT [UQ__authenti__C4B3209866CC9FC6] UNIQUE NONCLUSTERED ([aut_id] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table authentication
-- ----------------------------
ALTER TABLE [dbo].[authentication] ADD CONSTRAINT [PK__authotic__FCFCAB88A8AEDBA1] PRIMARY KEY CLUSTERED ([aut_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table branch
-- ----------------------------
ALTER TABLE [dbo].[branch] ADD CONSTRAINT [PK__branch__E55E37DE9174B1D5] PRIMARY KEY CLUSTERED ([branch_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table categories
-- ----------------------------
ALTER TABLE [dbo].[categories] ADD CONSTRAINT [PK__categori__92BEE78AA68EAFD8] PRIMARY KEY CLUSTERED ([categories_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Uniques structure for table customers
-- ----------------------------
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [UQ__customer__CD65CB840446BCD3] UNIQUE NONCLUSTERED ([customer_id] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table customers
-- ----------------------------
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [PK__customer__CD65CB8507EF073C] PRIMARY KEY CLUSTERED ([customer_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table inovice_item
-- ----------------------------
ALTER TABLE [dbo].[inovice_item] ADD CONSTRAINT [PK__inovice___84ECDEE94943AC8C] PRIMARY KEY CLUSTERED ([invoice_item_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table invoice
-- ----------------------------
ALTER TABLE [dbo].[invoice] ADD CONSTRAINT [PK__invoice__F58DFD4956101FE6] PRIMARY KEY CLUSTERED ([invoice_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table notification
-- ----------------------------
ALTER TABLE [dbo].[notification] ADD CONSTRAINT [PK__notifica__E059842F99CF04FC] PRIMARY KEY CLUSTERED ([notification_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table order
-- ----------------------------
ALTER TABLE [dbo].[order] ADD CONSTRAINT [PK__ordera__465962297EDF74C9] PRIMARY KEY CLUSTERED ([order_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table order_details
-- ----------------------------
ALTER TABLE [dbo].[order_details] ADD CONSTRAINT [PK__order_de__3C5A40802E6851C8] PRIMARY KEY CLUSTERED ([order_detail_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table payment_method
-- ----------------------------
ALTER TABLE [dbo].[payment_method] ADD CONSTRAINT [PK__payment___8A3EA9EB5EF5DCC9] PRIMARY KEY CLUSTERED ([payment_method_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table payments
-- ----------------------------
ALTER TABLE [dbo].[payments] ADD CONSTRAINT [PK__payments__ED1FC9EA195F1965] PRIMARY KEY CLUSTERED ([payment_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table prducts
-- ----------------------------
ALTER TABLE [dbo].[prducts] ADD CONSTRAINT [PK__prducts__47027DF55EF0B962] PRIMARY KEY CLUSTERED ([product_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table product_details
-- ----------------------------
ALTER TABLE [dbo].[product_details] ADD CONSTRAINT [PK__product___DDB4AD33D91EF005] PRIMARY KEY CLUSTERED ([product_detail_id] DESC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table shipping_details
-- ----------------------------
ALTER TABLE [dbo].[shipping_details] ADD CONSTRAINT [PK__shippign__EC5AECD2FAC9AB87] PRIMARY KEY CLUSTERED ([shipping_details_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table staffs
-- ----------------------------
ALTER TABLE [dbo].[staffs] ADD CONSTRAINT [PK__staffs__1963DD9C04225C08] PRIMARY KEY CLUSTERED ([staff_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table stock_details
-- ----------------------------
ALTER TABLE [dbo].[stock_details] ADD CONSTRAINT [PK__stock_de__C04AFBD739FBC25B] PRIMARY KEY CLUSTERED ([stock_details_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table stocks
-- ----------------------------
ALTER TABLE [dbo].[stocks] ADD CONSTRAINT [PK__stocks__E8666862D1F8B6C8] PRIMARY KEY CLUSTERED ([stock_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table add_to_card
-- ----------------------------
ALTER TABLE [dbo].[add_to_card] ADD CONSTRAINT [FK__add_to_ca__custo__3493CFA7] FOREIGN KEY ([customer_id]) REFERENCES [dbo].[customers] ([customer_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[add_to_card] ADD CONSTRAINT [FK__add_to_ca__produ__3587F3E0] FOREIGN KEY ([product_id]) REFERENCES [dbo].[prducts] ([product_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO


-- ----------------------------
-- Foreign Keys structure for table authentication
-- ----------------------------
ALTER TABLE [dbo].[authentication] ADD CONSTRAINT [staff_id] FOREIGN KEY ([staff_id]) REFERENCES [dbo].[staffs] ([staff_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO


-- ----------------------------
-- Foreign Keys structure for table categories
-- ----------------------------
ALTER TABLE [dbo].[categories] ADD CONSTRAINT [FK__categorie__aut_i__160F4887] FOREIGN KEY ([aut_id]) REFERENCES [dbo].[authentication] ([aut_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO


-- ----------------------------
-- Foreign Keys structure for table customers
-- ----------------------------
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [aut_id] FOREIGN KEY ([aut_id]) REFERENCES [dbo].[authentication] ([aut_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table inovice_item
-- ----------------------------
ALTER TABLE [dbo].[inovice_item] ADD CONSTRAINT [FK__inovice_i__produ__0A688BB1] FOREIGN KEY ([product_id]) REFERENCES [dbo].[prducts] ([product_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[inovice_item] ADD CONSTRAINT [invoice_item] FOREIGN KEY ([invoice_id]) REFERENCES [dbo].[invoice] ([invoice_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table invoice
-- ----------------------------
ALTER TABLE [dbo].[invoice] ADD CONSTRAINT [FK__invoice__order_i__6BE40491] FOREIGN KEY ([order_id]) REFERENCES [dbo].[order] ([order_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[invoice] ADD CONSTRAINT [FK__invoice__custome__6DCC4D03] FOREIGN KEY ([customer_id]) REFERENCES [dbo].[customers] ([customer_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[invoice] ADD CONSTRAINT [FK__invoice__aut_id__73852659] FOREIGN KEY ([aut_id]) REFERENCES [dbo].[authentication] ([aut_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[invoice] ADD CONSTRAINT [FK__invoice__payment__756D6ECB] FOREIGN KEY ([payment_id]) REFERENCES [dbo].[payments] ([payment_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[invoice] ADD CONSTRAINT [FK__invoice__shippin__7EF6D905] FOREIGN KEY ([shipping_address]) REFERENCES [dbo].[shipping_details] ([shipping_details_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table notification
-- ----------------------------
ALTER TABLE [dbo].[notification] ADD CONSTRAINT [FK__notificat__invoi__11158940] FOREIGN KEY ([invoice_id]) REFERENCES [dbo].[invoice] ([invoice_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO


-- ----------------------------
-- Foreign Keys structure for table order
-- ----------------------------
ALTER TABLE [dbo].[order] ADD CONSTRAINT [FK__order__verify_by__3864608B] FOREIGN KEY ([verify_by]) REFERENCES [dbo].[authentication] ([aut_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[order] ADD CONSTRAINT [FK__order__customer___395884C4] FOREIGN KEY ([customer_id]) REFERENCES [dbo].[customers] ([customer_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO


-- ----------------------------
-- Foreign Keys structure for table order_details
-- ----------------------------
ALTER TABLE [dbo].[order_details] ADD CONSTRAINT [FK__order_det__order__4D5F7D71] FOREIGN KEY ([order_id]) REFERENCES [dbo].[order] ([order_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[order_details] ADD CONSTRAINT [FK__order_det__produ__55009F39] FOREIGN KEY ([product_id]) REFERENCES [dbo].[prducts] ([product_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO


-- ----------------------------
-- Foreign Keys structure for table payment_method
-- ----------------------------
ALTER TABLE [dbo].[payment_method] ADD CONSTRAINT [FK__payment_m__payme__5F7E2DAC] FOREIGN KEY ([payment_id]) REFERENCES [dbo].[payments] ([payment_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO


-- ----------------------------
-- Foreign Keys structure for table payments
-- ----------------------------
ALTER TABLE [dbo].[payments] ADD CONSTRAINT [FK__payments__order___59C55456] FOREIGN KEY ([order_id]) REFERENCES [dbo].[order] ([order_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO


-- ----------------------------
-- Foreign Keys structure for table prducts
-- ----------------------------
ALTER TABLE [dbo].[prducts] ADD CONSTRAINT [FK__prducts__categor__1AD3FDA4] FOREIGN KEY ([categories_id]) REFERENCES [dbo].[categories] ([categories_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[prducts] ADD CONSTRAINT [FK__prducts__aut_id__31B762FC] FOREIGN KEY ([aut_id]) REFERENCES [dbo].[authentication] ([aut_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table product_details
-- ----------------------------
ALTER TABLE [dbo].[product_details] ADD CONSTRAINT [FK__product_d__produ__1F98B2C1] FOREIGN KEY ([product_id]) REFERENCES [dbo].[prducts] ([product_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO


-- ----------------------------
-- Foreign Keys structure for table shipping_details
-- ----------------------------
ALTER TABLE [dbo].[shipping_details] ADD CONSTRAINT [FK__shippign___order__6442E2C9] FOREIGN KEY ([order_id]) REFERENCES [dbo].[order] ([order_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[shipping_details] ADD CONSTRAINT [FK__shippign___custo__671F4F74] FOREIGN KEY ([customer_id]) REFERENCES [dbo].[customers] ([customer_id]) ON DELETE NO ACTION ON UPDATE NO ACTION NOT FOR REPLICATION
GO


-- ----------------------------
-- Foreign Keys structure for table staffs
-- ----------------------------
ALTER TABLE [dbo].[staffs] ADD CONSTRAINT [branch_id] FOREIGN KEY ([branch_id]) REFERENCES [dbo].[branch] ([branch_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO


-- ----------------------------
-- Foreign Keys structure for table stock_details
-- ----------------------------
ALTER TABLE [dbo].[stock_details] ADD CONSTRAINT [FK__stock_det__stock__2645B050] FOREIGN KEY ([stock_id]) REFERENCES [dbo].[stocks] ([stock_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO


-- ----------------------------
-- Foreign Keys structure for table stocks
-- ----------------------------
ALTER TABLE [dbo].[stocks] ADD CONSTRAINT [FK__stocks__aut_id__22751F6C] FOREIGN KEY ([aut_id]) REFERENCES [dbo].[authentication] ([aut_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[stocks] ADD CONSTRAINT [FK__stocks__categoie__25518C17] FOREIGN KEY ([categoies_id]) REFERENCES [dbo].[categories] ([categories_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[stocks] ADD CONSTRAINT [FK__stocks__product___2739D489] FOREIGN KEY ([product_id]) REFERENCES [dbo].[prducts] ([product_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

