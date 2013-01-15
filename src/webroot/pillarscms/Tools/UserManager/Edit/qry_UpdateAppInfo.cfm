<cfquery name="qUpdateAppInfo" datasource="#my.db.dsn#">
	UPDATE #my.db.tableprefix#_userapps AS a
	SET
		a.Permissions = <cfqueryparam cfsqltype="cf_sql_decimal" value="#trim(attributes.Permissions)#" />,
		a.notes = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="200" value="#trim(attributes.notes)#" />,
		a.lsup_ts = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#" />,
		a.lsup_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="20" value="#cgi.auth_user#" />
	WHERE a.fk_user_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="8" value="#trim(lcase(attributes.usrid))#" />
		AND a.fk_app_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.appid)#" />
</cfquery>