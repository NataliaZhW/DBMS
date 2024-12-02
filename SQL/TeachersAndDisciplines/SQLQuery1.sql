USE PD_318_DML;

SELECT 
[����������] = discipline_name,
[���������� ��������������] = COUNT(teacher_id)
	--[�.�.�.] = FORMATMESSAGE('%s %s %s', last_name, first_name, ISNULL(middle_name,N'')),
	--[����������] = discipline_name
FROM Teachers, Disciplines, TeachersDisciplinesRelation
WHERE	teacher		= teacher_id 
	AND discipline	= discipline_id
GROUP BY discipline_name 
ORDER BY [���������� ��������������] DESC
;