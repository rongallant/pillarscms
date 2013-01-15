<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="qry_Credits" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="" />
	</properties>
</fusedoc>
--->

<cfif isdefined('attributes.issue')>
	<cfquery name="qCredits" datasource="#my.db.dsn#">
		SELECT
			issues.issue_editor AS editor,
			issues.issue_credits AS credits
		FROM #my.db.tableprefix#_Issues AS issues
		WHERE issues.issue_id = <cfqueryparam value="#attributes.issue#" cfsqltype="cf_sql_varchar" maxlength="37" />
	</cfquery>
</cfif>