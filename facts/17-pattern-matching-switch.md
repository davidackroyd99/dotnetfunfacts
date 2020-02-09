### Pattern Matching Switch

C# 7 introduced support for pattern matching switch statements. 

	switch(obj)
	{
		case SomeType someObj:
			return someObj.SomeMethod();
		case OtherType otherObj:
			return otherObj.OtherMethod();
		default:
			return null;
	}

We can also use the `when` keyword to make our switch statements even more expressive. For example, this will only return the results of the methods when boolean properties on the objects are true.

	switch(obj)
	{
		case SomeType someObj when someObj.SomeBoolean:
			return someObj.SomeMethod();
		case OtherType otherObj when otherObj.OtherBoolean:
			return otherObj.OtherMethod();
		default:
			return null;
	}