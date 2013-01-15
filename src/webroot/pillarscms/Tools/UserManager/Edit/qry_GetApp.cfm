<cfquery name="qGetApp" datasource="#my.db.dsn#">
	SELECT
		a.id,
		a.name,
		b.permissions,
		b.notes
	FROM #my.db.tableprefix#_apps AS a
	LEFT OUTER JOIN #my.db.tableprefix#_userapps AS b
		ON a.id = b.fk_app_id
	LEFT OUTER JOIN #my.db.tableprefix#_users AS c
		ON b.fk_user_id = c.username
	WHERE c.username = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="8" value="#trim(lcase(attributes.usrid))#" />
	AND a.id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.appid)#" />
</cfquery>