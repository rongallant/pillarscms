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

<cfparam name="attributes.issueid" default="0" />

<cfquery name="qIssue" datasource="#my.db.dsn#">
	SELECT
		a.issue_id AS id,
		a.issue_startdate AS StartDateTime,
		a.issue_editor AS editor,
		a.issue_credits AS credits,
		a.issue_notes AS notes,
		a.issue_enabled AS enabled,
		a.cr_id,
		a.cr_ts,
		a.lu_id,
		a.lu_ts
	FROM #my.db.tableprefix#_Issues AS a
	WHERE a.issue_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.issueid#" />
</cfquery>