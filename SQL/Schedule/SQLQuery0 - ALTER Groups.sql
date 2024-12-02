USE PD_318_DML
GO

--ALTER TABLE Groups
--DROP CONSTRAINT FK_Groups_LearningForms
--DROP COLUMN learning_form;
--DROP COLUMN learning_days;

INSERT Groups(group_name, start_date, learning_time, direction)
VALUES ('PV_318', '2023-11-06','18:30',1)