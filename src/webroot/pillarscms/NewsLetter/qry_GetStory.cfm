<cfquery name="request.qStory" datasource="#my.db.dsn#">
	SELECT
		a.issue_id AS issueid,
		a.issue_startdate AS startdate,
		b.article_id AS storyid,
		b.article_title AS title,
		b.article_content AS content,
		b.article_order AS orderby,
		b.article_enabled AS enable,
		b.cr_ts,
		b.cr_id,
		b.lu_ts,
		b.lu_id
	FROM #my.db.tableprefix#_Issues AS a
	JOIN #my.db.tableprefix#_Articles AS b
		ON b.fk_issue_id = a.issue_id
	WHERE
		<cfif isDefined('attributes.story') and len(attributes.story)>
			b.article_id = <cfqueryparam value="#attributes.story#" cfsqltype="cf_sql_varchar" maxlength="37" />
		<cfelseif isDefined('attributes.issue') and len(attributes.issue)>
			a.issue_id = <cfqueryparam value="#attributes.issue#" cfsqltype="cf_sql_varchar" maxlength="37" />
		<cfelse>
			a.issue_startdate = (
				SELECT MAX(a.issue_startdate)
				FROM #my.db.tableprefix#_Issues a
				JOIN #my.db.tableprefix#_Articles b
					ON b.fk_issue_id = a.issue_id
				WHERE a.issue_enabled = 1
					AND b.article_enabled = 1
					AND a.issue_startdate <= <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp" />
			)
		</cfif>
		AND a.issue_enabled = 1
		AND b.article_enabled = 1
	ORDER BY b.article_order ASC
</cfquery>