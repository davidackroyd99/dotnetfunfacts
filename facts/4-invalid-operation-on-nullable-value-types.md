### Common Cause of an InvalidOperationException
	int? a = null;
	Console.WriteLine(a.Value);
When you attempt to access the value of a  nullable value type that does not have a value you will get an InvalidOperationException (instead of a NullReferenceException), which you might not expect. According to the .NET Framework documentation, 'this exception is thrown when a method call is invalid for the object's current state.' However, the documentation on the exception can be confusing as attempting to access the value of a nullable type does not appear in the quite extensive list of possible causes. 