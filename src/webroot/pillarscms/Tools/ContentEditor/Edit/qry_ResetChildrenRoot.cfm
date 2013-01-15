<cfquery name="qAddPage" datasource="#my.db.dsn#">
	UPDATE #my.db.tablePrefix#_pgPages
	SET 
		parent_id = 1,
		lu_ts = #now()#,
		lu_id = '#cgi.auth_user#'
	WHERE parent_id = '#attributes.pageid#'
</cfquery>