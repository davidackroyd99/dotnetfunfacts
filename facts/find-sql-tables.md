!meta

title:Finding SQL Tables
url:find-sql-tables
contributors:John Warren
created:2020-3-9
modified:2020-3-9
tags:SQL;Quick Tips

!endmeta
You can easily find a SQL table name by querying sys.tables:

	SELECT * FROM sys.tables WHERE name LIKE '%your query%'

You can also join on to the columns table and find tables that contain a specific column name.

	SELECT * FROM sys.tables t
	JOIN sys.columns c
	ON t.object_id = c.object_id
	WHERE c.name LIKE '%some column%'
