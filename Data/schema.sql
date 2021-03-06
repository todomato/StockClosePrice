USE [Stock]
GO
/****** Object:  Table [dbo].[Price]    Script Date: 2017/8/21 下午 05:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price](
	[Date] [datetime] NOT NULL,
	[Code] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[OpenPrice] [float] NOT NULL,
	[ClosePrice] [float] NOT NULL,
	[High] [float] NOT NULL,
	[Low] [float] NOT NULL,
	[Volumn] [int] NOT NULL,
 CONSTRAINT [PK_Price] PRIMARY KEY CLUSTERED 
(
	[Date] ASC,
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThreeBigBuySell]    Script Date: 2017/8/21 下午 05:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThreeBigBuySell](
	[Date] [datetime] NOT NULL,
	[Code] [int] NOT NULL,
	[Type] [varchar](3) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[A_Buy] [int] NOT NULL,
	[A_Sell] [int] NOT NULL,
	[A_Total] [int] NOT NULL,
	[B_Buy] [int] NOT NULL,
	[B_Sell] [int] NOT NULL,
	[B_Total] [int] NOT NULL,
	[C_Buy] [int] NOT NULL,
	[C_Sell] [int] NOT NULL,
	[C_Total] [int] NOT NULL,
	[D_Buy] [int] NOT NULL,
	[D_Sell] [int] NOT NULL,
	[D_Total] [int] NOT NULL,
	[CD_Total] [int] NOT NULL,
	[Daily_Total] [int] NOT NULL,
 CONSTRAINT [PK_ThreeBigBuySell] PRIMARY KEY CLUSTERED 
(
	[Date] ASC,
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[公司資訊]    Script Date: 2017/8/21 下午 05:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[公司資訊](
	[代號] [int] NOT NULL,
	[公司名稱] [nvarchar](100) NULL,
	[產業] [nvarchar](100) NULL,
	[股本] [decimal](18, 0) NOT NULL,
	[董事長] [nvarchar](100) NOT NULL,
	[總經理] [nvarchar](100) NOT NULL,
	[發言人] [nvarchar](100) NOT NULL,
	[私募普通股] [decimal](18, 0) NOT NULL,
	[特別股] [decimal](18, 0) NOT NULL,
	[成立日期] [nvarchar](20) NOT NULL,
	[上市日期] [nvarchar](20) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[累計季報表]    Script Date: 2017/8/21 下午 05:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[累計季報表](
	[年份] [int] NOT NULL,
	[季] [int] NOT NULL,
	[代號] [int] NOT NULL,
	[公司名稱] [nvarchar](255) NOT NULL,
	[營業收入] [decimal](18, 0) NOT NULL,
	[營業成本] [decimal](18, 0) NOT NULL,
	[營業毛利_毛損] [decimal](18, 0) NOT NULL,
	[未實現銷貨_損益] [decimal](18, 0) NOT NULL,
	[已實現銷貨_損益] [decimal](18, 0) NOT NULL,
	[營業毛利_毛損淨額] [decimal](18, 0) NOT NULL,
	[營業費用] [decimal](18, 0) NOT NULL,
	[其他收益及費損淨額] [decimal](18, 0) NOT NULL,
	[營業利益_損失] [decimal](18, 0) NOT NULL,
	[營業外收入及支出] [decimal](18, 0) NOT NULL,
	[稅前淨利_淨損] [decimal](18, 0) NOT NULL,
	[所得稅費用_利益] [decimal](18, 0) NOT NULL,
	[繼續營業單位本期淨利_淨損] [decimal](18, 0) NOT NULL,
	[停業單位損益] [decimal](18, 0) NOT NULL,
	[合併前非屬共同控制股權損益] [decimal](18, 0) NOT NULL,
	[本期淨利_淨損] [decimal](18, 0) NOT NULL,
	[其他綜合損益_淨額] [decimal](18, 0) NOT NULL,
	[合併前非屬共同控制股權綜合損益淨額] [decimal](18, 0) NOT NULL,
	[本期綜合損益總額] [decimal](18, 0) NOT NULL,
	[淨利_淨損歸屬於母公司業主] [decimal](18, 0) NOT NULL,
	[淨利_淨損歸屬於共同控制下前手權益] [decimal](18, 0) NOT NULL,
	[淨利_淨損歸屬於非控制權益] [decimal](18, 0) NOT NULL,
	[綜合損益總額歸屬於母公司業主] [decimal](18, 0) NOT NULL,
	[綜合損益總額歸屬於共同控制下前手權益] [decimal](18, 0) NOT NULL,
	[綜合損益總額歸屬於非控制權益] [decimal](18, 0) NOT NULL,
	[基本每股盈餘_元] [decimal](18, 2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[資產負債表]    Script Date: 2017/8/21 下午 05:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[資產負債表](
	[年份] [int] NOT NULL,
	[季] [int] NOT NULL,
	[代號] [int] NOT NULL,
	[公司名稱] [nvarchar](250) NOT NULL,
	[流動資產] [decimal](18, 0) NOT NULL,
	[非流動資產] [decimal](18, 0) NOT NULL,
	[資產總額] [decimal](18, 0) NOT NULL,
	[流動負債] [decimal](18, 0) NOT NULL,
	[非流動負債] [decimal](18, 0) NOT NULL,
	[負債總額] [decimal](18, 0) NOT NULL,
	[股本] [decimal](18, 0) NOT NULL,
	[資本公積] [nvarchar](50) NOT NULL,
	[保留盈餘] [nvarchar](50) NOT NULL,
	[其他權益] [nvarchar](50) NOT NULL,
	[庫藏股票] [nvarchar](50) NOT NULL,
	[歸屬於母公司業主之權益合計] [nvarchar](50) NOT NULL,
	[非控制權益] [nvarchar](50) NOT NULL,
	[權益總額] [decimal](18, 0) NOT NULL,
	[每股參考淨值] [decimal](18, 2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[營收表]    Script Date: 2017/8/21 下午 05:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[營收表](
	[年份] [int] NOT NULL,
	[月份] [int] NOT NULL,
	[代號] [int] NOT NULL,
	[公司名稱] [nvarchar](255) NOT NULL,
	[當月營收] [decimal](18, 0) NOT NULL,
	[上月營收] [decimal](18, 0) NOT NULL,
	[去年同期營收] [decimal](18, 0) NOT NULL,
	[月增率] [decimal](18, 3) NOT NULL,
	[年增率] [decimal](18, 3) NOT NULL,
	[當月累積營收] [decimal](18, 0) NOT NULL,
	[去年累計營收] [decimal](18, 0) NOT NULL,
	[前期比較] [decimal](18, 3) NOT NULL,
	[備註] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[分散表]    Script Date: 2017/8/21 下午 05:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[分散表]
AS
SELECT          TOP (100) PERCENT Code, InfoDate, SUM(ChipCount) AS ChipCount, SUM(Ratio) AS Ratio, TotalPeople, 
                            TotalChipCount, Type, Weeks
FROM              dbo.Chip
GROUP BY   Type, InfoDate, Code, TotalPeople, TotalChipCount, Weeks

GO
/****** Object:  View [dbo].[分散差距表]    Script Date: 2017/8/21 下午 05:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[分散差距表]
AS

SELECT c1.[Code]
      ,c1.[InfoDate]
      ,(c1.[ChipCount] - c2.[ChipCount])/1000 as DiffChipCount
      ,c1.[Ratio]
      ,c1.[TotalPeople]
      ,c1.[TotalChipCount]
      ,c1.[Type]
	  ,c1.[Weeks]
  FROM [Stock].[dbo].[分散表] c1
  left join [分散表] c2 on  c1.Code = c2.Code and c1.type = c2.type
	and c1.Weeks = DATENAME(WK,DATEADD(week,1,c2.InfoDate)) 
	and DATENAME(YY,  c1.InfoDate) = DATENAME(YY,  DATEADD(week,1,c2.InfoDate)) 


union all
SELECT  c1.[Code]
      ,c1.[InfoDate] 
      ,i.TotalNet / 1000 as DiffChipCount
      ,0 as Ratio
      ,0 as TotalPeople
      ,c1.[TotalChipCount]
      ,'法人' as Type
	  ,c1.[Weeks]
  FROM [Stock].[dbo].[分散表] c1
  left join [分散表] c2 on  c1.Code = c2.Code and c1.type = c2.type
	and c1.Weeks = DATENAME(WK,DATEADD(week,1,c2.InfoDate)) 
	and DATENAME(YY,  c1.InfoDate) = DATENAME(YY,  DATEADD(week,1,c2.InfoDate)) 
	 inner join Institution i 
	  on DATENAME(WK,  i.InfoDate) = DATENAME(WK,  c1.InfoDate) 
	  and DATENAME(YY,  i.InfoDate) = DATENAME(YY,  c1.InfoDate) 
	  and i.Code = c1.Code
	where  c1.type = '大戶'

union all
SELECT  c1.[Code]
      ,c1.[InfoDate] 
      ,(c1.[ChipCount] - c2.[ChipCount] - i.TotalNet) / 1000 as DiffChipCount
      ,0 as Ratio
      ,0 as TotalPeople
      ,c1.[TotalChipCount]
      ,'大股東' as Type
	  ,c1.[Weeks]
  FROM [Stock].[dbo].[分散表] c1
  left join [分散表] c2 on  c1.Code = c2.Code and c1.type = c2.type
	and c1.Weeks = DATENAME(WK,DATEADD(week,1,c2.InfoDate)) 
	and DATENAME(YY,  c1.InfoDate) = DATENAME(YY,  DATEADD(week,1,c2.InfoDate)) 
	 inner join Institution i 
	  on DATENAME(WK,  i.InfoDate) = DATENAME(WK,  c1.InfoDate) 
	  and DATENAME(YY,  i.InfoDate) = DATENAME(YY,  c1.InfoDate) 
	  and i.Code = c1.Code
	where  c1.type = '大戶'



GO
/****** Object:  View [dbo].[單季報表]    Script Date: 2017/8/21 下午 05:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[單季報表]
AS
/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/ SELECT [年份], [季], [代號], [公司名稱], [營業收入] AS 累計營收, 
                            [營業收入] -
                                (SELECT          TOP 1 [營業收入]
                                  FROM               累計季報表 t
                                  WHERE           t .季 = a.[季] - 1 AND t .代號 = a.代號 AND t .年份 = a.年份) AS 單季營業收入, [營業成本] -
                                (SELECT          TOP 1 [營業成本]
                                  FROM               累計季報表 t
                                  WHERE           t .季 = a.[季] - 1 AND t .代號 = a.代號 AND t .年份 = a.年份) AS 單季營業成本, 
                            [營業毛利_毛損] -
                                (SELECT          TOP 1 [營業毛利_毛損]
                                  FROM               累計季報表 t
                                  WHERE           t .季 = a.[季] - 1 AND t .代號 = a.代號 AND t .年份 = a.年份) AS 單季營業毛利_毛損, 
                            [營業毛利_毛損淨額] -
                                (SELECT          TOP 1 [營業毛利_毛損淨額]
                                  FROM               累計季報表 t
                                  WHERE           t .季 = a.[季] - 1 AND t .代號 = a.代號 AND t .年份 = a.年份) AS 單季營業毛利_毛損淨額, 
                            [營業費用] -
                                (SELECT          TOP 1 [營業費用]
                                  FROM               累計季報表 t
                                  WHERE           t .季 = a.[季] - 1 AND t .代號 = a.代號 AND t .年份 = a.年份) AS 單季營業費用, 
                            [營業利益_損失] -
                                (SELECT          TOP 1 [營業利益_損失]
                                  FROM               累計季報表 t
                                  WHERE           t .季 = a.[季] - 1 AND t .代號 = a.代號 AND t .年份 = a.年份) AS 單季營業利益_損失, 
                            [營業外收入及支出] -
                                (SELECT          TOP 1 [營業外收入及支出]
                                  FROM               累計季報表 t
                                  WHERE           t .季 = a.[季] - 1 AND t .代號 = a.代號 AND t .年份 = a.年份) AS 單季營業外收入及支出, 
                            [稅前淨利_淨損] -
                                (SELECT          TOP 1 [稅前淨利_淨損]
                                  FROM               累計季報表 t
                                  WHERE           t .季 = a.[季] - 1 AND t .代號 = a.代號 AND t .年份 = a.年份) AS 單季稅前淨利_淨損, 
                            [所得稅費用_利益] -
                                (SELECT          TOP 1 [所得稅費用_利益]
                                  FROM               累計季報表 t
                                  WHERE           t .季 = a.[季] - 1 AND t .代號 = a.代號 AND t .年份 = a.年份) AS 單季所得稅費用_利益, 
                            [繼續營業單位本期淨利_淨損] -
                                (SELECT          TOP 1 [繼續營業單位本期淨利_淨損]
                                  FROM               累計季報表 t
                                  WHERE           t .季 = a.[季] - 1 AND t .代號 = a.代號 AND t .年份 = a.年份) AS 單季繼續營業單位本期淨利_淨損, 
                            [本期淨利_淨損] -
                                (SELECT          TOP 1 [本期淨利_淨損]
                                  FROM               累計季報表 t
                                  WHERE           t .季 = a.[季] - 1 AND t .代號 = a.代號 AND t .年份 = a.年份) AS 單季本期淨利_淨損, 
                            [其他綜合損益_淨額] -
                                (SELECT          TOP 1 [其他綜合損益_淨額]
                                  FROM               累計季報表 t
                                  WHERE           t .季 = a.[季] - 1 AND t .代號 = a.代號 AND t .年份 = a.年份) AS 單季其他綜合損益_淨額, 
                            [本期綜合損益總額] -
                                (SELECT          TOP 1 [本期綜合損益總額]
                                  FROM               累計季報表 t
                                  WHERE           t .季 = a.[季] - 1 AND t .代號 = a.代號 AND t .年份 = a.年份) AS 單季本期綜合損益總額, 
                            [基本每股盈餘_元] -
                                (SELECT          TOP 1 [基本每股盈餘_元]
                                  FROM               累計季報表 t
                                  WHERE           t .季 = a.[季] - 1 AND t .代號 = a.代號 AND t .年份 = a.年份) AS 單季基本每股盈餘_元
FROM              [Stock].[dbo].[累計季報表] a
WHERE          季 <> 1
UNION ALL
SELECT          年份, [季], [代號], [公司名稱], [營業收入] AS 累計營收, 營業收入 AS 單季營業收入, 營業成本 AS 單季營業成本, 
                            營業毛利_毛損 AS 單季營業毛利_毛損, 營業毛利_毛損淨額 AS 單季營業毛利_毛損淨額, 營業費用 AS 單季營業費用, 
                            營業利益_損失 AS 單季營業利益_損失, 營業外收入及支出 AS 單季營業外收入及支出, 
                            稅前淨利_淨損 AS 單季稅前淨利_淨損, 所得稅費用_利益 AS 單季所得稅費用_利益, 
                            繼續營業單位本期淨利_淨損 AS 單季繼續營業單位本期淨利_淨損, 本期淨利_淨損 AS 單季本期淨利_淨損, 
                            其他綜合損益_淨額 AS 單季其他綜合損益_淨額, 本期綜合損益總額 AS 單季本期綜合損益總額, 
                            基本每股盈餘_元 AS 單季基本每股盈餘_元
FROM              [Stock].[dbo].[累計季報表] a
WHERE          季 = 1

GO
/****** Object:  View [dbo].[單季財務比率表]    Script Date: 2017/8/21 下午 05:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[單季財務比率表]
AS
SELECT          年份, 季, 代號, 公司名稱, CASE WHEN [單季營業收入] = 0 THEN 0 ELSE (單季營業毛利_毛損) 
                            / [單季營業收入] * 100 END AS 毛利率, CASE WHEN [單季營業收入] = 0 THEN 0 ELSE (單季營業利益_損失) 
                            / [單季營業收入] * 100 END AS 營業利益率, CASE WHEN [單季營業收入] = 0 THEN 0 ELSE (單季稅前淨利_淨損) 
                            / [單季營業收入] * 100 END AS 稅前淨利率, CASE WHEN [單季營業收入] = 0 THEN 0 ELSE ([單季本期淨利_淨損]) 
                            / [單季營業收入] * 100 END AS 稅後淨利率, 單季基本每股盈餘_元
FROM              dbo.單季報表

GO
/****** Object:  StoredProcedure [dbo].[sp_month_report]    Script Date: 2017/8/21 下午 05:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_month_report]
	-- Add the parameters for the stored procedure here
	@myear int,
	@month int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--判斷月vs季 , join財務比率表用
declare @season int, @season2 int, @season3 int, @season4 int, @year1 int , @year2 int , @year3 int , @year4 int;

--取前兩季
--Q3 : 12~3 (11/14)
if @month =12 
	begin
		set @season = 3; set @season2 = 2; set @season3 = 1; set @season4 = 4; 
		set @year1 = @myear ; set @year2 = @myear ; set @year3 = @myear ; set @year4 = @myear - 1;
	end
if @month = 3 or @month =2 or @month =1 
	begin
		set @season = 3; set @season2 = 2; set @season3 = 1; set @season4 = 4; 
		set @year1 = @myear -1 ; set @year2 = @myear-1 ; set @year3 = @myear-1 ; set @year4 = @myear -2;
	end
--Q4 : 4~5 (3/31)
else if @month = 4 --or @month =5 
	begin
		set @season = 4; set @season2 = 3; set @season3 = 2; set @season4 = 1; 
		set @year1 = @myear - 1; set @year2 = @myear -1; set @year3 = @myear - 1; set @year4 = @myear -1;
	end
--Q2 : 9~11 (8/14)
else if @month = 9 or @month =10 or @month =11 
	begin
		set @season = 2; set @season2 = 1; set @season3 = 4; set @season4 = 3; 
		set @year1 = @myear; set @year2 = @myear; set @year3 = @myear - 1; set @year4 = @myear - 1;
	end
--Q1 : 6~8 (3/31)
else 
	begin
		set @season = 1; set @season2 = 4; set @season3 = 3; set @season4 = 2; 
		set @year1 = @myear ; set @year2 = @myear - 1;set @year3 = @myear -1 ; set @year4 = @myear - 1;
	end


--宣告年月
	DECLARE @year int; 
	set @year = @myear + 1911;

	declare @date varchar(20)
	set @date = convert(varchar(4), @year) + '-' + convert(varchar(2), @month) + '-1'
	declare @i int, @sql varchar(max)

	--sql組字串
	set @sql = 'SELECT   a.[年份],a.月份,c.[代號],a.[公司名稱],c.股本/100000000 as 股本億, c.產業 '
	set @sql += ', t.毛利率 as 毛利率Q' + convert(varchar(1),@season) + ', t1.毛利率 as 毛利率Q' + convert(varchar(1),@season2) +' '
	set @sql += ', t.營業利益率 as 營業利益率Q' + convert(varchar(1),@season) + ', t1.營業利益率 as 營業利益率Q' + convert(varchar(1),@season2) + ' '
	set @sql += ',a.年增率  as YOY_1,s1.年增率  as YOY_2,s2.年增率  as YOY_3  '
	set @sql += ',s3.年增率  as YOY_4,s4.年增率  as YOY_5,s5.年增率  as YOY_6  '
	set @sql += ',a.前期比較  as 累計YOY ,a.當月營收  as 當月營收, s1.當月營收 as 前一月營收,s2.當月營收 as 前二月營收 '
	set @sql += ',t.單季基本每股盈餘_元, t1.單季基本每股盈餘_元  as 前一季單季基本每股盈餘_元, t2.單季基本每股盈餘_元  as 前二季單季基本每股盈餘_元, t3.單季基本每股盈餘_元  as 前三季單季基本每股盈餘_元 '
	--set @sql += ',Q.單季營業利益_損失, Q_YOY.單季營業利益_損失 as yoy單季營業利益 , Q_QOQ.單季營業利益_損失  as qoq單季營業利益 '
	set @sql += ', case when Q_QOQ.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100   end as 營益率QOQ '
	set @sql += ', case when Q2_QOQ.[單季營業利益_損失] < 0 then (Q2.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100  * -1   else (Q2.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100   end as 營益率QOQ2 '
	set @sql += ', case when Q_YOY.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100   end as 營益率YOY '
	set @sql += ', case when Q2_YOY.[單季營業利益_損失] < 0 then (Q2.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100  * -1   else (Q2.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100   end as 營益率YOY2 '

	set @sql += 'FROM [Stock].[dbo].[營收表] a inner join 公司資訊 c on c.代號 = a.代號 '
	--inner join 近兩季季報
	set @sql += 'inner join [單季財務比率表] t on t.季 = ' + convert(varchar(1),@season) +' AND t .代號 = a.代號 AND t.年份 = ' + convert(varchar(3),@year1)
	set @sql += 'inner join [單季財務比率表] t1 on t1.季 = ' + convert(varchar(1),@season2) +' AND t1 .代號 = a.代號 AND t1.年份 = ' + convert(varchar(3),@year2)
	--inner join 營益率YOY QOQ
	set @sql += 'inner join [單季報表] Q on Q.季 = ' + convert(varchar(1),@season) +' AND Q .代號 = a.代號 AND Q.年份 = ' + convert(varchar(3),@year1)
	set @sql += 'inner join [單季報表] Q_YOY on Q_YOY.季 = ' + convert(varchar(1),@season) +' AND Q_YOY .代號 = a.代號 AND Q_YOY.年份 = ' + convert(varchar(3),@year1 - 1)
	set @sql += 'inner join [單季報表] Q_QOQ on Q_QOQ.季 = ' + convert(varchar(1),@season2) +' AND Q_QOQ .代號 = a.代號 AND Q_QOQ.年份 = ' + convert(varchar(3),@year2)
	--inner join 前一季營益率YOY QOQ
	set @sql += 'inner join [單季報表] Q2 on Q2.季 = ' + convert(varchar(1),@season2) +' AND Q2 .代號 = a.代號 AND Q2.年份 = ' + convert(varchar(3),@year2)
	set @sql += 'inner join [單季報表] Q2_YOY on Q2_YOY.季 = ' + convert(varchar(1),@season2) +' AND Q2_YOY .代號 = a.代號 AND Q2_YOY.年份 = ' + convert(varchar(3),@year2 - 1)
	set @sql += 'inner join [單季報表] Q2_QOQ on Q2_QOQ.季 = ' + convert(varchar(1),@season3) +' AND Q2_QOQ .代號 = a.代號 AND Q2_QOQ.年份 = ' + convert(varchar(3),@year3)
	--inner join 近四季報 EPS
	set @sql += 'inner join [單季財務比率表] t2 on t2.季 = ' + convert(varchar(1),@season3) +' AND t2 .代號 = a.代號 AND t2.年份 = ' + convert(varchar(3),@year3)
	set @sql += 'inner join [單季財務比率表] t3 on t3.季 = ' + convert(varchar(1),@season4) +' AND t3 .代號 = a.代號 AND t3.年份 = ' + convert(varchar(3),@year4)
	--left join 近5個月營收
	set @i = 1
	while (@i<=5)
	begin
	   set @sql += ' left join 營收表 s' + convert(varchar(1), @i) + ' on s' + + convert(varchar(1), @i) + + '.月份 =' + convert(varchar(2), MONTH(DATEADD(MONTH,- @i, @date))) + ' AND s' + convert(varchar(1), @i) + '.代號 = a.代號 AND s' + convert(varchar(1), @i) + '.年份 = ' + convert(varchar(3), Year(DATEADD(MONTH,- @i, @date)) - 1911) 
	   set @i = @i + 1
	end

	--篩選,排序
	set @sql += ' WHERE a.月份 =' + convert( varchar(2), @month) + ' and a.年份 = ' + convert(varchar(4), @myear)
	set @sql += ' ORDER BY 代號 '

	--print @sql
	print @sql
	execute(@sql);
END

GO
/****** Object:  StoredProcedure [dbo].[sp_season_report_new]    Script Date: 2017/8/21 下午 05:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_season_report_new]
	-- Add the parameters for the stored procedure here
	@year int,
	@season int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @season = 4
		--第四季開始
		SELECT c.[代號]
			   ,a.[公司名稱]
			  ,c.股本/100000000 as 股本億
			  ,c.產業
			  ,'' as 便宜
			  ,'' as eps大爆發
			  ,'' as eps成長
			  ,'' as 營益yoy成長
			  ,'' as 營收yoy成長
			  ,'' as 轉機股
			  ,'' as 評語
			  ,'' as 最新價
			  ,'' as 成長合理價
			  ,'' as 成長率
			  ,r.基本每股盈餘_元 as 預估EPS
			  ,a.單季基本每股盈餘_元
			  ,r.基本每股盈餘_元
			  ,r4.基本每股盈餘_元 as 去年eps
			  ,ryoy.基本每股盈餘_元 as 去年同期累計eps
			  ,(select 單季基本每股盈餘_元 from [單季報表] u4 where u4.代號 = a.代號 and u4.年份 = @year-1 and u4.季 = 4) as 去年Q4_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u3 where u3.代號 = a.代號 and u3.年份 = @year-1 and u3.季 = 3) as 去年Q3_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u2 where u2.代號 = a.代號 and u2.年份 = @year-1 and u2.季 = 2) as 去年Q2_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u1 where u1.代號 = a.代號 and u1.年份 = @year-1 and u1.季 = 1) as 去年Q1_EPS
			  	,a.營業利益率
			   ,t.營業利益率  as 前一季營業利益率
			   , case when  Q_YOY.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100   end as 營益率YOY 
			   	, case when  Q_QOQ.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100   end as 營益率QOQ 
				, case when  Q2_YOY.[單季營業利益_損失] < 0 then (Q_QOQ.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100  * -1   else (Q_QOQ.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100   end as 上季營益率YOY
				, case when  Q2_QOQ.[單季營業利益_損失] < 0 then (Q_QOQ.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100  * -1   else (Q_QOQ.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100   end as 上季營益率QOQ
			  ,a.[毛利率]
			  ,t.毛利率  as 前一季毛利率
			   ,s.年增率  as YOY_7
			  ,s1.年增率  as YOY_6
			  ,s2.年增率  as YOY_5
			  ,s.前期比較 as 累計YOY
			  , cast( b.[負債總額] as float)/b.[資產總額] * 100.0 as 負債比
			  ,b.[每股參考淨值]
			  ,'' as 股價淨值比
		  FROM [Stock].[dbo].[單季財務比率表] a
		  inner join 公司資訊 c on c.代號 = a.代號
			inner join 累計季報表 r on r.季 = a.[季]  AND r .代號 = a.代號 AND r.年份 = a.年份
			inner join 累計季報表 ryoy on ryoy.季 = a.[季]  AND ryoy.代號 = a.代號 AND ryoy.年份 = a.年份 - 1
		  inner join 累計季報表 r4 on r4.季 = 4  AND r4.代號 = a.代號 AND r4.年份 = a.年份 - 1 --去年第四季
		  inner join [單季財務比率表] t on t.季 = a.[季] - 1 AND t .代號 = a.代號 AND t.年份 = a.年份
		  --inner join [單季財務比率表] t2 on t2.季 = a.[季] - 2 AND t2 .代號 = a.代號 AND t2.年份 = a.年份
		  --inner join [單季財務比率表] t3 on t3.季 = a.[季] - 3 AND t3.代號 = a.代號 AND t3.年份 = a.年份
		  inner join [單季報表] Q on Q.季 = @season AND Q .代號 = a.代號 AND Q.年份 = @year
		inner join [單季報表] Q_YOY on Q_YOY.季 = @season AND Q_YOY .代號 = a.代號 AND Q_YOY.年份 =@year - 1
		inner join [單季報表] Q_QOQ on Q_QOQ.季 = @season -1 AND Q_QOQ .代號 = a.代號 AND Q_QOQ.年份 = @year
		inner join [單季報表] Q2_YOY on Q2_YOY.季 = @season -1 AND Q2_YOY .代號 = a.代號 AND Q2_YOY.年份 =@year - 1
		inner join [單季報表] Q2_QOQ on Q2_QOQ.季 = @season -2 AND Q2_QOQ .代號 = a.代號 AND Q2_QOQ.年份 = @year
		  	   left join 營收表 s on s.月份 = 2 AND s .代號 = a.代號 AND s.年份 = a.年份 + 1
		   left join 營收表 s1 on s1.月份 = 1  AND s1.代號 = a.代號 AND s1.年份 = a.年份 + 1
		   left join 營收表 s2 on s2.月份 = 12 AND s2.代號 = a.代號 AND s2.年份 = a.年份
		   left join 資產負債表 b on b.季 = @season AND b.代號 = a.代號 AND b.年份 = @year
		   -- left join 營收表 s3 on s3.月份 = 11  AND s3.代號 = a.代號 AND s3.年份 = a.年份
		   --left join 營收表 s4 on s4.月份 = 10 AND s4.代號 = a.代號 AND s4.年份 = a.年份
		  WHERE a.季 = @season and a.年份 = @year 
		  ORDER BY 代號
		  

	if @season = 3
		--第三季開始
		SELECT c.[代號]
			   ,a.[公司名稱]
			  ,c.股本/100000000 as 股本億
			  ,c.產業
			  ,'' as 便宜
			  ,'' as eps大爆發
			  ,'' as eps成長
			  ,'' as 營益yoy成長
			  ,'' as 營收yoy成長
			  ,'' as 轉機股
			  ,'' as 評語
			  ,'' as 最新價
			  ,'' as 成長合理價
			  ,'' as 成長率
			  ,r.基本每股盈餘_元 * 4 / 3.0 as 預估EPS
			  ,a.單季基本每股盈餘_元
			  ,r.基本每股盈餘_元
			  ,r4.基本每股盈餘_元 as 去年eps
			    ,ryoy.基本每股盈餘_元 as 去年同期累計eps
			  ,(select 單季基本每股盈餘_元 from [單季報表] u4 where u4.代號 = a.代號 and u4.年份 = @year-1 and u4.季 = 4) as 去年Q4_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u3 where u3.代號 = a.代號 and u3.年份 = @year-1 and u3.季 = 3) as 去年Q3_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u2 where u2.代號 = a.代號 and u2.年份 = @year-1 and u2.季 = 2) as 去年Q2_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u1 where u1.代號 = a.代號 and u1.年份 = @year-1 and u1.季 = 1) as 去年Q1_EPS
			  	,a.營業利益率
			   ,t.營業利益率  as 前一季營業利益率
			   , case when  Q_YOY.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100   end as 營益率YOY 
			   	, case when  Q_QOQ.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100   end as 營益率QOQ 
				, case when  Q2_YOY.[單季營業利益_損失] < 0 then (Q_QOQ.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100  * -1   else (Q_QOQ.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100   end as 上季營益率YOY
				, case when  Q2_QOQ.[單季營業利益_損失] < 0 then (Q_QOQ.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100  * -1   else (Q_QOQ.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100   end as 上季營益率QOQ
			  ,a.[毛利率]
			  ,t.毛利率  as 前一季毛利率
			   ,s.年增率  as YOY_7
			  ,s1.年增率  as YOY_6
			  ,s2.年增率  as YOY_5
			  ,s.前期比較 as 累計YOY
			, cast( b.[負債總額] as float)/b.[資產總額] * 100.0 as 負債比
			  ,b.[每股參考淨值]
			  ,'' as 股價淨值比
		  FROM [Stock].[dbo].[單季財務比率表] a
		  inner join 公司資訊 c on c.代號 = a.代號
		    inner join 累計季報表 r on r.季 = a.[季]  AND r .代號 = a.代號 AND r.年份 = a.年份
			inner join 累計季報表 ryoy on ryoy.季 = a.[季]  AND ryoy.代號 = a.代號 AND ryoy.年份 = a.年份 - 1
		  inner join 累計季報表 r4 on r4.季 = 4  AND r4.代號 = a.代號 AND r4.年份 = a.年份 - 1 --去年第四季
		  inner join [單季財務比率表] t on t.季 = a.[季] - 1 AND t .代號 = a.代號 AND t.年份 = a.年份
		  --inner join [單季財務比率表] t2 on t2.季 = a.[季] - 2 AND t2 .代號 = a.代號 AND t2.年份 = a.年份
		  --inner join [單季財務比率表] t3 on t3.季 = a.[季] + 1 AND t3.代號 = a.代號 AND t3.年份= a.年份 -1 
		  inner join [單季報表] Q on Q.季 = @season AND Q .代號 = a.代號 AND Q.年份 = @year
		inner join [單季報表] Q_YOY on Q_YOY.季 = @season AND Q_YOY .代號 = a.代號 AND Q_YOY.年份 =@year - 1
		inner join [單季報表] Q_QOQ on Q_QOQ.季 = @season -1 AND Q_QOQ .代號 = a.代號 AND Q_QOQ.年份 = @year
		inner join [單季報表] Q2_YOY on Q2_YOY.季 = @season -1 AND Q2_YOY .代號 = a.代號 AND Q2_YOY.年份 =@year - 1
		inner join [單季報表] Q2_QOQ on Q2_QOQ.季 = @season -2 AND Q2_QOQ .代號 = a.代號 AND Q2_QOQ.年份 = @year
		  	   left join 營收表 s on s.月份 = 11 AND s .代號 = a.代號 AND s.年份 = a.年份 
		   left join 營收表 s1 on s1.月份 = 10  AND s1.代號 = a.代號 AND s1.年份 = a.年份 
		   left join 營收表 s2 on s2.月份 = 9 AND s2.代號 = a.代號 AND s2.年份 = a.年份
		   left join 資產負債表 b on b.季 = @season AND b.代號 = a.代號 AND b.年份 = @year
		   -- left join 營收表 s3 on s3.月份 = 8  AND s3.代號 = a.代號 AND s3.年份 = a.年份
		   --left join 營收表 s4 on s4.月份 = 7 AND s4.代號 = a.代號 AND s4.年份 = a.年份
		   WHERE a.季 = @season and a.年份 = @year
		  order by 代號
	if @season = 2
		--第二季開始
		SELECT c.[代號]
			   ,a.[公司名稱]
			  ,c.股本/100000000 as 股本億
			  ,c.產業
			  ,'' as 便宜
			  ,'' as eps大爆發
			  ,'' as eps成長
			  ,'' as 營益yoy成長
			  ,'' as 營收yoy成長
			  ,'' as 轉機股
			  ,'' as 評語
			  ,'' as 最新價
			  ,'' as 成長合理價
			  ,'' as 成長率
			  ,r.基本每股盈餘_元 * 2.0 as 預估EPS
			  ,a.單季基本每股盈餘_元
			  ,r.基本每股盈餘_元
			  ,r4.基本每股盈餘_元 as 去年eps
			    ,ryoy.基本每股盈餘_元 as 去年同期累計eps
			  ,(select 單季基本每股盈餘_元 from [單季報表] u4 where u4.代號 = a.代號 and u4.年份 = @year-1 and u4.季 = 4) as 去年Q4_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u3 where u3.代號 = a.代號 and u3.年份 = @year-1 and u3.季 = 3) as 去年Q3_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u2 where u2.代號 = a.代號 and u2.年份 = @year-1 and u2.季 = 2) as 去年Q2_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u1 where u1.代號 = a.代號 and u1.年份 = @year-1 and u1.季 = 1) as 去年Q1_EPS
			  	,a.營業利益率
			   ,t.營業利益率  as 前一季營業利益率
			   , case when  Q_YOY.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100   end as 營益率YOY 
			   	, case when  Q_QOQ.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100   end as 營益率QOQ 
				, case when  Q2_YOY.[單季營業利益_損失] < 0 then (Q_QOQ.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100  * -1   else (Q_QOQ.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100   end as 上季營益率YOY
				, case when  Q2_QOQ.[單季營業利益_損失] < 0 then (Q_QOQ.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100  * -1   else (Q_QOQ.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100   end as 上季營益率QOQ
			  ,a.[毛利率]
			  ,t.毛利率  as 前一季毛利率
			   ,s.年增率  as YOY_7
			  ,s1.年增率  as YOY_6
			  ,s2.年增率  as YOY_5
			  ,s.前期比較 as 累計YOY
			  , cast( b.[負債總額] as float)/b.[資產總額] * 100.0 as 負債比
			  ,b.[每股參考淨值]
			  ,'' as 股價淨值比
		  FROM [Stock].[dbo].[單季財務比率表] a
		  inner join 公司資訊 c on c.代號 = a.代號
		  inner join 累計季報表 r on r.季 = a.[季]  AND r .代號 = a.代號 AND r.年份 = a.年份
		  inner join 累計季報表 ryoy on ryoy.季 = a.[季]  AND ryoy.代號 = a.代號 AND ryoy.年份 = a.年份 - 1
		  inner join 累計季報表 r4 on r4.季 = 4  AND r4.代號 = a.代號 AND r4.年份 = a.年份 - 1 --去年第四季
		  inner join [單季財務比率表] t on t.季 = a.[季] - 1 AND t .代號 = a.代號 AND t.年份 = a.年份
		  inner join [單季報表] Q on Q.季 = @season AND Q .代號 = a.代號 AND Q.年份 = @year
			inner join [單季報表] Q_YOY on Q_YOY.季 = @season AND Q_YOY .代號 = a.代號 AND Q_YOY.年份 =@year - 1
			inner join [單季報表] Q_QOQ on Q_QOQ.季 = @season -1 AND Q_QOQ .代號 = a.代號 AND Q_QOQ.年份 = @year
			inner join [單季報表] Q2_YOY on Q2_YOY.季 = @season -1 AND Q2_YOY .代號 = a.代號 AND Q2_YOY.年份 =@year - 1
			inner join [單季報表] Q2_QOQ on Q2_QOQ.季 = @season +2 AND Q2_QOQ .代號 = a.代號 AND Q2_QOQ.年份 = @year- 1
		  	   left join 營收表 s on s.月份 = 7 AND s .代號 = a.代號 AND s.年份 = a.年份 
		   left join 營收表 s1 on s1.月份 = 6  AND s1.代號 = a.代號 AND s1.年份 = a.年份 
		   left join 營收表 s2 on s2.月份 = 5 AND s2.代號 = a.代號 AND s2.年份 = a.年份
		   left join 資產負債表 b on b.季 = @season AND b.代號 = a.代號 AND b.年份 = @year
		 WHERE a.季 = @season and a.年份 = @year
		  order by a.代號
	if @season = 1
		--第一季開始
 		SELECT c.[代號]
			   ,a.[公司名稱]
			  ,c.股本/100000000 as 股本億
			  ,c.產業
			  ,'' as 便宜
			  ,'' as eps大爆發
			  ,'' as eps成長
			  ,'' as 營益yoy成長
			  ,'' as 營收yoy成長
			  ,'' as 轉機股
			  ,'' as 評語
			  ,'' as 最新價
			  ,'' as 成長合理價
			  ,'' as 成長率
			  ,r.基本每股盈餘_元 * 4 as 預估EPS
			  ,a.單季基本每股盈餘_元
			  ,r.基本每股盈餘_元
			  ,r4.基本每股盈餘_元 as 去年eps
			    ,ryoy.基本每股盈餘_元 as 去年同期累計eps
			  ,(select 單季基本每股盈餘_元 from [單季報表] u4 where u4.代號 = a.代號 and u4.年份 = @year-1 and u4.季 = 4) as 去年Q4_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u3 where u3.代號 = a.代號 and u3.年份 = @year-1 and u3.季 = 3) as 去年Q3_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u2 where u2.代號 = a.代號 and u2.年份 = @year-1 and u2.季 = 2) as 去年Q2_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u1 where u1.代號 = a.代號 and u1.年份 = @year-1 and u1.季 = 1) as 去年Q1_EPS
			  	,a.營業利益率
			   ,t.營業利益率  as 前一季營業利益率
			   , case when  Q_YOY.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100   end as 營益率YOY 
			   	, case when  Q_QOQ.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100   end as 營益率QOQ 
				, case when  Q2_YOY.[單季營業利益_損失] < 0 then (Q_QOQ.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100  * -1   else (Q_QOQ.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100   end as 上季營益率YOY
				, case when  Q2_QOQ.[單季營業利益_損失] < 0 then (Q_QOQ.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100  * -1   else (Q_QOQ.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100   end as 上季營益率QOQ
			  ,a.[毛利率]
			  ,t.毛利率  as 前一季毛利率
			   ,s.年增率  as YOY_7
			  ,s1.年增率  as YOY_6
			  ,s2.年增率  as YOY_5
			  ,s.前期比較 as 累計YOY
			  , cast( b.[負債總額] as float)/b.[資產總額] * 100.0 as 負債比
			  ,b.[每股參考淨值]
			  ,'' as 股價淨值比
  FROM [Stock].[dbo].[單季財務比率表] a
  inner join 公司資訊 c on c.代號 = a.代號
   inner join 累計季報表 r on r.季 = a.[季]  AND r .代號 = a.代號 AND r.年份 = a.年份
   inner join 累計季報表 ryoy on ryoy.季 = a.[季]  AND ryoy.代號 = a.代號 AND ryoy.年份 = a.年份 - 1
	inner join 累計季報表 r4 on r4.季 = 4  AND r4.代號 = a.代號 AND r4.年份 = a.年份 - 1 --去年第四季
  inner join [單季財務比率表] t on t.季 = a.[季] +3 AND t .代號 = a.代號 AND t.年份 = a.年份-1
  --inner join [單季財務比率表] t2 on t2.季 = a.[季] +2 AND t2 .代號 = a.代號 AND t2.年份 = a.年份-1
  --inner join [單季財務比率表] t3 on t3.季 = a.[季] + 1 AND t3.代號 = a.代號 AND t3.年份= a.年份 -1 
  inner join [單季報表] Q on Q.季 = @season AND Q .代號 = a.代號 AND Q.年份 = @year
		inner join [單季報表] Q_YOY on Q_YOY.季 = @season AND Q_YOY .代號 = a.代號 AND Q_YOY.年份 =@year - 1
		inner join [單季報表] Q_QOQ on Q_QOQ.季 = @season +3 AND Q_QOQ .代號 = a.代號 AND Q_QOQ.年份 = @year -1
		inner join [單季報表] Q2_YOY on Q2_YOY.季 = @season +3 AND Q2_YOY .代號 = a.代號 AND Q2_YOY.年份 =@year - 2
		inner join [單季報表] Q2_QOQ on Q2_QOQ.季 = @season +2 AND Q2_QOQ .代號 = a.代號 AND Q2_QOQ.年份 = @year -1

  	   left join 營收表 s on s.月份 = 5 AND s .代號 = a.代號 AND s.年份 = a.年份 
		   left join 營收表 s1 on s1.月份 = 4  AND s1.代號 = a.代號 AND s1.年份 = a.年份 
		   left join 營收表 s2 on s2.月份 = 3 AND s2.代號 = a.代號 AND s2.年份 = a.年份
		   left join 資產負債表 b on b.季 = @season AND b.代號 = a.代號 AND b.年份 = @year
		   -- left join 營收表 s3 on s3.月份 = 5  AND s3.代號 = a.代號 AND s3.年份 = a.年份
		   --left join 營收表 s4 on s4.月份 = 1 AND s4.代號 = a.代號 AND s4.年份 = a.年份
  	 WHERE a.季 = @season and a.年份 = @year
  order by 代號
END

GO
/****** Object:  StoredProcedure [dbo].[sp_season_report2]    Script Date: 2017/8/21 下午 05:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	不受限任何欄位用的excel
-- =============================================
CREATE PROCEDURE  [dbo].[sp_season_report2]
	-- Add the parameters for the stored procedure here
	@year int,
	@season int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @season = 4
		--第四季開始
		SELECT TOP 11000 a.[年份]
			  ,a.[季]
			  ,c.[代號]
			  ,a.[公司名稱]
			  ,c.股本/100000000 as 股本億
			  ,c.產業
			  ,a.[毛利率]
			  ,t.毛利率  as 前一季毛利率
			  ,t2.毛利率  as 前二季毛利率
			  ,t3.毛利率  as 前三季毛利率
			  ,a.營業利益率
			   ,t.營業利益率  as 前一季營業利益率
			  ,t2.營業利益率  as 前二季營業利益率
			  ,t3.營業利益率  as 前三季營業利益率
			  ,(select 單季基本每股盈餘_元 from [單季報表] u4 where u4.代號 = a.代號 and u4.年份 = @year-1 and u4.季 = 4) as 去年Q4_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u3 where u3.代號 = a.代號 and u3.年份 = @year-1 and u3.季 = 3) as 去年Q3_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u2 where u2.代號 = a.代號 and u2.年份 = @year-1 and u2.季 = 2) as 去年Q2_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u1 where u1.代號 = a.代號 and u1.年份 = @year-1 and u1.季 = 1) as 去年Q1_EPS
			  ,a.[稅前淨利率]
			  ,a.[稅後淨利率]
			  ,a.單季基本每股盈餘_元
			   ,t.單季基本每股盈餘_元  as 前一季單季基本每股盈餘_元
			  ,t2.單季基本每股盈餘_元  as 前二季單季基本每股盈餘_元
			  ,t3.單季基本每股盈餘_元  as 前三季單季基本每股盈餘_元
			    ,s.年增率  as YOY_2
			  ,s1.年增率  as YOY_1
			  ,s2.年增率  as YOY_12
			   ,s3.年增率  as YOY_11
			  ,s4.年增率  as YOY_10
			  ,s.前期比較 as 累計YOY
			  	, case when  Q_QOQ.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100   end as 營益率QOQ 
				, case when  Q2_QOQ.[單季營業利益_損失] < 0 then (Q_QOQ.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100  * -1   else (Q_QOQ.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100   end as 營益率QOQ2
				, case when  Q_YOY.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100   end as 營益率YOY 
				, case when  Q2_YOY.[單季營業利益_損失] < 0 then (Q_QOQ.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100  * -1   else (Q_QOQ.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100   end as 營益率YOY2 

		  FROM [Stock].[dbo].[單季財務比率表] a
		  inner join 公司資訊 c on c.代號 = a.代號
		  inner join [單季財務比率表] t on t.季 = a.[季] - 1 AND t .代號 = a.代號 AND t.年份 = a.年份
		  inner join [單季財務比率表] t2 on t2.季 = a.[季] - 2 AND t2 .代號 = a.代號 AND t2.年份 = a.年份
		  inner join [單季財務比率表] t3 on t3.季 = a.[季] - 3 AND t3.代號 = a.代號 AND t3.年份 = a.年份
		  inner join [單季報表] Q on Q.季 = @season AND Q .代號 = a.代號 AND Q.年份 = @year
		inner join [單季報表] Q_YOY on Q_YOY.季 = @season AND Q_YOY .代號 = a.代號 AND Q_YOY.年份 =@year - 1
		inner join [單季報表] Q_QOQ on Q_QOQ.季 = @season -1 AND Q_QOQ .代號 = a.代號 AND Q_QOQ.年份 = @year
		inner join [單季報表] Q2_YOY on Q2_YOY.季 = @season -1 AND Q2_YOY .代號 = a.代號 AND Q2_YOY.年份 =@year - 1
		inner join [單季報表] Q2_QOQ on Q2_QOQ.季 = @season -2 AND Q2_QOQ .代號 = a.代號 AND Q2_QOQ.年份 = @year
		  	   left join 營收表 s on s.月份 = 2 AND s .代號 = a.代號 AND s.年份 = a.年份 + 1
		   left join 營收表 s1 on s1.月份 = 1  AND s1.代號 = a.代號 AND s1.年份 = a.年份 + 1
		   left join 營收表 s2 on s2.月份 = 12 AND s2.代號 = a.代號 AND s2.年份 = a.年份
		    left join 營收表 s3 on s3.月份 = 11  AND s3.代號 = a.代號 AND s3.年份 = a.年份
		   left join 營收表 s4 on s4.月份 = 10 AND s4.代號 = a.代號 AND s4.年份 = a.年份
		  WHERE a.季 = @season and a.年份 = @year 
		  ORDER BY 代號
		  

	if @season = 3
		--第三季開始
		SELECT a.[年份]
			  ,a.[季]
			  ,c.[代號]
			   ,a.[公司名稱]
			  ,c.股本/100000000 as 股本億
			  ,c.產業
			  ,a.[毛利率]
			  ,t.毛利率  as 前一季毛利率
			  ,t2.毛利率  as 前二季毛利率
			  ,t3.毛利率  as 前三季毛利率
      			  ,a.營業利益率
			   ,t.營業利益率  as 前一季營業利益率
			  ,t2.營業利益率  as 前二季營業利益率
			  ,t3.營業利益率  as 前三季營業利益率
			  ,a.[稅前淨利率]
			  ,a.[稅後淨利率]
			  ,a.單季基本每股盈餘_元
			   ,t.單季基本每股盈餘_元  as 前一季單季基本每股盈餘_元
			  ,t2.單季基本每股盈餘_元  as 前二季單季基本每股盈餘_元
			  ,t3.單季基本每股盈餘_元  as 前三季單季基本每股盈餘_元
			  ,(select 單季基本每股盈餘_元 from [單季報表] u4 where u4.代號 = a.代號 and u4.年份 = @year-1 and u4.季 = 4) as 去年Q4_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u3 where u3.代號 = a.代號 and u3.年份 = @year-1 and u3.季 = 3) as 去年Q3_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u2 where u2.代號 = a.代號 and u2.年份 = @year-1 and u2.季 = 2) as 去年Q2_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u1 where u1.代號 = a.代號 and u1.年份 = @year-1 and u1.季 = 1) as 去年Q1_EPS

			      ,s.年增率  as YOY_11
			  ,s1.年增率  as YOY_10
			  ,s2.年增率  as YOY_9
			   ,s3.年增率  as YOY_8
			  ,s4.年增率  as YOY_7
			  ,s.前期比較 as 累計YOY
			  , case when  Q_QOQ.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100   end as 營益率QOQ 
				, case when  Q2_QOQ.[單季營業利益_損失] < 0 then (Q_QOQ.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100  * -1   else (Q_QOQ.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100   end as 營益率QOQ2
				, case when  Q_YOY.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100   end as 營益率YOY 
				, case when  Q2_YOY.[單季營業利益_損失] < 0 then (Q_QOQ.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100  * -1   else (Q_QOQ.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100   end as 營益率YOY2 

		  FROM [Stock].[dbo].[單季財務比率表] a
		  inner join 公司資訊 c on c.代號 = a.代號
		  inner join [單季財務比率表] t on t.季 = a.[季] - 1 AND t .代號 = a.代號 AND t.年份 = a.年份
		  inner join [單季財務比率表] t2 on t2.季 = a.[季] - 2 AND t2 .代號 = a.代號 AND t2.年份 = a.年份
		  inner join [單季財務比率表] t3 on t3.季 = a.[季] + 1 AND t3.代號 = a.代號 AND t3.年份= a.年份 -1 
		  inner join [單季報表] Q on Q.季 = @season AND Q .代號 = a.代號 AND Q.年份 = @year
		inner join [單季報表] Q_YOY on Q_YOY.季 = @season AND Q_YOY .代號 = a.代號 AND Q_YOY.年份 =@year - 1
		inner join [單季報表] Q_QOQ on Q_QOQ.季 = @season -1 AND Q_QOQ .代號 = a.代號 AND Q_QOQ.年份 = @year
		inner join [單季報表] Q2_YOY on Q2_YOY.季 = @season -1 AND Q2_YOY .代號 = a.代號 AND Q2_YOY.年份 =@year - 1
		inner join [單季報表] Q2_QOQ on Q2_QOQ.季 = @season -2 AND Q2_QOQ .代號 = a.代號 AND Q2_QOQ.年份 = @year
		  	   left join 營收表 s on s.月份 = 11 AND s .代號 = a.代號 AND s.年份 = a.年份 
		   left join 營收表 s1 on s1.月份 = 10  AND s1.代號 = a.代號 AND s1.年份 = a.年份 
		   left join 營收表 s2 on s2.月份 = 9 AND s2.代號 = a.代號 AND s2.年份 = a.年份
		    left join 營收表 s3 on s3.月份 = 8  AND s3.代號 = a.代號 AND s3.年份 = a.年份
		   left join 營收表 s4 on s4.月份 = 7 AND s4.代號 = a.代號 AND s4.年份 = a.年份
		   WHERE a.季 = @season and a.年份 = @year
		  order by 代號
	if @season = 2
		--第二季開始
		SELECT a.[年份]
			  ,a.[季]
			      ,c.[代號]
			   ,a.[公司名稱]
			  ,c.股本/100000000 as 股本億
			  ,c.產業
			  ,a.[毛利率]
			  ,t.毛利率  as 前一季毛利率
			  ,t2.毛利率  as 前二季毛利率
			  ,t3.毛利率  as 前三季毛利率
    			,a.營業利益率
			   ,t.營業利益率  as 前一季營業利益率
			  ,t2.營業利益率  as 前二季營業利益率
			  ,t3.營業利益率  as 前三季營業利益率
			  ,a.[稅前淨利率]
			  ,a.[稅後淨利率]
			  ,a.單季基本每股盈餘_元
			   ,t.單季基本每股盈餘_元  as 前一季單季基本每股盈餘_元
			  ,t2.單季基本每股盈餘_元  as 前二季單季基本每股盈餘_元
			  ,t3.單季基本每股盈餘_元  as 前三季單季基本每股盈餘_元
			  ,(select 單季基本每股盈餘_元 from [單季報表] u4 where u4.代號 = a.代號 and u4.年份 = @year-1 and u4.季 = 4) as 去年Q4_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u3 where u3.代號 = a.代號 and u3.年份 = @year-1 and u3.季 = 3) as 去年Q3_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u2 where u2.代號 = a.代號 and u2.年份 = @year-1 and u2.季 = 2) as 去年Q2_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u1 where u1.代號 = a.代號 and u1.年份 = @year-1 and u1.季 = 1) as 去年Q1_EPS

			   ,s.年增率  as YOY_7
			  ,s1.年增率  as YOY_6
			  ,s2.年增率  as YOY_5
			   ,s3.年增率  as YOY_4
			  ,s4.年增率  as YOY_3
			  ,s.前期比較 as 累計YOY
			  	 , case when  Q_QOQ.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100   end as 營益率QOQ 
				, case when  Q2_QOQ.[單季營業利益_損失] < 0 then (Q_QOQ.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100  * -1   else (Q_QOQ.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100   end as 營益率QOQ2
				, case when  Q_YOY.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100   end as 營益率YOY 
				, case when  Q2_YOY.[單季營業利益_損失] < 0 then (Q_QOQ.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100  * -1   else (Q_QOQ.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100   end as 營益率YOY2 

		  FROM [Stock].[dbo].[單季財務比率表] a
		  inner join 公司資訊 c on c.代號 = a.代號
		  inner join [單季財務比率表] t on t.季 = a.[季] - 1 AND t .代號 = a.代號 AND t.年份 = a.年份
		  inner join [單季財務比率表] t2 on t2.季 = a.[季] + 2 AND t2 .代號 = a.代號 AND t2.年份 = a.年份 -1
		  inner join [單季財務比率表] t3 on t3.季 = a.[季] + 1 AND t3.代號 = a.代號 AND t3.年份= a.年份 -1 
		  inner join [單季報表] Q on Q.季 = @season AND Q .代號 = a.代號 AND Q.年份 = @year
		inner join [單季報表] Q_YOY on Q_YOY.季 = @season AND Q_YOY .代號 = a.代號 AND Q_YOY.年份 =@year - 1
		inner join [單季報表] Q_QOQ on Q_QOQ.季 = @season -1 AND Q_QOQ .代號 = a.代號 AND Q_QOQ.年份 = @year
		inner join [單季報表] Q2_YOY on Q2_YOY.季 = @season -1 AND Q2_YOY .代號 = a.代號 AND Q2_YOY.年份 =@year - 1
		inner join [單季報表] Q2_QOQ on Q2_QOQ.季 = @season +2 AND Q2_QOQ .代號 = a.代號 AND Q2_QOQ.年份 = @year- 1

		  	   left join 營收表 s on s.月份 = 7 AND s .代號 = a.代號 AND s.年份 = a.年份 
		   left join 營收表 s1 on s1.月份 = 6  AND s1.代號 = a.代號 AND s1.年份 = a.年份 
		   left join 營收表 s2 on s2.月份 = 5 AND s2.代號 = a.代號 AND s2.年份 = a.年份
		    left join 營收表 s3 on s3.月份 = 4  AND s3.代號 = a.代號 AND s3.年份 = a.年份
		   left join 營收表 s4 on s4.月份 = 3 AND s4.代號 = a.代號 AND s4.年份 = a.年份
		 WHERE a.季 = @season and a.年份 = @year
		  order by a.代號
	if @season = 1
		--第一季開始
SELECT a.[年份]
      ,a.[季]
      ,c.[代號]
	  ,a.[公司名稱]
			  ,c.股本/100000000 as 股本億
			  ,c.產業
      ,a.[毛利率]
	  ,t.毛利率  as 前一季毛利率
	  ,t2.毛利率  as 前二季毛利率
	  ,t3.毛利率  as 前三季毛利率
    	  ,a.營業利益率
	   ,t.營業利益率  as 前一季營業利益率
	  ,t2.營業利益率  as 前二季營業利益率
	  ,t3.營業利益率  as 前三季營業利益率
	  ,a.[稅前淨利率]
      ,a.[稅後淨利率]
	  ,a.單季基本每股盈餘_元
	   ,t.單季基本每股盈餘_元  as 前一季單季基本每股盈餘_元
	  ,t2.單季基本每股盈餘_元  as 前二季單季基本每股盈餘_元
	  ,t3.單季基本每股盈餘_元  as 前三季單季基本每股盈餘_元
			  ,(select 單季基本每股盈餘_元 from [單季報表] u4 where u4.代號 = a.代號 and u4.年份 = @year-1 and u4.季 = 4) as 去年Q4_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u3 where u3.代號 = a.代號 and u3.年份 = @year-1 and u3.季 = 3) as 去年Q3_EPS
			  ,(select 單季基本每股盈餘_元 from [單季報表] u2 where u2.代號 = a.代號 and u2.年份 = @year-1 and u2.季 = 2) as 去年Q2_EPS
	  		,(select 單季基本每股盈餘_元 from [單季報表] u1 where u1.代號 = a.代號 and u1.年份 = @year-1 and u1.季 = 1) as 去年Q1_EPS

	      ,s.年增率  as YOY_5
			  ,s1.年增率  as YOY_4
			  ,s2.年增率  as YOY_3
			   ,s3.年增率  as YOY_2
			  ,s4.年增率  as YOY_1
			  ,s.前期比較 as 累計YOY
			  	, case when  Q_QOQ.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_QOQ.[單季營業利益_損失])/Q_QOQ.[單季營業利益_損失] * 100   end as 營益率QOQ 
				, case when  Q2_QOQ.[單季營業利益_損失] < 0 then (Q_QOQ.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100  * -1   else (Q_QOQ.[單季營業利益_損失]-Q2_QOQ.[單季營業利益_損失])/Q2_QOQ.[單季營業利益_損失] * 100   end as 營益率QOQ2
				, case when  Q_YOY.[單季營業利益_損失] < 0 then (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100  * -1   else (Q.[單季營業利益_損失]-Q_YOY.[單季營業利益_損失])/Q_YOY.[單季營業利益_損失] * 100   end as 營益率YOY 
				, case when  Q2_YOY.[單季營業利益_損失] < 0 then (Q_QOQ.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100  * -1   else (Q_QOQ.[單季營業利益_損失]-Q2_YOY.[單季營業利益_損失])/Q2_YOY.[單季營業利益_損失] * 100   end as 營益率YOY2 

  FROM [Stock].[dbo].[單季財務比率表] a
  inner join 公司資訊 c on c.代號 = a.代號
  inner join [單季財務比率表] t on t.季 = a.[季] +3 AND t .代號 = a.代號 AND t.年份 = a.年份-1
  inner join [單季財務比率表] t2 on t2.季 = a.[季] +2 AND t2 .代號 = a.代號 AND t2.年份 = a.年份-1
  inner join [單季財務比率表] t3 on t3.季 = a.[季] + 1 AND t3.代號 = a.代號 AND t3.年份= a.年份 -1 
  inner join [單季報表] Q on Q.季 = @season AND Q .代號 = a.代號 AND Q.年份 = @year
		inner join [單季報表] Q_YOY on Q_YOY.季 = @season AND Q_YOY .代號 = a.代號 AND Q_YOY.年份 =@year - 1
		inner join [單季報表] Q_QOQ on Q_QOQ.季 = @season +3 AND Q_QOQ .代號 = a.代號 AND Q_QOQ.年份 = @year -1
		inner join [單季報表] Q2_YOY on Q2_YOY.季 = @season +3 AND Q2_YOY .代號 = a.代號 AND Q2_YOY.年份 =@year - 2
		inner join [單季報表] Q2_QOQ on Q2_QOQ.季 = @season +2 AND Q2_QOQ .代號 = a.代號 AND Q2_QOQ.年份 = @year -1

  	   left join 營收表 s on s.月份 = 5 AND s .代號 = a.代號 AND s.年份 = a.年份 
		   left join 營收表 s1 on s1.月份 = 4  AND s1.代號 = a.代號 AND s1.年份 = a.年份 
		   left join 營收表 s2 on s2.月份 = 3 AND s2.代號 = a.代號 AND s2.年份 = a.年份
		    left join 營收表 s3 on s3.月份 = 5  AND s3.代號 = a.代號 AND s3.年份 = a.年份
		   left join 營收表 s4 on s4.月份 = 1 AND s4.代號 = a.代號 AND s4.年份 = a.年份
  	 WHERE a.季 = @season and a.年份 = @year
  order by 代號
END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Chip"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'分散表'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'分散表'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'分散差距表'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'分散差距表'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "單季報表"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 300
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'單季財務比率表'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'單季財務比率表'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[14] 2[27] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'單季報表'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'單季報表'
GO
