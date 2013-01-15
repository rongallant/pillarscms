<cfquery name="wuMenu" datasource="#my.db.dsn#">
	SELECT
		a.id application,
		a.identifier,
		a.name,
		a.description,
		a.path,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#my.user.fname#" /> AS firstname,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#my.user.lname#" /> AS lastname
	FROM #my.db.tableprefix#_apps a
	WHERE a.enabled = 1
	ORDER BY a.name
</cfquery>