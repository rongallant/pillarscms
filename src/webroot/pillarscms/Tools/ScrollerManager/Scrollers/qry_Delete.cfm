<cfquery name="qDeleteScroller" datasource="#my.db.dsn#">
	DELETE FROM #my.db.tableprefix#_Scrollers
	WHERE scrollerid = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.scrollerid)#" />
</cfquery>