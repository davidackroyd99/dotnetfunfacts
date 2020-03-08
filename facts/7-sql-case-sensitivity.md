This fact was actually created before the date listed, but the metadata system was not created until 08/03/2020.

!meta

title:SQL String Comparisons Are Not Case Sensitive
url:sql-case-sensitivity
contributors:David Ackroyd
created:2020-03-08
modified:2020-03-08
tags:T-SQL;Common Mistakes

!endmeta


### SQL String Comparisons Are Not Case Sensitive

T-SQL is case insensitive and this means that the WHERE clauses that compare column values to some known string will not be case sensitive either. This means that

	SELECT * FROM [TABLE_NAME] WHERE [COLUMN] = 'this is a string'

and

	SELECT * FROM [TABLE_NAME] WHERE [COLUMN] = 'THIS IS A STRING'

will return the same result sets.
