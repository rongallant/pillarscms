<cfscript>
	// I set beginning value based upon system ticks [60,000 ticks = on minute), twin value will be set
	// in ONREQUESTEND.cfm to find the difference and test against 'performancethreshhold'
	// if the elapsed time of the page exceeds the threshold value then we notify persons
	request.begintickcount = GetTickCount();
	if ( isdefined('url.timeout') ) {
		request.performancethreshhold = url.timeout;
	} else {
		request.performancethreshhold = 60000;
	}

	// pass URL / Form values into FB
	passthrough = structNew();
	structAppend( passthrough, url, "no" );
	structAppend( passthrough, form, "no" );
</cfscript>

<!--- I call the fusebox app and pass in the URL/Form variables. --->
<cfimport prefix="pillarscms" taglib="pillarscms/" />
<pillarscms:fusebox attributecollection="#passthrough#" />

<!--- I catch the tick count and if it is over the performance --->
<!--- threshhold I send an error message to the webmaster --->
<cfif not isDefined('request.TimedOut')>
	<cfset request.endtickcount = GetTickCount() />
	<cfif (request.endtickcount - request.begintickcount) gt request.performancethreshhold>
		<cfset request.toomanyseconds = (request.endtickcount - request.begintickcount) / 1000 />
		<cfset request.TimedOut = 1 />
		<cfinclude template="pillarscms/Errors/dsp_Timeout.cfm" />
	</cfif>
</cfif>