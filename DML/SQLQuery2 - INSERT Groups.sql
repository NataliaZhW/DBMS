USE Acadamy_318_SQL;

INSERT Groups
	(group_id, group_name, direction)
VALUES
	(1,			N'PU_211', 1),
	(2,			N'PV_211', 1),
	(3,			N'PD_212', 1),
	(4,			N'PD_321', 1),
	(5,			N'PV_318', 1),
	(6,			N'PV_319', 1),
	(7,			N'DU_211', 3),
	(8,			N'DD_212', 3),
	(9,			N'DV_213', 3);


SELECT * FROM Groups;