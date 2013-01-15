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

<cfparam name="attributes.issueid" default="00" />

<cfquery name="qDeleteIssue" datasource="#my.db.dsn#">
	DELETE FROM #my.db.tableprefix#_Issues
	WHERE issue_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.issueid#" />
</cfquery>