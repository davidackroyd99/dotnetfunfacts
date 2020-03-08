!meta

title:Adding A Port Number To A SQL Server Connection String
contributors:David Ackroyd
created:2020-03-08
modified:2020-03-08
tags:

!endmeta


### Adding A Port Number To A SQL Server Connection String

When you add a port number to a SQL server connection string, you split the server name and the port number with a comma rather than a colon. For example, if you wanted to connect to sql.mywebsite.com on port 5555, ther 'server' part connection string would look something like this:

    Server=tcp:sql.mywebsite.com,5555;

This applies to SQL Server Management Studio as well.
