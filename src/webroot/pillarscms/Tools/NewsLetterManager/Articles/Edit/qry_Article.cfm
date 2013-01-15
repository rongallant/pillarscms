<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="qry_Article" language="ColdFusion">
	<responsibilities>
		I return the specified article.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="" />
		<history email="ron@rongallant.com" type="update" date="2010-02-16" />
	</properties>
</fusedoc>
--->

<cfquery name="qArticle" datasource="#my.db.dsn#">
	SELECT
		a.article_id AS id,
		a.fk_issue_id AS issue,
		a.article_title AS title,
		a.article_content AS content,
		a.article_order AS orderby,
		a.article_enabled AS enable,
		a.cr_ts,
		a.cr_id,
		a.lu_ts,
		a.lu_id
	FROM #my.db.tableprefix#_Articles AS a
	WHERE article_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.articleid#" />
</cfquery>