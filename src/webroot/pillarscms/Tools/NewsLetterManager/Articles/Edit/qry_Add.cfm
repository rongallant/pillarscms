<cfset variables.articleid = createGUID() />

<cfif len(qMaxArticle.maxorder)>
	<cfset variables.orderby = qMaxArticle.maxorder + 1 />
<cfelse>
	<cfset variables.orderby = 1 />
</cfif>

<cfif attributes.enable eq 1>
	<cfset variables.enable = 1 />
<cfelse>
	<cfset variables.enable = 0 />
</cfif>

<cfquery name="qAdd" datasource="#my.db.dsn#">
	INSERT INTO #my.db.tableprefix#_Articles (
		article_id,
		fk_issue_id,
		article_title,
		article_content,
		article_order,
		article_enabled,
		cr_ts,
		cr_id
	)
	VALUES (
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#variables.articleid#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.issue)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#trim(attributes.title)#" />,
		<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(attributes.content)#" />,
		<cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#variables.orderby#" />,
		<cfqueryparam cfsqltype="cf_sql_tinyint" maxlength="4" value="#variables.enable#" />,
		<cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#cgi.auth_user#" />
	)
</cfquery>