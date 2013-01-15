<cfquery datasource="#my.db.dsn#">
	UPDATE #my.db.tableprefix#_apps
	SET
		id = '#trim(attributes.appid)#',
		identifier = '#trim(attributes.identifier)#',
		name = '#trim(attributes.name)#',
		path = '#trim(attributes.path)#',
		description = '#trim(attributes.description)#',
		enabled = '#trim(attributes.enabled)#',
		lsup_ts = #now()#,
		lsup_id = '#cgi.auth_user#'
	WHERE id = '#attributes.appid#'
</cfquery>