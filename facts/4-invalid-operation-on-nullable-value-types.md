This fact was actually created before the date listed, but the metadata system was not created until 08/03/2020.

!meta

title:Common Cause of an InvalidOperationException
url:invalid-op-exception
contributors:David Ackroyd
created:2020-03-08
modified:2020-03-08
tags:C#;Exception Handling;Common Mistakes

!endmeta


### Common Cause of an InvalidOperationException
	int? a = null;
	Console.WriteLine(a.Value);
When you attempt to access the value of a  nullable value type that does not have a value you will get an InvalidOperationException (instead of a NullReferenceException), which you might not expect. According to the .NET Framework documentation, 'this exception is thrown when a method call is invalid for the object's current state.' However, the documentation on the exception can be confusing as attempting to access the value of a nullable type does not appear in the quite extensive list of possible causes. 
