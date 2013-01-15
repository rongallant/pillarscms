<cfquery name="qDeletePages" datasource="#my.db.dsn#">
	DELETE FROM #my.db.tableprefix#_GroupsPages
	WHERE fk_groupid = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.groupid#" />
</cfquery>