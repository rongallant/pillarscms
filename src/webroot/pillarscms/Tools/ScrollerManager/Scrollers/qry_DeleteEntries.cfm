<cfquery name="qDeleteEntries" datasource="#my.db.dsn#">
	DELETE FROM #my.db.tableprefix#_ScrollEntries
	WHERE fk_scrollerid = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.scrollerid)#" />
</cfquery>