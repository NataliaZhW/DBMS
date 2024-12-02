USE Acadamy_318_SQL;

INSERT TeacherDisciplinesRelation
		(teacher,	discipline)
VALUES
		--(1,			1),
		(2,			3),
		--(1,			4),
		(3,			5),
		--(1,			6),
		(2,			7),
		(5,			4),
		(2,			5),
		(6,			6),
		(3,			2);

SELECT * FROM TeacherDisciplinesRelation;