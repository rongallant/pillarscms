<cfquery name="qBlock" datasource="#my.db.dsn#">
	SELECT b.displayname
	FROM #my.db.tableprefix#_Blocks AS a
		JOIN #my.db.tableprefix#_BlockTypes AS b
			ON a.fk_blocktypeid = b.blocktypeid
	WHERE a.fk_pageid = <cfqueryparam value="#attributes.pageid#" cfsqltype="cf_sql_varchar" maxlength="37" />
	ORDER BY a.layoutarea, b.orderby
</cfquery>