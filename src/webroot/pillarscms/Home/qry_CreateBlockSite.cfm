<cfquery name="qBlocks" datasource="#my.db.dsn#" cachedwithin="#my.db.querycacheshort#">
	SELECT
		a.blockid,
		a.fk_pageid,
		a.blocktitle,
		a.layout,
		a.layoutarea,
		a.orderby,
		a.blockidname,
		a.blockidlist,
		a.blockfuseaction,
		b.blockvarname
	FROM #my.db.tableprefix#_Blocks AS a
	JOIN #my.db.tableprefix#_BlockTypes AS b
		ON b.blocktypeid = a.fk_blocktypeid
	WHERE a.displaymode = 1
	ORDER BY a.orderby
</cfquery>