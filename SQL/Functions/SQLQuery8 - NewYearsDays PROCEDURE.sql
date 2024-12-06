USE PD_318_DML;
GO

CREATE PROCEDURE sp_NewYearsDaysFor 
@year AS INT
AS
BEGIN
	 DECLARE @start_date AS DATE = dbo.GetLastMonOfYear(@year-1);
	 DECLARE @date AS DATE = dbo.GetLastMonOfYear(@year-1);
	 DECLARE @number_of_days AS TINYINT = 14;
	 DECLARE @day AS TINYINT = 0;
	 DECLARE @holiday AS SMALLINT = (SELECT holiday_id FROM Holidays WHERE holiday_name = N'Каникулы');
	--WHILE (@day < @number_of_days)
	WHILE (DATEDIFF(DAY,@start_date, @date)<=14)
	BEGIN
	IF NOT EXISTS(SELECT day_off_id FROM DaysOFF WHERE [date]=@date)
	BEGIN
	INSERT DaysOFF([date], holiday)
				VALUES (@date, @holiday)
	END
	SET @date = DATEADD(DAY,1,@date)
	END
END