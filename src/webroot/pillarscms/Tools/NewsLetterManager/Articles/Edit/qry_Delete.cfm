<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="" />
	</properties>
	<io>
		<in>
			<string name="" />
		</in>
		<out>
			<string name="" />
		</out>
	</io>
</fusedoc>
--->

<cfquery name="qDeleteArticle" datasource="#my.db.dsn#">
	DELETE FROM #my.db.tableprefix#_Articles
	WHERE article_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.articleid#" />
</cfquery>