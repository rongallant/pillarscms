<cfquery name="qScroller" datasource="#my.db.dsn#">
	SELECT
		a.scrollerid,
		a.name,
		a.height,
		a.width,
		a.scrolltime,
		a.stoptime,
		a.bgcolor,
		a.notes
	FROM #my.db.tableprefix#_Scrollers AS a
	<cfif isDefined('attributes.scrollerid') and len(attributes.scrollerid)>
		WHERE a.scrollerid = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.scrollerid)#" />
	<cfelse>
		WHERE 0 = 1
	</cfif>
</cfquery>