<cfquery name="qPage" datasource="#my.db.dsn#">
	SELECT
		a.pg_id,
		a.parent_id,
		a.pg_link_name,
		a.pg_link_url,
		a.pg_LinkUrlTarget,
		a.pg_type AS pagetype,
		a.pg_title,
		a.pg_Content AS Content,
		a.pg_DisplayMenu,
		a.pg_DisplayNav,
		a.pg_order,
		a.pg_Author,
		a.pg_PublishDate,
		a.pg_RemoveDate,
		a.pg_isHome,
		a.pg_Schedule,		
		a.pg_Notes,
		a.pg_Enabled,
		a.cr_ts,
		a.cr_id,
		a.lu_ts,
		a.lu_id,
		b.layoutid,
		b.name AS pgTheme
	FROM #my.db.tablePrefix#_pgPages AS a
	LEFT OUTER JOIN #my.db.tablePrefix#_Layouts AS b
		ON a.fk_layoutid = b.layoutid
	<cfif ListContains("editLink,editPage",fusebox.fuseaction)>
		WHERE pg_id = '#attributes.pageid#'
	<cfelse>
		WHERE 1 = 0
	</cfif>
</cfquery>