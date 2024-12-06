USE PD_318_DML;
GO

CREATE TABLE DaysOFF
(
	day_off_id	INT PRIMARY KEY IDENTITY(1,1),
	[date]		DATE NOT NULL,
	holiday		SMALLINT CONSTRAINT FK_DaysOFF_Holidays FOREIGN KEY REFERENCES Holidays(holiday_id)
)