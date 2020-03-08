!meta

title:Expression Body Definition
contributors:David Ackroyd
created:2020-03-08
modified:2020-03-08
tags:

!endmeta


### Expression Body Definition

C# 6 provides a more readable format for single expression methods and readonly properties called an 'expression body definition'.

	public class MyClass
	{
		public int MyNumber => 5;

		public override string ToString() => $"My number is {MyNumber}";
	}

This means that we can fit a single expression method on to one line with lambda-esque syntax.

C# 7 extends this feature to property getters and setters, and constructors.

	public class MyClass
	{
		private int myNumber;

		public MyClass(int n) => MyNumber = n;

		public int MyNumber
		{
			get => myNumber;
			set => myNumber = value;
		}

		public override string ToString() => $"My number is {MyNumber}";
	}
