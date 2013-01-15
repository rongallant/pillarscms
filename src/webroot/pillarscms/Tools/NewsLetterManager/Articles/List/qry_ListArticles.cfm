<!---
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

<cfquery name="qArticles" datasource="#my.db.dsn#">
	SELECT
		a.article_id AS id,
		a.article_title AS title,
		a.article_content AS content,
		a.article_order AS orderby,
		a.article_enabled AS enable
	FROM #my.db.tableprefix#_Articles AS a
	WHERE a.fk_issue_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.issueid#" />
	ORDER BY a.article_order ASC
</cfquery>