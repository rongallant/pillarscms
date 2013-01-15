<cfquery name="qBlockPages" datasource="#my.db.dsn#">
	SELECT DISTINCT a.fk_pageid AS pageid,
		c.pg_title AS pagetitle
	FROM #my.db.tableprefix#_Blocks AS a
	JOIN #my.db.tableprefix#_BlockTypes AS b
		ON a.fk_blocktypeid = b.blocktypeid
	LEFT OUTER JOIN #my.db.tableprefix#_pgPages AS c
		ON a.fk_pageid = c.pg_id
	ORDER BY pg_title
</cfquery>