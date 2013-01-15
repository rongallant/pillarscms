<cfquery name="qEntry" datasource="#my.db.dsn#">
	SELECT
		a.entryid,
		a.fk_scrollerid AS scrollerid,
		a.message,
		a.delay,
		a.url,
		a.target,
		a.font,
		a.txtcolor,
		a.txtsize,
		a.txtstyle,
		a.scrolltype
	FROM #my.db.tableprefix#_ScrollEntries AS a
	WHERE 0 = 1
</cfquery>