USE Acadamy_318_SQL;

SELECT 
		Directions.direction_name		AS N'����������� ��������',
		COUNT(Groups.group_id)			AS N'���������� �����'
FROM Directions, Groups--, Students
WHERE  Groups.direction = Directions.direction_id --AND [group] = Groups.group_id
GROUP BY direction_name
;

SELECT 
		Directions.direction_name		AS N'����������� ��������',
		--COUNT((Groups.direction = Directions.direction_id)=1) AS N'���������� �����',--��� ����� �������� ��������� ��������
		COUNT(Students.student_id)		AS N'���������� ���������'

FROM Directions, Students, Groups
WHERE  Groups.direction = Directions.direction_id AND [group] = Groups.group_id
GROUP BY direction_name
;