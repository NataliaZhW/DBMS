USE Acadamy_318_SQL
GO

CREATE TABLE Teachers
(
teacher_id		INT				PRIMARY KEY		IDENTITY(1,1),
last_name		NVARCHAR(150)	NOT NULL,
first_name		NVARCHAR(150)	NOT NULL,
middle_name		NVARCHAR(150)	NULL,
birth_date		DATE			NOT NULL,
work_siense		DATE			NOT NULL
);