<cfquery name="qUpdateScroller" datasource="#my.db.dsn#">
	UPDATE #my.db.tableprefix#_Scrollers
	SET
		name = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#trim(attributes.name)#" />,
		height = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#trim(attributes.height)#" />,
		width = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#trim(attributes.width)#" />,
		scrolltime = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#trim(attributes.scrolltime)#" />,
		stoptime = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#trim(attributes.stoptime)#" />,
		bgcolor = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#trim(attributes.bgcolor)#" />,
		notes = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#trim(attributes.notes)#" />,
		lu_ts = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#" />,
		lu_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#cgi.auth_user#" />
	WHERE scrollerid = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.scrollerid)#" />
</cfquery>