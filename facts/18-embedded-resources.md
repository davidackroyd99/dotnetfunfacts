!meta

title:The Right Way To Store XSLTs For Data Transformation
contributors:David Ackroyd
created:2020-03-08
modified:2020-03-08
tags:

!endmeta


### The Right Way To Store XSLTs For Data Transformation

Still, in 2020, a lot of projects .NET developers undertake involve reading data from xml files that have been FTP'd on to the server, parsing these documents, and then performing some action. The developer rarely has control over the schema of the input XML and to make matters worse it's often subject to change, so the developer will write an XSLT file which transforms the input into some XML format that can then be serialized.

Before, I used to read the XSLT from a directory stored in settings, but I was constantly losing the XSLT, or placing it in the wrong folder, or not realising it was there when I came to fix an issue. The XSLT needs to be treated like any other part of the code - under source control and part of the final .dll.

After including the XSLT in your csproj like any normal C# file, in visual studio you can set the `BuildAction` property of the XSLT to `EmbeddedResource`. You can then read the xslt as follows:

	var assembly = Assembly.GetExecutingAssembly();

	// Rather than messing around with Namespaces, you can just call GetManifestResouceNames()
	// And filter using this bit of LINQ
	var resourceName = assembly.GetManifestResourceNames()
  		.Single(str => str.EndsWith("ProductTransform.xslt"));

	using (Stream stream = assembly.GetManifestResourceStream(resourceName))
	using (StreamReader reader = new StreamReader(stream))
	{
		// Do whatever you want to do
	}

If you build the assembly, it will result in just one .dll that can be deployed normally. Code snippet courtesy of [this StackOverflow answer](https://stackoverflow.com/a/3314213).
