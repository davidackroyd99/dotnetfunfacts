This fact was actually created before the date listed, but the metadata system was not created until 08/03/2020.

!meta

title:Order of Elements In A Project File
url:order-of-csproj
contributors:David Ackroyd
created:2020-03-08
modified:2020-03-08
tags:MSBuild;Project Files

!endmeta

A project file is actually just an MSBuild script. This is intially confusing because a .csproj seems to contain XML data that describes the project (its name, root namespace, etc.), and crucially it seems as though the order of the 'elements' of this xml document shouldn't matter. It does. MSBuild will execute all of the statements in order, just like any other script.

A property is a user defined constant that can be referred to later on in the script and must be contained within a `PropertyGroup`. An item is something that can be included in the script, like a file or a nuget package, and must be contained with an `ItemGroup`. A task is something that the script actually has to do, like moving files around, and in the script you can specify when this should happen (for instance, before the build or after the build). Tasks go in the `Target` element. The `PropertyGroup` element must come first, then the `ItemGroup` element, and finally the `Target` element.
