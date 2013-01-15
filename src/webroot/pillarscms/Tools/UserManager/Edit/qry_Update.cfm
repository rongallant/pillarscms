<cfparam name="attributes.enabled" type="boolean" default="0" />

<cfquery datasource="#my.db.dsn#">
	UPDATE #my.db.tableprefix#_users
	SET
		firstname = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#trim(attributes.firstname)#" />,
		lastname = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#trim(attributes.lastname)#" />,
		phone_work = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#oUtils.formatPhoneNumber(attributes.phone)#" />,
		email_work = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#trim(attributes.email)#" />,
		notes = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="2005" value="#trim(attributes.notes)#" />,
		enabled = <cfqueryparam cfsqltype="cf_sql_char" maxlength="1" value="#trim(attributes.enabled)#" />,
		lsup_ts = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#" />,
		lsup_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="20" value="#cgi.auth_user#" />
	WHERE username = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="8" value="#trim(lcase(attributes.usrid))#" />
</cfquery>