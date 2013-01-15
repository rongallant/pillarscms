<cftry>
	<cfquery datasource="#my.db.dsn#">
		DELETE FROM #my.db.tableprefix#_apps
		WHERE id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.appid#" />
	</cfquery>
	<cfcatch type="Database">
		<cfif cfcatch.errorcode eq "23000">
			<cf_fuseaction fuseaction="#fusebox.thisCircuit#.errors" querystring="appid=#attributes.appid#&errormsg=Constraints">
		</cfif>
	</cfcatch>
</cftry>