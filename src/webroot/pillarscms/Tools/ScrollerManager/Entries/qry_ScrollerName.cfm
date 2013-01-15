<cfquery name="qScroller" datasource="#my.db.dsn#">
	SELECT
		a.scrollerid,
		a.name
	FROM #my.db.tableprefix#_Scrollers AS a
	WHERE a.scrollerid = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.scrollerid)#" />
</cfquery>