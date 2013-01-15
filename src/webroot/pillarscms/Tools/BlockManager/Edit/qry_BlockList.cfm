<cfparam name="attributes.blockid" />

<cfquery name="qBlocks" datasource="#my.db.dsn#">
	SELECT
		blockid AS id,
		fk_pageid AS pageid,
		layoutarea,
		orderby
	FROM #my.db.tableprefix#_Blocks
	WHERE blockid = '#attributes.blockid#'
	ORDER BY orderby
</cfquery>