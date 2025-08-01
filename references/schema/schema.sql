USE [master]
GO
/****** Object:  Database [ecom]    Script Date: 16-07-2025 10:16:32 ******/
CREATE DATABASE [ecom]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ecom', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ecom.mdf' , SIZE = 204800KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ecom_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ecom_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ecom] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ecom].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ecom] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ecom] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ecom] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ecom] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ecom] SET ARITHABORT OFF 
GO
ALTER DATABASE [ecom] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ecom] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ecom] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ecom] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ecom] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ecom] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ecom] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ecom] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ecom] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ecom] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ecom] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ecom] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ecom] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ecom] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ecom] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ecom] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ecom] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ecom] SET RECOVERY FULL 
GO
ALTER DATABASE [ecom] SET  MULTI_USER 
GO
ALTER DATABASE [ecom] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ecom] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ecom] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ecom] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ecom] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ecom] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ecom', N'ON'
GO
ALTER DATABASE [ecom] SET QUERY_STORE = OFF
GO
USE [ecom]
GO
/****** Object:  Table [dbo].[olist_customers_dataset]    Script Date: 16-07-2025 10:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olist_customers_dataset](
	[customer_id] [nvarchar](50) NOT NULL,
	[customer_unique_id] [nvarchar](50) NOT NULL,
	[customer_zip_code_prefix] [int] NOT NULL,
	[customer_city] [nvarchar](50) NOT NULL,
	[customer_state] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[olist_geolocation_dataset]    Script Date: 16-07-2025 10:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olist_geolocation_dataset](
	[geolocation_zip_code_prefix] [int] NOT NULL,
	[geolocation_lat] [float] NOT NULL,
	[geolocation_lng] [float] NOT NULL,
	[geolocation_city] [nvarchar](50) NOT NULL,
	[geolocation_state] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[olist_order_items_dataset]    Script Date: 16-07-2025 10:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olist_order_items_dataset](
	[order_id] [nvarchar](50) NOT NULL,
	[order_item_id] [smallint] NOT NULL,
	[product_id] [nvarchar](50) NOT NULL,
	[seller_id] [nvarchar](50) NOT NULL,
	[shipping_limit_date] [datetime2](7) NOT NULL,
	[price] [float] NOT NULL,
	[freight_value] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[olist_order_payments_dataset]    Script Date: 16-07-2025 10:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olist_order_payments_dataset](
	[order_id] [nvarchar](50) NOT NULL,
	[payment_sequential] [smallint] NOT NULL,
	[payment_type] [nvarchar](50) NOT NULL,
	[payment_installments] [smallint] NOT NULL,
	[payment_value] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[olist_order_reviews_dataset]    Script Date: 16-07-2025 10:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olist_order_reviews_dataset](
	[review_id] [nvarchar](50) NOT NULL,
	[order_id] [nvarchar](50) NOT NULL,
	[review_score] [smallint] NOT NULL,
	[review_comment_title] [nvarchar](50) NULL,
	[review_comment_message] [nvarchar](250) NULL,
	[review_creation_date] [datetime2](7) NOT NULL,
	[review_answer_timestamp] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[olist_orders_dataset]    Script Date: 16-07-2025 10:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olist_orders_dataset](
	[order_id] [nvarchar](50) NOT NULL,
	[customer_id] [nvarchar](50) NOT NULL,
	[order_status] [nvarchar](50) NOT NULL,
	[order_purchase_timestamp] [datetime2](7) NOT NULL,
	[order_approved_at] [datetime2](7) NULL,
	[order_delivered_carrier_date] [datetime2](7) NULL,
	[order_delivered_customer_date] [datetime2](7) NULL,
	[order_estimated_delivery_date] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[olist_products_dataset]    Script Date: 16-07-2025 10:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olist_products_dataset](
	[product_id] [nvarchar](50) NOT NULL,
	[product_category_name] [nvarchar](50) NULL,
	[product_name_lenght] [int] NULL,
	[product_description_lenght] [int] NULL,
	[product_photos_qty] [smallint] NULL,
	[product_weight_g] [int] NULL,
	[product_length_cm] [int] NULL,
	[product_height_cm] [int] NULL,
	[product_width_cm] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[olist_sellers_dataset]    Script Date: 16-07-2025 10:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olist_sellers_dataset](
	[seller_id] [nvarchar](50) NOT NULL,
	[seller_zip_code_prefix] [int] NOT NULL,
	[seller_city] [nvarchar](50) NOT NULL,
	[seller_state] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[seller_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[olist_order_items_dataset]  WITH NOCHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[olist_orders_dataset] ([order_id])
GO
ALTER TABLE [dbo].[olist_order_items_dataset]  WITH NOCHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[olist_products_dataset] ([product_id])
GO
ALTER TABLE [dbo].[olist_order_items_dataset]  WITH NOCHECK ADD FOREIGN KEY([seller_id])
REFERENCES [dbo].[olist_sellers_dataset] ([seller_id])
GO
ALTER TABLE [dbo].[olist_order_payments_dataset]  WITH NOCHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[olist_orders_dataset] ([order_id])
GO
ALTER TABLE [dbo].[olist_order_reviews_dataset]  WITH NOCHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[olist_orders_dataset] ([order_id])
GO
ALTER TABLE [dbo].[olist_orders_dataset]  WITH NOCHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[olist_customers_dataset] ([customer_id])
GO
USE [master]
GO
ALTER DATABASE [ecom] SET  READ_WRITE 
GO
