USE Acadamy_318_SQL
GO

CREATE TABLE Direction
(
direction_id	TINYINT			PRIMARY KEY,
direction_name	NVARCHAR(150)	NOT NULL
);

CREATE TABLE Groups
(
group_id		INT				PRIMARY KEY,
group_name	NVARCHAR(16)	NOT NULL,
direction		TINYINT			NOT NULL	
	CONSTRAINT FK_GroupsDirections FOREIGN KEY  REFERENCES Direction(direction_id)
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