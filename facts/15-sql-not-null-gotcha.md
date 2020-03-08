This fact was actually created before the date listed, but the metadata system was not created until 08/03/2020.

!meta

title:WHERE [column] != NULL Does Not Work
url:where-null
contributors:David Ackroyd
created:2020-03-08
modified:2020-03-08
tags:T-SQL;Common Mistakes

!endmeta


### WHERE [column] != NULL Does Not Work

C# will allow you to test if an object is null or not using the `!=` operator, but **sql server won't**.

	SELECT * FROM [table] WHERE [column] != NULL -- returns 0 results

	SELECT * FROM [table] WHERE [column] IS NOT NULL -- returns expected results
