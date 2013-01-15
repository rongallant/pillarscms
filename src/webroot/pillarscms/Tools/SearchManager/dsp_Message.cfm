<cfif isdefined('attributes.message') and len(attributes.message)>
	<cfparam name="application.applicationname">
	<cfset appname = lcase(application.applicationname)>
	<cfoutput>
		<div id="warningbox">
		<cfswitch expression="#attributes.message#">
		
			<cfcase value="Create">
				<p>The collection "#appname#" has been <strong>created</strong>.</p>
			</cfcase>
		
			<cfcase value="Repair">
				<p>The collection "#appname#" has been <strong>repaired.</strong></p>
			</cfcase>
		
			<cfcase value="Optimize">
				<p>The collection "#appname#" has been <strong>optimized</strong>.</p>
			</cfcase>
		
			<cfcase value="Delete">
				<p>The collection "#appname#" has been <strong>deleted</strong>.</p>
			</cfcase>
		
			<cfcase value="Update">
				<p>The collection "#appname#" has been <strong>Updated</strong>.</p>
			</cfcase>
		
		</cfswitch>
		</div>
	</cfoutput>
</cfif>
