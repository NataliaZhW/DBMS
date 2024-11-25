CREATE DATABASE AcademySQL318_HW
ON
(
	NAME = AcademySQL318_HW,
	FILENAME = 'D:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AcademySQL318_HW.mdf',
	SIZE = 8 MB,
	MAXSIZE = 500 MB,
	FILEGROWTH = 8 MB
)
LOG ON
(
	NAME = AcademySQL318_HW_Log,
	FILENAME = 'D:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AcademySQL318_HW_log.ldf',
	SIZE = 8 MB,
	MAXSIZE = 500 MB,
	FILEGROWTH = 8 MB
)
GO
USE AcademySQL318_HW
GO

CREATE TABLE Directions
(
	direction_id	TINYINT			PRIMARY KEY,
	direction_name	NVARCHAR(150)	NOT NULL
);

CREATE TABLE Groups
(
	group_id		INT				PRIMARY KEY,
	group_name	NVARCHAR(16)	NOT NULL,
	direction		TINYINT			NOT NULL	
	CONSTRAINT FK_GroupsDirections FOREIGN KEY  REFERENCES Directions(direction_id)
);

CREATE TABLE Students
(
	student_id		INT				PRIMARY KEY		IDENTITY(1,1),
	last_name		NVARCHAR(150)	NOT NULL,
	first_name		NVARCHAR(150)	NOT NULL,
	middle_name		NVARCHAR(150)	NULL,
	birth_date		DATE			NOT NULL,
	[group]			INT				NOT NULL
		CONSTRAINT FK_StudentsGroups FOREIGN KEY  REFERENCES Groups(group_id)
);

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




CREATE TABLE Disciplines
(
	discipline_id		SMALLINT			PRIMARY KEY,
	discipline_name		NVARCHAR(256)		NOT NULL,
	number_of_lessons	SMALLINT			NOT NULL,
);

CREATE TABLE RequiredDisciplines
(
	discipline				SMALLINT,	
	required_discipline		SMALLINT,
		
	PRIMARY KEY(discipline, required_discipline),
	
	CONSTRAINT FK_RD_TargetDiscipline_To_Disciplines 
			FOREIGN KEY  (discipline)	REFERENCES Disciplines(discipline_id),
	CONSTRAINT FK_RD_RequiredDiscipline_To_Disciplines 
			FOREIGN KEY  (required_discipline)	REFERENCES Disciplines(discipline_id)
);

CREATE TABLE DependentDisciplines
(
	discipline				SMALLINT,	
	dependent_discipline	SMALLINT,
	
	PRIMARY KEY(discipline, dependent_discipline),
		
	CONSTRAINT FK_DD_TargetDiscipline_To_Disciplines 
			FOREIGN KEY  (discipline)	REFERENCES Disciplines(discipline_id),
	CONSTRAINT FK_DD_DependentDiscipline_To_Disciplines 
			FOREIGN KEY  (dependent_discipline)	REFERENCES Disciplines(discipline_id)
);

CREATE TABLE TeacherDisciplinesRelation
(
	teacher				INT,
	discipline			SMALLINT,

	PRIMARY KEY(teacher, discipline),	

	CONSTRAINT FK_TDR_Teacher		FOREIGN KEY  (teacher)		REFERENCES Teachers(teacher_id),
	CONSTRAINT FK_TDR_Discipline	FOREIGN KEY  (discipline)	REFERENCES Disciplines(discipline_id)	
);

CREATE TABLE DirectionDisciplinesRelation
(
	direction			TINYINT,
	discipline			SMALLINT,

	PRIMARY KEY(direction, discipline),	

	CONSTRAINT FK_DDR_Direction	FOREIGN KEY  (direction)	REFERENCES Directions(direction_id),
	CONSTRAINT FK_DDR_Discipline FOREIGN KEY  (discipline)	REFERENCES Disciplines(discipline_id)	
);

CREATE TABLE CompleteDisciplines
(
	[group]				INT,
	discipline			SMALLINT,

	PRIMARY KEY([group], discipline),	

	CONSTRAINT FK_CD_Teacher		FOREIGN KEY  ([group])		REFERENCES Groups(group_id),
	CONSTRAINT FK_CD_Discipline		FOREIGN KEY  (discipline)	REFERENCES Disciplines(discipline_id)	
);




CREATE TABLE Schedule
(
	lesson_id		BIGINT				PRIMARY KEY		IDENTITY(1,1),
	[date]			DATE			NOT NULL,
	[time]			TIME			NOT NULL,
	[group]			INT				NOT NULL,
	discipline		SMALLINT		NOT NULL,
	teacher			INT				NOT NULL,
	spent			BIT				NOT NULL,
	[subject]		NVARCHAR(256)	
);

CREATE TABLE Homeworks
(
	homework_id		BIGINT				PRIMARY KEY		IDENTITY(1,1),
	lesson			BIGINT		    NULL,
	task			NVARCHAR(MAX)	NULL,
	dedlate			DATE			NULL
);

CREATE TABLE Exams
(
	student			INT,
	lesson			BIGINT,
	grade			TINYINT,
	PRIMARY KEY(student, lesson),
);


--AttendentsAndGrades
--CompleteHomework