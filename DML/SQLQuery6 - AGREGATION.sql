USE Acadamy_318_SQL;

SELECT 
--COUNT(direction_id) AS N'����������'
		--group_name		AS N'������',
		Directions.direction_name		AS N'����������� ��������',
		COUNT(direction_id)OVER (PARTITION BY ) AS N'���������� �����', --AND
		COUNT(Students.student_id)OVER (PARTITION BY ) AS N'���������� ���������'

FROM Directions, Students, Groups-- --;
WHERE  Groups.direction = Directions.direction_id AND [group] = Groups.group_id
GROUP BY direction_name
;