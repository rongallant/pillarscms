<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="" />
	</properties>
</fusedoc>
--->

<cfquery name="request.qStory" datasource="#my.db.dsn#">
	SELECT TOP 1
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
	WHERE b.article_id = <cfqueryparam value="#attributes.story#" cfsqltype="cf_sql_varchar" maxlength="37" />
	ORDER BY b.article_order ASC
</cfquery>