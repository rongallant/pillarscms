<cfquery name="qUpdateIssue" datasource="#my.db.dsn#">
	UPDATE #my.db.tableprefix#_BlogCategories
	SET
		title = '#trim(attributes.title)#',
		description = '#trim(attributes.description)#',
		lu_ts = #now()#,
		lu_id = '#cgi.auth_user#'
	WHERE catid = '#attributes.catid#'
</cfquery>