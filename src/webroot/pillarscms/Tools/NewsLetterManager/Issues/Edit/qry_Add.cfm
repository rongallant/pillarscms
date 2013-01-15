<cfset variables.issueid = createGUID() />
<cfset attributes.editor = correctList(attributes.editor,"|") />
<cfset attributes.credits = correctList(attributes.credits,"|") />

<cfquery name="qAddIssue" datasource="#my.db.dsn#">
	INSERT INTO #my.db.tableprefix#_Issues (
		issue_id,
		issue_startdate,
		issue_editor,
		issue_credits,
		issue_notes,
		issue_enabled,
		cr_ts,
		cr_id
	)
	VALUES (
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#variables.issueid#" />,
		<cfqueryparam cfsqltype="cf_sql_timestamp" value="#StartDateTime#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#HTMLEditFormat(trim(attributes.editor))#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="1000" value="#trim(attributes.credits)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="5000" value="#trim(attributes.notes)#" />,
		<cfqueryparam cfsqltype="cf_sql_char" maxlength="10" value="#trim(attributes.enabled)#" />,
		<cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#cgi.auth_user#" />
	)
</cfquery>