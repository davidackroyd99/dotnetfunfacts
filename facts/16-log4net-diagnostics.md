### Troubleshooting Log4Net

You can enable log4net internal debugging by adding this to your config file:

	<appSettings>
		 <add key="log4net.Internal.Debug" value="true"/>
  	</appSettings>


This will write out Log4Net internal messages to the trace debugger. To write these trace debug messages out to a file, add this to the .config file and make sure that the application has permissions on the file.


	  <system.diagnostics>
	   <trace autoflush="true">
		   <listeners>
		       <add
		           name="textWriterTraceListener"
		           type="System.Diagnostics.TextWriterTraceListener"
		           initializeData="{FILE_TO_WRITE TO{" />
		   </listeners>
	   </trace>
	</system.diagnostics>