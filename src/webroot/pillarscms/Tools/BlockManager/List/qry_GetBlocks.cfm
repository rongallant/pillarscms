<cfparam name="attributes.pageid" />
<cfquery name="qBlocks" datasource="#my.db.dsn#">
	SELECT
		a.blockid,
		a.blockidlist,
		a.layout,
		a.layoutarea,
		a.orderby,
		a.blocktitle,
		a.displaymode,
		a.orderby,
		b.blocktypeid,
		b.displayname,
		c.pg_id AS pageid,
		c.pg_title AS pagetitle
	FROM #my.db.tableprefix#_Blocks AS a
	JOIN #my.db.tableprefix#_BlockTypes AS b
		ON a.fk_blocktypeid = b.blocktypeid
	LEFT OUTER JOIN #my.db.tableprefix#_pgPages AS c
		ON a.fk_pageid = c.pg_id
	WHERE c.pg_id = '#attributes.pageid#'
	ORDER BY c.pg_title, a.layoutarea, a.orderby
</cfquery>