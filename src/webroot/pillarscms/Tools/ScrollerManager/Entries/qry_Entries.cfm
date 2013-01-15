<cfquery name="qEntries" datasource="#my.db.dsn#">
	SELECT
		a.entryid,
		a.fk_scrollerid AS scrollerid,
		a.linktext,
		a.linkurl,
		a.linktarget,
		a.txtfont,
		a.txtsize,
		a.txtcolor,
		a.txtbold,
		a.txtitalic,
		a.txtunderline
	FROM #my.db.tableprefix#_ScrollEntries AS a
	WHERE a.fk_scrollerid = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.scrollerid)#" />
	ORDER BY a.linktext
</cfquery>