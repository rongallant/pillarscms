<cfquery name="qApp" datasource="#my.db.dsn#">
	SELECT
		a.id AS appid,
		a.identifier,
		a.name,
		a.path,
		a.enabled,
		a.description
	FROM #my.db.tableprefix#_apps AS a
	WHERE a.id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.appid#" />
</cfquery>