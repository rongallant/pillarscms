<cftry>
	<cfquery datasource="#my.db.dsn#">
		DELETE FROM #my.db.tableprefix#_apps
		WHERE #my.db.tableprefix#_apps.id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.appid#" />
			AND #my.db.tableprefix#_apps.identifier <> 'admin'
	</cfquery>
	<cfcatch type="Database">
		<cfif cfcatch.errorcode eq "23000">
			<cfset dontgo = 1 />
			<cfimport prefix="fb" taglib="../../../" />
			<fb:fusebox 
				fuseaction="#fusebox.thisCircuit#.errors"
				appid="#attributes.appid#"
				errormsg="Constraints"
				layout="none"
			/>
		</cfif>
	</cfcatch>
</cftry>