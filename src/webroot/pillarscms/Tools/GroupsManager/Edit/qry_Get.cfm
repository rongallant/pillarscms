<cfquery name="qGroup" datasource="#my.db.dsn#">
	SELECT
		a.id AS groupid,
		a.identifier,
		a.name,
		a.path,
		a.enabled,
		a.description
	FROM #my.db.tableprefix#_apps AS a
	<cfif fusebox.fuseaction eq "edit">
		WHERE a.id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.groupid#" />
	<cfelse>
		WHERE 0 = 1
	</cfif>
</cfquery>