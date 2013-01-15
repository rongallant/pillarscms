<cfset attributes.appid = createGUID()>

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
		'#attributes.appid#',
		'#attributes.identifier#',
		'#trim(attributes.name)#',
		'#trim(attributes.path)#',
		'#trim(attributes.description)#',
		'#trim(attributes.enabled)#',		
		'#cgi.auth_user#',
		#now()#
	)
</cfquery>