!meta

title:Helpful Error Pages For ASP.NET Web Api Projects
url:web-api-error
contributors:David Ackroyd
created:2020-3-4
modified:2020-3-4
tags:ASP.NET;Quick Tips

!endmeta
By default, ASP.NET Web Api projects will not reveal exception or call stack details in 500 responses. You can modify this behaviour using the IncludeErrorDetailPolicy of the HttpConfiguration object in your App_Start:

   config.IncludeErrorDetailPolicy = IncludeErrorDetailPolicy.Always;

There is also a 'LocalOnly' option but I'm personally too scared to use it, so you might want to come up with some way of only including this in development builds.
