<cfquery name="qApps" datasource="#my.db.dsn#">
	SELECT
		a.id AS appid,
		a.name
	FROM #my.db.tableprefix#_apps AS a
	WHERE a.id IS NOT NULL
		AND a.id NOT IN (<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#valueList(getMessages.appid)#" />)
	ORDER BY a.name
</cfquery>