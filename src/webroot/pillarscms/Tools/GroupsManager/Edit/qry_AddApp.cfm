<cfset attributes.appid = createGUID() />

<cfquery datasource="#my.db.dsn#">
	INSERT INTO #my.db.tableprefix#_apps (
		id,
		identifier,
		name,
		path,
		description,
		enabled,
		cr_id,
		cr_ts
	)
	VALUES (
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.appid#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.identifier#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#trim(attributes.name)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="200" value="#trim(attributes.path)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="2005" value="#trim(attributes.description)#" />,
		<cfqueryparam cfsqltype="cf_sql_char" maxlength="1" value="#trim(attributes.enabled)#" />,	
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#cgi.auth_user#" />,
		<cfqueryparam cfsqltype="cf_sql_date" value="#now()#" />
	)
</cfquery>