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

<cfquery name="qMaxArticle" datasource="#my.db.dsn#">
	SELECT max(article_order) AS maxorder
	FROM #my.db.tableprefix#_BlogArticles
	WHERE fk_issue_id = '#attributes.issue#'
</cfquery>