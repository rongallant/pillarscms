<cfparam name="attributes.enabled" type="boolean" default="0" />

<cfquery name="AddUser" datasource="#my.db.dsn#">
	INSERT INTO #my.db.tableprefix#_users (
		username,
		password,
		firstname,
		lastname,
		phone_work,
		email_work,
		notes,
		enabled,
		cr_id,
		cr_ts
	)
	VALUES (
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="8" value="#trim(lcase(attributes.usrid))#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="32" value="#trim(attributes.password)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#trim(attributes.firstname)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#trim(attributes.lastname)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#oUtils.formatPhoneNumber(attributes.phone)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#trim(attributes.email)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="2005" value="#trim(attributes.notes)#" />,
		<cfqueryparam cfsqltype="cf_sql_char" maxlength="1" value="#trim(attributes.enabled)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="20" value="#cgi.auth_user#" />,
		<cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#" />
	)
</cfquery>