<cfquery name="qAddGroup" datasource="#my.db.dsn#">
	INSERT INTO #my.db.tableprefix#_apps (
		id,
		identifier,
		name,
		type,
		description,
		enabled,
		cr_id,
		cr_ts
	)
	VALUES (
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.groupid#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.groupid#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#trim(attributes.name)#" />,
		'pagegroup',
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="2005" value="#trim(attributes.description)#" />,
		'0',
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#cgi.auth_user#" />,
		<cfqueryparam cfsqltype="cf_sql_date" value="#now()#" />
	)
</cfquery>