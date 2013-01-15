<cfquery name="qUpdateGroups" datasource="#my.db.dsn#">
	UPDATE #my.db.tableprefix#_apps AS a
	SET
		a.identifier = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.groupid#" />,
		a.name = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#trim(attributes.name)#" />,,
		a.description = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="2005" value="#trim(attributes.description)#" />,
		a.lsup_ts = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" />,
		a.lsup_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#cgi.auth_user#" />
	WHERE a.id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.groupid#" />
</cfquery>