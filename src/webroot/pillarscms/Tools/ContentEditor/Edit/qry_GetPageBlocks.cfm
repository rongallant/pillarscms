<cfquery name="qBlocks" datasource="#my.db.dsn#">
	SELECT blockid, blocktitle
	FROM #my.db.tableprefix#_Blocks
	WHERE fk_pageid = '#qPage.pg_id#'
</cfquery>