<cfquery name="qDeleteEntry" datasource="#my.db.dsn#">
	DELETE FROM #my.db.tableprefix#_BlogEntries
	WHERE be_entryid = <cfqueryparam value="#attributes.entryid#" cfsqltype="cf_sql_varchar" maxlength="37" />
</cfquery>