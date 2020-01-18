### T-SQL IN Statement

In T-SQL you can use the `IN` statement in a `WHERE` clause to filter results by a list or subquery.

The following query selects all employees with any of the job titles in the list.

	SELECT Name, Salary FROM Employees WHERE Title IN ('Software Engineer', 'Support Technician', 'Project Manager')

The following query finds all of the employees who work in any of the offices in Plymouth. 

	SELECT Name, Salary FROM Employees WHERE OfficeName IN (Select OfficeName FROM Offices WHERE Location = 'Plymouth')

Subqueries with IN may be more readable than using multiple joins and they can help when writing a quick query to get some data but they often have performance issues so if you are building them into an application make sure to optimise them.