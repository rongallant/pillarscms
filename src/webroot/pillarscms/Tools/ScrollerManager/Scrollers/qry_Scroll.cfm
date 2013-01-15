<cfquery name="GetMessage" datasource="#my.db.dsn#">
	SELECT
		a.entryid,
		a.pageid,
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
	WHERE a.fk_scrollerid = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.scrollerid)#" />
</cfquery>