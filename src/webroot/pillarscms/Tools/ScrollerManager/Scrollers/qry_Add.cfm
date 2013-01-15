<cfquery name="qAddScroller" datasource="#my.db.dsn#">
	INSERT INTO #my.db.tableprefix#_Scrollers (
		scrollerid,
		name,
		height,
		width,
		scrolltime,
		stoptime,
		bgcolor,
		notes,
		cr_ts,
		cr_id,
		lu_ts,
		lu_id
	)
	VALUES (
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.scrollerid)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(attributes.name)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#trim(attributes.height)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#trim(attributes.width)#" />,
		<cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#trim(attributes.scrolltime)#" />,
		<cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#trim(attributes.stoptime)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#trim(attributes.bgcolor)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#trim(attributes.notes)#" />,
		<cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#cgi.auth_user#" />,
		<cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#cgi.auth_user#" />
	)
</cfquery>