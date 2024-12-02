USE PD_318_DML;

SELECT 
[Дисциплина] = discipline_name,
[Количество преподавателей] = COUNT(teacher_id)
	--[Ф.И.О.] = FORMATMESSAGE('%s %s %s', last_name, first_name, ISNULL(middle_name,N'')),
	--[Дисциплина] = discipline_name
FROM Teachers, Disciplines, TeachersDisciplinesRelation
WHERE	teacher		= teacher_id 
	AND discipline	= discipline_id
GROUP BY discipline_name 
ORDER BY [Количество преподавателей] DESC
;