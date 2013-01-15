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

<cfquery name="qIssues" datasource="#my.db.dsn#">
	SELECT
		a.issue_id AS id,
		a.issue_startdate AS date,
		a.issue_editor AS editor,
		a.issue_credits AS credits,
		a.issue_enabled AS enabled
	FROM #my.db.tableprefix#_Issues AS a
	ORDER BY a.issue_startdate DESC
</cfquery>