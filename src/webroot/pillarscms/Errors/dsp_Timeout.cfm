<cftry>

	<cfif isDefined('request.performancethreshhold')>

		<cfset threshhold = request.performancethreshhold/1000>

		<cfmail
			to="#my.email.webmaster#"
			from="Error from #cgi.server_name#<#my.site.name#>"
			subject="Page processing time of #numberformat(request.toomanyseconds,"99.999")# seconds went beyound the system threshold of #threshhold# seconds"
			type="HTML">

			<p>WARNING: Page processing time of #numberformat(request.toomanyseconds,"99.999")# seconds went beyond the system threshold of #threshhold# seconds.</p>

			<p>This email was automatically generated by the error handling process on the #my.site.name# web site. Please forward the message to the web team member that is responsible for supporting this application.</p>

			<ul>
				<li>Date: #now()#
				<cfif len(cgi.server_name)><li>Server: #cgi.server_name#</cfif>
				<cfif len(cgi.script_name)><li>Script: #cgi.script_name#</cfif>
				<cfif len(cgi.query_string)><li>Query String: #cgi.query_string#</cfif>
				<cfif isdefined('attributes.fuseaction')><li>Fuseaction: #attributes.fuseaction#</cfif>
				<cfif len(cgi.script_name)><li>Script Location: #cgi.cf_template_path#</cfif>
				<cfif len(cgi.remote_host)><li>Remote Host: #cgi.remote_host#</cfif>
				
				<cfif isdefined('cgi.http_referer')><li>HTTP Referer: #cgi.http_referer#</cfif>
				<cfif len(cgi.http_user_agent)><li>HTTP User Agent: #cgi.http_user_agent#</cfif>
			</ul>

			<hr>

			<b>Attributes:</b><br />
			<cfdump var="#attributes#">

		</cfmail>

	</cfif>

	<cfcatch></cfcatch>

</cftry>