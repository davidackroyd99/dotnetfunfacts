### SQL WHERE Clauses Are Not Case Sensitive

T-SQL is case insensitive and this means that the WHERE clauses that compare column values to some known string will not be case sensitive either. This means that

	SELECT * FROM [TABLE_NAME] WHERE [COLUMN] = 'this is a string'

and

	SELECT * FROM [TABLE_NAME] WHERE [COLUMN] = 'THIS IS A STRING'

will return the same result sets.