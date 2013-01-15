<cfswitch expression="#fusebox.cfcatch.type#">

	<cfcase value="custom">
		<cfswitch expression="#fusebox.cfcatch.errorCode#">
			<cfcase value="1">
				<p>This folder cannot be deleted because it is not empty.</p>
				<p><a href="javascript:history.back();">Return</a></p>
			</cfcase>
		</cfswitch>
	</cfcase>

	<cfdefaultcase>
		<cfset fusebox.rethrowError = TRUE>
	</cfdefaultcase>

</cfswitch>