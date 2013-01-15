<cfquery datasource="#my.db.dsn#">
	DELETE FROM #my.db.tableprefix#_users
	WHERE username = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="8" value="#trim(lcase(attributes.usrid))#" />
</cfquery>