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

<cfparam name="attributes.enable" type="boolean" default="0" />

<cfquery name="qUpdate" datasource="#my.db.dsn#">
	UPDATE #my.db.tableprefix#_Articles AS a
	SET
		a.fk_issue_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.issue)#" />,
		a.article_title = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#trim(attributes.title)#" />,
		a.article_content = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(attributes.content)#" />,
		a.article_enabled = <cfqueryparam cfsqltype="cf_sql_tinyint" maxlength="4" value="#attributes.enable#" />,
		a.lu_ts = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#" />,
		a.lu_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#cgi.auth_user#" />
	WHERE article_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.articleid#" />
</cfquery>