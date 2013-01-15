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

<cfquery name="qMenu" datasource="#my.db.dsn#">
	SELECT
		b.article_id AS story,
		b.article_title AS title,
		b.article_content AS content,
		b.article_order AS orderby,
		b.article_enabled AS enable,
		b.cr_ts,
		b.cr_id,
		b.lu_ts,
		b.lu_id,
		a.issue_id AS issue,
		a.issue_startdate AS date
	FROM #my.db.tableprefix#_Issues a
	JOIN #my.db.tableprefix#_Articles b
		ON issue_id = fk_issue_id
	WHERE a.issue_enabled = 1
		AND b.article_enabled = 1
		<cfif isDefined('attributes.issue') and len(attributes.issue)>
			AND a.issue_id = <cfqueryparam value="#attributes.issue#" cfsqltype="cf_sql_varchar" maxlength="37" />
		</cfif>
		<cfif isDefined('attributes.story') and len(attributes.story)>
			AND b.article_id = <cfqueryparam value="#attributes.story#" cfsqltype="cf_sql_varchar" maxlength="37" />
		</cfif>
	ORDER BY b.article_order ASC
</cfquery>