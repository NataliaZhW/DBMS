USE PD_318_DML;
GO

CREATE FUNCTION GetLastMonOfApril ( @year AS INT) RETURNS DATE
AS
BEGIN
	 DECLARE @date AS DATE = DATEFROMPARTS(@year, 04, 30); --EOMONTH
	 RETURN DATEADD(DAY, DATEPART(WEEKDAY, @date)*(-1)+1, @date);
	 --RETURN DATEADD(DAY, 1 - DATEPART(WEEKDAY, @date), @date);
END