<cfquery name="qAdd" datasource="#my.db.dsn#">
	INSERT INTO #my.db.tableprefix#_BlogEntries (
		be_entryid,
		be_title,
		be_shorttext,
		be_longtext,
		be_enabled,
		cr_id,
		cr_ts,
		lu_id,
		lu_ts
	)
	VALUES (
		'#attributes.entryid#',
		'#trim(attributes.title)#',
		'#trim(attributes.shorttext)#',
		'#trim(attributes.longtext)#',
		<cfif isDefined('attributes.enabled') and attributes.enabled eq 1>1,<cfelse>0,</cfif>
		'#cgi.auth_user#',
		#now()#,
		'#cgi.auth_user#',
		#now()#
	)
</cfquery>