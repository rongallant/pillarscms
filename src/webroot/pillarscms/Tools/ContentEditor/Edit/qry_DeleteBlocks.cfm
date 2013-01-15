<cfquery name="qDeleteBlocks" datasource="#my.db.dsn#">
	DELETE FROM #my.db.tablePrefix#_Blocks
	WHERE blockidlist = '#attributes.pageid#'
	OR fk_pageid = '#attributes.pageid#'
</cfquery>