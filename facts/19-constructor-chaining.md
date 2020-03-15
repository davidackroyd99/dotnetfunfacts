This fact was actually created before the date listed, but the metadata system was not created until 08/03/2020.

!meta

title:Constructor Overloading And Chaining
url:constructor-chaining
contributors:David Ackroyd
created:2020-03-08
modified:2020-03-08
tags:C#;Language Fundamentals

!endmeta

In C# it is not possible to invoke a constructor from inside the method body. If you think about this, it makes sense - once you are inside a method, the constructor must have already been called. However, consider the following constructor signatures:

    public SomeObject();

    public SomeObject(int someValue);

You may find yourself in a situation where you wish to provide some default value, or set the optional value and then call the 'standard' parameterless constructor. The syntax is similar to calling base from a constructor, except using the 'this' keyword to target the current class.

    public class SomeClass 
    {
        public SomeClass()
        {
            Console.WriteLine("constructor with zero parameters says nothing");
        }
        
        public SomeClass(string someMessage) : this() 
        {
            Console.WriteLine("constructor with one parameter says " + someMessage);
        }
    }

N.B. The next constructor in the chain is invoked immediately after the current constructor until the chain is exhausted. In this way C# is quite opinionated - it doesn't have to be this way, but it is, in an attempt to prevent programmers from doing unnecessary work in their constructors. By convention, in Object Oriented Programming (this is seen in languages like SmallTalk), any work to be done to initialise an object should be done in an 'Init' method like so.

    public class SomeClass 
    {
        public SomeClass(string someMessage)
        {
            this.message = someMessage;
            this.Init();
        }

        private void Init()
        {
            // Do some work.
        }
    }
