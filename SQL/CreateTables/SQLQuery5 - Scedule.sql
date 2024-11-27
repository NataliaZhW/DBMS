USE Acadamy_318_SQL
GO

CREATE TABLE Schedule
(
	lesson_id		BIGINT				PRIMARY KEY		IDENTITY(1,1),
	[group]			INT				NOT NULL 
		CONSTRAINT FK_Schedule_Groups		FOREIGN KEY	REFERENCES Groups(group_id),
	discipline		SMALLINT		NOT NULL
		CONSTRAINT FK_Schedule_Discipline	FOREIGN KEY REFERENCES Disciplines(discipline_id),
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

	present		BIT		NOT NULL,
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

CREATE TABLE AssignedHomeWorks
(
	home_work_id	BIGINT	PRIMARY KEY IDENTITY(1,1),
	lesson			BIGINT	NOT NULL	CONSTRAINT FK_AHW_Schedule FOREIGN KEY REFERENCES Schedule(lesson_id),
	task			NVARCHAR(MAX) NOT NULL,
	deadline		DATE	NOT NULL	CONSTRAINT CK_Deadline
	CHECK(DATEDIFF(DAY, CONVERT(DATE, GETDATE()), deadline) >=3 AND DATEDIFF(DAY, CONVERT(DATE, GETDATE()),deadline) < 32)
);

CREATE TABLE CompleteHomeWorks
(
	student		INT			CONSTRAINT FK_CHW_Students	FOREIGN KEY REFERENCES Students(student_id),
	home_work	BIGINT		CONSTRAINT FK_CHW_AHW		FOREIGN KEY REFERENCES AssignedHomeWorks(home_work_id),
	PRIMARY KEY(student, home_work),
	report		NVARCHAR(MAX) NOT NULL,
	report_date	DATE NOT NULL,
	grade		TINYINT		CONSTRAINT CK_HW_Grade		CHECK(grade > 0 AND grade <= 12)
)