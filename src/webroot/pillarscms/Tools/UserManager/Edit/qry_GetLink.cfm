<cfquery name="GetLink" datasource="#my.db.dsn#">
	SELECT
		b.id appid,
		b.name
	FROM #my.db.tableprefix#_users AS a
	LEFT OUTER JOIN #my.db.tableprefix#_apps AS b
		ON a.fk_app_id = b.id
	WHERE a.id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="8" value="#trim(lcase(attributes.usrid))#" />
</cfquery>