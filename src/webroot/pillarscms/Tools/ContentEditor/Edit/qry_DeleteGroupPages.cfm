<cfquery name="qDeleteGroupsPages" datasource="#my.db.dsn#">
	DELETE FROM #my.db.tablePrefix#_GroupsPages
	WHERE fk_pageid = '#attributes.pageid#'
</cfquery>