<cfquery name="request.qIssue" datasource="#my.db.dsn#">
	SELECT
		b.article_id AS storyid,
		b.article_title AS title,
		b.article_order AS orderby,
		a.issue_editor AS editor,
		a.issue_credits AS creditslist,
		a.issue_startdate AS startdate
	FROM #my.db.tableprefix#_Issues a
	JOIN #my.db.tableprefix#_Articles b
		ON b.fk_issue_id = a.issue_id
	WHERE a.issue_id = <cfqueryparam value="#request.qStory.issueid#" cfsqltype="cf_sql_varchar" maxlength="37" />
		AND  a.issue_enabled = 1
		AND b.article_enabled = 1
	ORDER BY b.article_order ASC
</cfquery>