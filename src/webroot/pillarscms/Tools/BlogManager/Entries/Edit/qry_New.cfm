<cfquery name="qArticle" datasource="#my.db.dsn#">
	SELECT
		entryid,
		title,
		shorttext,
		longtext,
		cr_ts,
		cr_id,
		lu_ts,
		lu_id
	FROM #my.db.tableprefix#_BlogArticles
	ORDER BY article_order, article_title
</cfquery>