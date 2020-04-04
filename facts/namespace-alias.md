!meta

title:Namespace/Type Aliasing
url:namespace-alias
contributors:David Ackroyd
created:2020-3-4
modified:2020-3-4
tags:C#;Language Fundamentals;Quick Tips

!endmeta
You can alias namespaces and types, which is often useful for resolving conflicts. For example:

    using n1 = Assembly1.MyNamespace;   // Namespace alias
    using n2 = Assembly2.MyNamespace;

It works exactly the same way for types.

    using MyClass1 = Assembly1.MyNamespace.MyClass
    using MyClass2 = Assembly2.MyNamespace.MyClass
