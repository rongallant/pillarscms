<cfquery name="qEntry" datasource="#my.db.dsn#">
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
	<cfif isDefined('attributes.entryid') and len(attributes.entryid)>
		WHERE a.entryid = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.entryid)#" />
	<cfelse>
		WHERE 0 = 1
	</cfif>
</cfquery>