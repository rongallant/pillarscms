<cfquery name="qDeleteEntry" datasource="#my.db.dsn#">
	DELETE FROM #my.db.tableprefix#_ScrollEntries
	WHERE entryid = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.entryid)#" />
</cfquery>