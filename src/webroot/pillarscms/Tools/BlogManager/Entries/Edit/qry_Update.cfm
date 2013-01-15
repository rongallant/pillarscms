<cfquery name="qUpdate" datasource="#my.db.dsn#">
	UPDATE #my.db.tableprefix#_BlogEntries
	SET
		be_title = '#trim(attributes.title)#',
		be_shorttext = '#trim(attributes.shorttext)#',
		be_longtext = '#trim(attributes.longtext)#',
		be_enabled = <cfif attributes.enabled eq 1>1<cfelse>0</cfif>,
		lu_ts = #now()#,
		lu_id = '#cgi.auth_user#'
	WHERE be_entryid = '#attributes.entryid#'
</cfquery>