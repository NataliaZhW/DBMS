USE Acadamy_318_SQL;

SELECT 
--COUNT(direction_id) AS N'Количество'
		--group_name		AS N'Группа',
		Directions.direction_name		AS N'Направление обучения',
		COUNT(direction_id)OVER (PARTITION BY ) AS N'Количество групп', --AND
		COUNT(Students.student_id)OVER (PARTITION BY ) AS N'Количество студентов'

FROM Directions, Students, Groups-- --;
WHERE  Groups.direction = Directions.direction_id AND [group] = Groups.group_id
GROUP BY direction_name
;