!meta

title:Easy Date Printing
contributors:David Ackroyd
created:2020-03-08
modified:2020-03-08
tags:

!endmeta


### Easy Date Printing

You can pass a format into the `ToString` method of a `DateTime` object to easily print a date with a specific format. You can specify your own format (e.g. "dd-MM-yyyy") or you can use one of the default one-character 'format specifiers' found [here](https://docs.microsoft.com/en-us/dotnet/api/system.datetime.tostring?view=netframework-4.8).

This will default to the current culture. If you want to change the culture, you can pass in an `IFormatProvider`. These are easy to initialise; if you would like the days and months to be printed in German, you could pass `CultureInfo.CreateSpecificCulture("de-DE")` as the second parameter.
