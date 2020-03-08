!meta

title:The Basics of CORS With IIS
contributors:David Ackroyd
created:2020-03-08
modified:2020-03-08
tags:

!endmeta


### The Basics of CORS With IIS

The same-origin policy stipulates that a web browser should allow scripts on a web page to access data on a second page, but only if they have the same origin. This prevents someone from writing a piece of JavaScript that downloads the contents of another website that a secure user logs in to (say Facebook) and sends it back to their server. When writing an web-based API, for example, you need to enable CORS to allow scripts served by other origins to access your data.

CORS (Cross Origin Resource Sharing) defines a set of headers that allow the browser and the server to communicate about which requests are and aren't allowed. To enable CORS, simply add the following to your web.config:

	<?xml version="1.0" encoding="utf-8"?>
	<configuration>
	 <system.webServer>
	   <httpProtocol>
		 <customHeaders>
		   <add name="Access-Control-Allow-Origin" value="*" />
		 </customHeaders>
	   </httpProtocol>
	 </system.webServer>
	</configuration>

You can also specify a certain domain to be used:

	<add name="Access-Control-Allow-Origin" value="http://localhost:1506" />
