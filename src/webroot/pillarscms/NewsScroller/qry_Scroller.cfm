<cfquery name="qNewsScroller" datasource="#my.db.dsn#">
	SELECT
		a.name,
		a.height,
		a.width,
		a.scrolltime,
		a.stoptime,
		a.bgcolor,
		b.linktext,
		b.linkurl,
		b.linktarget,
		b.txtfont,
		b.txtsize,
		b.txtcolor,
		b.txtbold,
		b.txtitalic,
		b.txtunderline
	FROM #my.db.tableprefix#_Scrollers AS a
	JOIN #my.db.tableprefix#_ScrollEntries AS b
		ON b.fk_scrollerid = a.scrollerid
	WHERE a.scrollerid = <cfqueryparam value="#attributes.scrollerid#" cfsqltype="cf_sql_varchar" maxlength="37" />
</cfquery>