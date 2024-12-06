USE PD_318_DML;
GO

--CREATE FUNCTION CountLessonsForGroup
ALTER FUNCTION CountLessonsForGroup
(
	@group_name			AS	NVARCHAR(16),
	@discipline_name	AS	NVARCHAR(150)
)
RETURNS INT
AS
BEGIN
	RETURN (
		SELECT
			COUNT(lesson_id)
		FROM Schedule
		WHERE [group] = (SELECT group_id FROM Groups WHERE group_name=@group_name)
		AND	discipline = (SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE @discipline_name)
			)
END