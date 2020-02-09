### WHERE [column] != NULL Does Not Work

C# will allow you to test if an object is null or not using the `!=` operator, but **sql server won't**.

	SELECT * FROM [table] WHERE [column] != NULL -- returns 0 results

	SELECT * FROM [table] WHERE [column] IS NOT NULL -- returns expected results