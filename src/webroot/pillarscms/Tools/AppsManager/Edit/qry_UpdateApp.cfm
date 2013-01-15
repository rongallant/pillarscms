<cfquery datasource="#my.db.dsn#">
	UPDATE #my.db.tableprefix#_apps AS a
	SET
		a.identifier = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#trim(attributes.identifier)#" />,
		a.name = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#trim(attributes.name)#" />,
		a.path = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="200" value="#trim(attributes.path)#" />,
		a.description = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="2005" value="#trim(attributes.description)#" />,
		a.enabled = <cfqueryparam cfsqltype="cf_sql_char" maxlength="1" value="#trim(attributes.enabled)#" />,
		a.lsup_ts = <cfqueryparam cfsqltype="cf_sql_date" maxlength="37" value="#now()#" />,
		a.lsup_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#cgi.auth_user#" />
	WHERE a.id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.appid#" />
</cfquery>