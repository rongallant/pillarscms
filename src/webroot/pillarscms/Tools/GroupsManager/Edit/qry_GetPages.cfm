<cfquery name="qPageList" datasource="#my.db.dsn#">
	SELECT a.pg_id AS pageid
	FROM #my.db.tableprefix#_pgPages AS a
	JOIN #my.db.tableprefix#_GroupsPages AS b
		ON b.fk_pageid = a.pg_id
	JOIN #my.db.tableprefix#_apps AS c
		ON c.id = b.fk_groupid
	WHERE c.type = 'pagegroup'
	<cfif fusebox.fuseaction eq "edit">
		AND b.fk_groupid = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.groupid#" />
	<cfelse>
		AND 0 = 1
	</cfif>
</cfquery>

<cfset request.pagelist = ValueList(qPageList.pageid) />