USE Acadamy_318_SQL
GO

CREATE TABLE Schedule
(
	lesson_id		BIGINT				PRIMARY KEY		IDENTITY(1,1),
	[group]			INT				NOT NULL 
		CONSTRAINT FK_Scedule_Groups		FOREIGN KEY	REFERENCES Groups(group_id),
	discipline		SMALLINT		NOT NULL
		CONSTRAINT FK_Scedule_Discipline	FOREIGN KEY REFERENCES Disciplines(discipline_id),
	[date]			DATE			NOT NULL,
	[time]			TIME			NOT NULL,
	teacher			INT				NOT NULL
		CONSTRAINT FK_Scedule_Teachers		FOREIGN KEY  (teacher)		REFERENCES Teachers(teacher_id),
	[subject]		NVARCHAR(256),
	spent			BIT				NOT NULL
);

CREATE TABLE AttendanceAndGrades
(
	student			INT		CONSTRAINT FK_Grades_Students	FOREIGN KEY	REFERENCES Students(student_id),
	lesson			BIGINT	CONSTRAINT FK_Grades_Schedule	FOREIGN KEY	REFERENCES Schedule(lesson_id),
	
	PRIMARY KEY(student, lesson),	

	grade_1 TINYINT CONSTRAINT CK_Grade_1	CHECK (grade_1 >0 AND grade_1 <= 12),
	grade_2 TINYINT CONSTRAINT CK_Grade_2	CHECK (grade_2 >0 AND grade_2 <= 12)	
);

CREATE TABLE Exams
(
	student			INT   CONSTRAINT FK_Exams_Students	FOREIGN KEY	REFERENCES Students(student_id),
	lesson			BIGINT CONSTRAINT FK_Exams_Schedule	FOREIGN KEY	REFERENCES Schedule(lesson_id),
	grade			TINYINT CONSTRAINT CK_Exam_Grade	CHECK (grade >0 AND grade <= 12),
	PRIMARY KEY(student, lesson),
);

