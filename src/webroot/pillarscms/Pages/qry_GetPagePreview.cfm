<cfquery name="qPage" datasource="#my.db.dsn#">
	SELECT
		a.pg_title AS title,
		a.pg_Author AS author,
		a.pg_Content AS content,
		a.pg_DisplayMenu AS DisplayMenu,
		a.pg_DisplayNav AS DisplayNav,
		a.pg_id AS pageid,
		b.name as theme
	FROM #my.db.tablePrefix#_pgPages AS a
	LEFT OUTER JOIN #my.db.tablePrefix#_Layouts AS b
		ON a.fk_layoutid = b.layoutid
	<cfif isDefined('attributes.pageid') and len(attributes.pageid)>
		WHERE a.pg_id = <cfqueryparam value="#attributes.pageid#" cfsqltype="cf_sql_varchar" maxlength="37" />
	<cfelse>
		WHERE a.pg_isHome = 1
	</cfif>
</cfquery>