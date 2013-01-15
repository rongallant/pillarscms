<cfquery name="GetMessage" datasource="#my.db.dsn#">
	SELECT
		a.id,
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
	WHERE a.pageid = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.pageid)#" />
</cfquery>