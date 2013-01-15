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

<cfset attributes.editor = correctList(attributes.editor,"|") />
<cfset attributes.credits = correctList(attributes.credits,"|") />

<cfquery name="qUpdateIssue" datasource="#my.db.dsn#">
	UPDATE #my.db.tableprefix#_Issues
	SET
		issue_startdate = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#StartDateTime#" />,
		issue_editor = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#HTMLEditFormat(trim(attributes.editor))#" />,
		issue_credits = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="1000" value="#trim(attributes.credits)#" />,
		issue_notes = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="5000" value="#trim(attributes.notes)#" />,
		issue_enabled = <cfqueryparam cfsqltype="cf_sql_char" maxlength="10" value="#trim(attributes.enabled)#" />,
		lu_ts = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#" />,
		lu_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#cgi.auth_user#" />
	WHERE issue_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#variables.issueid#" />
</cfquery>