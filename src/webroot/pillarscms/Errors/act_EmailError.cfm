<cfparam name="emailto" default="" />
<cfparam name="emailfrom" default="" />

<cftry>
	<cfscript>
		if ( isDefined('application.settings.my.email.errors.address') ) emailto = application.settings.my.email.errors.address;
		if ( isDefined('application.settings.my.email.errors.return') ) emailfrom = application.settings.my.email.errors.return;
		if ( isDefined('application.my.errormessagesentto') and DateDiff('n',application.my.errormessagesentto,now()) gt 5 ) {
			application.my.errormessagesent = "";
			application.my.errormessagesentto = now();
		}

		localhost = CreateObject("java", "java.net.InetAddress").getLocalHost();
		host = localhost; // obscure unnecessary parts of the host name in our current environmental setup to mitigate accidental exposure of internal server names
		emailsubject = "#cgi.SERVER_NAME# [#host#] #cfcatch.message#";
	</cfscript>

	<!--- I check for the error and check if I have already sent an email before sending one --->
	<cfif isDefined('cfcatch.message') and ( ( not isdefined('application.my.errormessagesent')) or ( not len(application.my.errormessagesent) ) or ( not application.my.errormessagesent contains cfcatch.type ) )>
		<cflock name="Errors" type="READONLY" timeout="10">
			<cfscript>
				if ( isdefined('application.my.errormessagesent') ) {
					application.my.errormessagesent = listappend(application.my.errormessagesent,cfcatch.type);
				} else {
					application.my.errormessagesent = cfcatch.type;
					application.my.errormessagesentto = now();
				}
			</cfscript>
		</cflock>
		<cfmail to="#emailto#" from="#emailfrom#<#cgi.server_name#>" subject="#emailsubject#" type="HTML">
			#errormessage#
		</cfmail>
		<cfoutput><p>An email has been sent to the webmaster.</p></cfoutput>
	</cfif>

	<cfcatch type="Any"></cfcatch>
</cftry>