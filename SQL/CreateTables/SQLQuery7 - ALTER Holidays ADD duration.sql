USE PD_318_DML;
GO

--ALTER TABLE Holidays ADD duration TINYINT
;

--UPDATE Holidays SET duration = 5 WHERE holiday_name LIKE N'%Пасха%'
UPDATE Holidays SET holiday_name = N'Новогодние каникулы' WHERE holiday_name LIKE N'%Новый%'
--UPDATE Holidays SET holiday_name = N'Новый год' WHERE holiday_name LIKE N'%Новогодние%'
--UPDATE Holidays SET holiday_name = N'Летние каникулы' WHERE holiday_name LIKE N'%Каникулы%'

 SELECT * FROM Holidays;
-- Holidays ADD 