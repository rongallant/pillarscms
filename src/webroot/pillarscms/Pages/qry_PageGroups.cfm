<cfquery name="qGroup" datasource="#my.db.dsn#">
	SELECT a.fk_groupid AS groupid
	FROM #my.db.tablePrefix#_GroupsPages AS a
	WHERE a.fk_pageid = <cfqueryparam value="#qPage.pageid#" cfsqltype="cf_sql_varchar" maxlength="37" />
</cfquery>