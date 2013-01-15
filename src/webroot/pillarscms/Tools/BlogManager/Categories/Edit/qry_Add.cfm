<cfquery name="qAddCat" datasource="#my.db.dsn#">
	INSERT INTO #my.db.tableprefix#_BlogCategories (
		catid,
		title,
		description,
		cr_id,
		cr_ts,
		lu_id,
		lu_ts
	)
	VALUES (
		'#catid#',
		'#trim(attributes.title)#',
		'#trim(attributes.description)#',
		'#cgi.auth_user#',
		#now()#,
		'#cgi.auth_user#',
		#now()#
	)
</cfquery>