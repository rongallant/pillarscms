<cftry>
	<cfquery name="qDeleteGroup" datasource="#my.db.dsn#">
		DELETE FROM #my.db.tableprefix#_apps
		WHERE id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.groupid#" />
	</cfquery>
	<cfcatch type="Database">
		<cfif cfcatch.errorcode eq "23000">
			<cfsavecontent variable="errormsg">
				<cfoutput>
					<p>You have users listed under this group.<br>
					<a href="#myself##xfa.ListUsers#&appid=#attributes.groupid#">Do you want to remove them now?</a></p>
				</cfoutput>
			</cfsavecontent>
			<cfthrow type="custom" message="#errormsg#" />
		<cfelse>
			<cfrethrow />
		</cfif>
	</cfcatch>
</cftry>