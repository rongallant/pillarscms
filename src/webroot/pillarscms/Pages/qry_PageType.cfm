<cfparam name="attributes.pagetype" />

<cfquery name="qPageType" datasource="#my.db.dsn#">
	SELECT
		a.pg_title AS title,
		a.pg_Author AS author,
		a.pg_Content AS content,
		a.pg_DisplayMenu AS DisplayMenu,
		a.pg_DisplayNav AS DisplayNav,
		a.pg_id AS pageid,
		b.name AS theme
	FROM #my.db.tablePrefix#_pgPages AS a
	LEFT OUTER JOIN #my.db.tablePrefix#_Layouts AS b
		ON a.fk_layoutid = b.layoutid
	WHERE a.pg_type = <cfqueryparam value="#attributes.pagetype#" cfsqltype="cf_sql_varchar" maxlength="10" />
		AND a.pg_Enabled = 1
		AND (
			(
				a.pg_Schedule = 1
				AND ( a.pg_PublishDate <= <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp" /> )
				AND ( a.pg_RemoveDate > <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp" /> )
			)
			OR ( a.pg_Schedule = 0 )
		)
</cfquery>